import typer
from eventsourcing.application import Application
from eventsourcing.domain import Aggregate, event
from typing import Any
from uuid import UUID

# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part1.html
app = typer.Typer(name="part2")

class Dog(Aggregate):
    class HasBuiltASocialBond(Aggregate.Event):
        name: str

    class TrainedForAJob(Aggregate.Event):
        job_title: str

    # Without the @event, the default name for the
    #   initialisation is Created.
    @event("Born")
    def __init__(self, name: str) -> None:
        self.job_title: str | None = None
        self.learned_tricks: list[str] = []
        self.social_bonded_names: list[str] = []
        self.name: str = name

    def build_up_a_social_bond(self, name: str) -> None:
        print(f"   Evaluating of social bonding with {name=} is possible.")
        # Place for some business logic
        assert isinstance(name, str)
        assert len(name) > 1
        assert name != "Catwoman"

        self._add_social_bond(name=name)

    def has_a_job(self) -> bool:
        return self.job_title is not None

    def has_social_bonds(self) -> bool:
        return len(self.social_bonded_names) > 0

    @event("TrickLearned")
    def learn_trick(self, trick: str) -> None:
        self.learned_tricks.append(trick)

    @event(TrainedForAJob)
    def train_for_a_job(self, job_title: str) -> None:
        self.job_title = job_title

    @event(HasBuiltASocialBond)
    def _add_social_bond(self, name: str) -> None:
        self.social_bonded_names.append(name)



@app.command(name="1", help="aggregates in detail")
def app_aggregates_in_detail(
    be_verbose: bool = typer.Option(False, "--verbose", "-v"),
    dog_name: str = typer.Option("Fido")
) -> None:
    # Instantiation of a new object results in
    # Event "Created" is created and added to the 
    #   dog internal events list.
    # This way the event store gets notified of a 
    #   new creation and record this in its internal 
    #   forward log.
    dog = Dog(name=dog_name)

    assert isinstance(dog, Dog)
    assert isinstance(dog.id, UUID)
    assert dog.name == dog_name

    events = dog.collect_events()
    assert len(events) == 1
    # all values used in the event are accessable
    assert events[0].name == dog_name

    copy = events[0].mutate(None)

    assert copy is not None
    assert copy.id == dog.id
    assert id(copy) != id(dog)

    assert isinstance(Dog.Born, type)
    assert isinstance(events[0], Dog.Born)
    assert issubclass(Dog.Born, Aggregate.Created)

    if be_verbose:
        print(f"{dog.id=}")
        
        print(f":: Dumping events")
        for event in events:
            print(f"   {event=}")


@app.command(name="2", help="subsequent events")
def app_subsequent_events(
    be_verbose: bool = typer.Option(False, "--verbose", "-v"),
    dog_name: str = typer.Option("Fido"),
    learned_trick_name: str = typer.Option("roll over"),
) -> None:
    dog = Dog(name=dog_name)

    assert issubclass(Dog.TrickLearned, Aggregate.Event)
    assert dog.learned_tricks == []
    assert len(dog.learned_tricks) == 0

    dog.learn_trick(trick=learned_trick_name)
    events = dog.collect_events()

    assert len(dog.learned_tricks) == 1
    assert dog.learned_tricks == [learned_trick_name]
    assert len(events) == 2
    assert events[1].trick == learned_trick_name

    _dump_events(be_verbose=be_verbose, events=events)


@app.command(name="3", help="explicitly defined event classes")
def app_explicitly_defined_event_classes(
    be_verbose: bool = typer.Option(False, "--verbose", "-v"),
    dog_name: str = typer.Option("Fido"),
    job_title: str = typer.Option("Rescue dog"),
) -> None:
    dog = Dog(name=dog_name) 

    assert dog.has_a_job() is False

    dog.train_for_a_job(job_title=job_title)
    events = dog.collect_events()

    assert dog.has_a_job() is True

    assert len(events) == 2
    assert events[1].job_title == job_title

    _dump_events(be_verbose=be_verbose, events=events)


@app.command(name="4", help="decorating private methods")
def app_explicitly_defined_event_classes(
    be_verbose: bool = typer.Option(False, "--verbose", "-v"),
    dog_name: str = typer.Option("Fido"),
    social_bonded_name: str = typer.Option("Herbert"),
) -> None:
    dog = Dog(name=dog_name)

    assert dog.has_social_bonds() is False

    dog.build_up_a_social_bond(name=social_bonded_name)
    events = dog.collect_events()

    assert dog.has_social_bonds() is True

    assert len(events) == 2
    assert events[1].name == social_bonded_name

    _dump_events(be_verbose=be_verbose, events=events)

def _dump_events(be_verbose: bool, events: list[Aggregate.Event]) -> None:
    if be_verbose:
        print(f":: Dumping events")
        for event in events:
            print(f"   {event=}")


@app.command(name="5", help="exercises")
def app_exercises(
    be_verbose: bool = typer.Option(False, "--verbose", "-v"),
) -> None:

    class Todos(Aggregate):
        @event("Started")
        def __init__(self, name: str):
            self.name: str = name
            self.items: list[str] = []

        @event("ItemAdded")
        def add_item(self, item: str):
            self.items.append(item)

    def test() -> None:
        # Start a list of todos, and add some items.
        todos1 = Todos(name='Shopping list')
        todos1.add_item('bread')
        todos1.add_item('milk')
        todos1.add_item('eggs')

        # Check the state of the aggregate.
        assert todos1.name == 'Shopping list'
        assert todos1.items == [
            'bread',
            'milk',
            'eggs',
        ]

        # Check the aggregate events.
        events = todos1.collect_events()
        assert len(events) == 4
        assert isinstance(events[0], Todos.Started)
        assert events[0].name == 'Shopping list'
        assert isinstance(events[1], Todos.ItemAdded)
        assert events[1].item == 'bread'
        assert isinstance(events[2], Todos.ItemAdded)
        assert events[2].item == 'milk'
        assert isinstance(events[3], Todos.ItemAdded)
        assert events[3].item == 'eggs'
        _dump_events(be_verbose=be_verbose, events=events)

        # Reconstruct aggregate from events.
        copy = None
        for e in events:
            copy = e.mutate(copy)
        assert copy == todos1

        # Create and test another aggregate.
        todos2 = Todos(name='Household repairs')
        assert todos1 != todos2
        events = todos2.collect_events()
        assert len(events) == 1
        assert isinstance(events[0], Todos.Started)
        assert events[0].name == 'Household repairs'
        assert events[0].mutate(None) == todos2
        _dump_events(be_verbose=be_verbose, events=events)

    test()


