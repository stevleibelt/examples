import typer
from dataclasses import dataclass
from eventsourcing.application import AggregateNotFoundError, Application, ProcessingEvent
from eventsourcing.cryptography import AESCipher
from eventsourcing.dispatch import singledispatchmethod
from eventsourcing.domain import Aggregate, DomainEventProtocol, event
from eventsourcing.system import MultiThreadedRunner, ProcessApplication, Runner, SingleThreadedRunner, System
from eventsourcing.utils import EnvType
from os import environ
from time import sleep
from typing import Any
from uuid import NAMESPACE_URL, UUID, uuid5

# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part5.html
app = typer.Typer(name="part5")


## bo: first application domain
class Dog(Aggregate):
    @dataclass(frozen=True)
    class Registered(Aggregate.Created):
        name: str

    @dataclass(frozen=True)
    class TrickAdded(Aggregate.Event):
        trick: str

    @staticmethod
    def create_id(name: str) -> UUID:
        return uuid5(NAMESPACE_URL, f"/dogs/{name}")

    @event(Registered)
    def __init__(self, name: str):
        self.name: str = name
        self.tricks: list[str] = []

    @event(TrickAdded)
    def add_trick(self, trick: str):
        self.tricks.append(trick)


class DogSchool(Application[UUID]):
    def register_dog(self, name: str) -> None:
        dog = Dog(name=name)
        self.save(dog)

    def add_trick(self, name: str, trick: str) -> None:
        dog: Dog = self.repository.get(Dog.create_id(name))
        dog.add_trick(trick=trick)
        self.save(dog)

    def get_dog_as_dict(self, name: str) -> dict[str, Any]:
        dog: Dog = self.repository.get(Dog.create_id(name))
        return {"name": dog.name, "tricks": tuple(dog.tricks)}
## eo: first application domain


## bo: second application domain
class Counter(Aggregate):
    def __init__(self, name: str):
        self.name: str = name
        self.count: int = 0

    @staticmethod
    def create_id(name: str) -> UUID:
        return uuid5(NAMESPACE_URL, f"/counters/{name}")

    @event("Incremented")
    def increment(self) -> None:
        self.count += 1


class Counters(ProcessApplication[UUID]):
    @singledispatchmethod
    def policy(self, domain_event: DomainEventProtocol[UUID], processing_event: ProcessingEvent[UUID]) -> None:
        """Default policty"""

    @policy.register
    def _(self, domain_event: Dog.TrickAdded, processing_event: ProcessingEvent[UUID]) -> None:
        trick = domain_event.trick
        try:
            counter_id = Counter.create_id(trick)
            counter: Conter = self.repository.get(counter_id)
        except AggregateNotFoundError:
            counter = Counter(trick)

        counter.increment()
        processing_event.collect_events(counter)

    def get_count(self, trick: str) -> int:
        counter_id = Counter.create_id(trick)
        try:
            counter: Counter = self.repository.get(counter_id)
        except AggregateNotFoundError:
            return 0
        return counter.count
## bo: second application domain

def test(system: System, runner_class: type[Runner[UUID]], wait: float = 0.0, env: EnvType | None = None) -> None:

    # Start running the system.
    runner = runner_class(system, env=env)
    runner.start()

    # Get the application objects.
    school = runner.get(DogSchool)
    counters = runner.get(Counters)

    # Generate some events.
    school.register_dog('Billy')
    school.register_dog('Milly')
    school.register_dog('Scrappy')

    school.add_trick('Billy', 'roll over')
    school.add_trick('Milly', 'roll over')
    school.add_trick('Scrappy', 'roll over')

    # Wait in case events are processed asynchronously.
    sleep(wait)

    # Check the results of processing the events.
    assert counters.get_count('roll over') == 3
    assert counters.get_count('fetch ball') == 0
    assert counters.get_count('play dead') == 0

    # Generate more events.
    school.add_trick('Billy', 'fetch ball')
    school.add_trick('Milly', 'fetch ball')

    # Check the results.
    sleep(wait)
    assert counters.get_count('roll over') == 3
    assert counters.get_count('fetch ball') == 2
    assert counters.get_count('play dead') == 0

    # Generate more events.
    school.add_trick('Billy', 'play dead')

    # Check the results.
    sleep(wait)
    assert counters.get_count('roll over') == 3
    assert counters.get_count('fetch ball') == 2
    assert counters.get_count('play dead') == 1

    # Stop the runner.
    runner.stop()

@app.command(name="1", help="defining an event driven system")
def app_defining_an_event_driven_system(
    be_verbose: bool = typer.Option(False, "--verbose", "-v")
) -> None:
    # Define a pipeline with the a stage sequence of DogSchool and Counters
    system = System(pipes=[[DogSchool, Counters]])

    # Nodes will be instantiated as applications
    assert list(system.nodes) == ["DogSchool", "Counters"]
    # Edges shows who leads and who follows each other
    # Who depends upon who
    assert system.edges == [("DogSchool", "Counters")]

    if be_verbose:
        print(f"{system.nodes=}")
        print(f"{system.edges=}")


@app.command(name="2", help="running an event driven system")
def app_running_an_event_driven_system(
    be_verbose: bool = typer.Option(False, "--verbose", "-v")
) -> None:
    # Single threaded runner
    system = System(pipes=[[DogSchool, Counters]])
    test(system=system, runner_class=SingleThreadedRunner)
    if be_verbose:
        print("Tested SingleThreadedRunner")

    # Multi threaded runner
    system = System(pipes=[[DogSchool, Counters]])
    test(system=system, runner_class=MultiThreadedRunner, wait=0.1)
    if be_verbose:
        print("Tested MultiThreadedRunner")


@app.command(name="3", help="running in an sqlite environment")
def app_running_an_event_driven_system(
    be_verbose: bool = typer.Option(False, "--verbose", "-v")
) -> None:
    # Set database backend
    environ["PERSISTENCE_MODULE"] = "eventsourcing.sqlite"

    # Set in-memory database for each application
    environ["SQLITE_NAME"] = ":memory:"

    # Define named in-memory databases for each application with shared cache
    environ['DOGSCHOOL_SQLITE_DBNAME'] = 'file:dogschool?mode=memory&cache=shared'
    environ['COUNTERS_SQLITE_DBNAME'] = 'file:counters?mode=memory&cache=shared'

    # Run the test
    system = System(pipes=[[DogSchool, Counters]])
    # No need to wait since we can not process in parallel
    test(system=system, runner_class=SingleThreadedRunner)
    if be_verbose:
        print("Tested in memory sqlite environment with SingleThreadedRunner")

    system = System(pipes=[[DogSchool, Counters]])
    # In MultiThreadedRunner, we need to wait that things are finished
    test(system=system, runner_class=MultiThreadedRunner, wait=0.2)
    if be_verbose:
        print("Tested in memory sqlite environment with MultiThreadedRunner")

    # Generate a cipher key, keep this save once created
    #   and configure it somewhere.
    cipher_key = AESCipher.create_key(num_bytes=32)

    # Adapt environment
    environ["CIPHER_KEY"] = cipher_key
    # Enable encryption
    environ['CIPHER_TOPIC'] = 'eventsourcing.cryptography:AESCipher'
    # Enable compression
    environ["COMPRESS_TOPIC"] = "eventsourcing.compressor:ZlibCompressor"

    system = System(pipes=[[DogSchool, Counters]])
    test(system=system, runner_class=SingleThreadedRunner)

    # Example what can be done, if this is not a in memory database
    # assert DogSchool().get_dog_as_dict('Scrappy')['tricks'] == ('roll over',)
    # assert Counters().get_count('roll over') == 3

    if be_verbose:
        print("Tested in memory sqlite environment with SingleThreadedRunner")
        print(f"   With encryption {cipher_key=}")
        print(f"   With compression")


@app.command(name="4", help="excercise")
def app_running_an_event_driven_system(
    be_verbose: bool = typer.Option(False, "--verbose", "-v")
) -> None:
    """
    Write a system that has a Game application with Player aggregates that have
    a score which can be updated, that is followed by a HallOfFame
    application that processes the score update events into an event-sourced
    HighScoreTable aggregate that keeps a list of the top three scores.
    """
    class Player(Aggregate):
        @event("Created")
        def __init__(self, name: str):
            self.name: str = name
            self.score: int = 0

        @staticmethod
        def create_id(name: str) -> UUID:
            return uuid5(NAMESPACE_URL, f"/player/{name}")

        @event("ScoreDecreased")
        def decrease_score(self, removed_score: int) -> None:
            self.score -= removed_score

        @event("ScoreIncreased")
        def increase_score(self, added_score: int) -> None:
            self.score += added_score



    class Game(Application[UUID]):
        def register_player(self, name: str) -> None:
            player: Player = Player(name=name)
            self.save(player)

        def decrease_score(self, name: str, removed_score: int) -> None:
            player: Player = self.repository.get(Player.create_id(name))
            player.decrease_score(removed_score=removed_score)
            self.save(player)

        def increase_score(self, name: str, added_score: int) -> None:
            player: Player = self.repository.get(Player.create_id(name))
            player.increase_score(added_score=added_score)
            self.save(player)


    class HighScoreTable(Aggregate):
        def __init__(self, name: str):
            self.name: str = name
            self.high_score_table: dict[str, int] = {}

        @staticmethod
        def create_id(name: str) -> UUID:
            return uuid5(NAMESPACE_URL, f"/high_score_table/{name}")

        @event("Update")
        def update(self, player_name: str, current_score: int) -> None:
            ...



    class HallOfFame(Application[UUID]):
        ...


    system = System(pipes=[[Game]])
    runner = SingleThreadedRunner(system=system)

    runner.start()

    game = runner.get(Game)

    # Add events
    game.register_player(name="Anarki")
    game.register_player(name="Crash")

    game.increase_score(name="Anarki", added_score=10)
    game.increase_score(name="Crash", added_score=7)
    game.decrease_score(name="Anarki", removed_score=3)
    game.increase_score(name="Crash", added_score=6)

    game_notifications = game.notification_log.select(start=0, limit=10)

    if be_verbose:
        print(":: Dumping game notifications")
        for game_notification in game_notifications:
            print(f"   {game_notification=}")



if __name__ == "__main__":
    app()

