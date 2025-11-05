import typer
from eventsourcing.application import Application
from eventsourcing.domain import Aggregate, event
from typing import Any
from uuid import UUID

class Dog(Aggregate):
    @event("Registered")
    def __init__(self, name: str) -> None:
        self.name = name
        self.tricks: list[str] = []

    @event("TrickAdded")
    def add_trick(self, trick: str) -> None:
        self.tricks.append(trick)

class DogSchool(Application[UUID]):
    def register_dog(self, name: str) -> UUID:
        dog = Dog(name=name)
        self.save(dog)
        return dog.id
    
    def add_trick(self, dog_id: UUID, trick: str) -> None:
        dog: Dog = self.repository.get(dog_id)
        dog.add_trick(trick=trick)
        self.save(dog)

    def get_dog_as_dict(self, dog_id: UUID) -> dict[str, Any]:
        dog: Dog = self.repository.get(dog_id)
        return {"name": dog.name, "tricks": tuple(dog.tricks)}


app = typer.Typer(name="Event sourcing example")

# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part1.html
@app.command(name="1", help="demonstrate aggregate")
def app_aggregate_example(
    added_trick_name: str = typer.Option("roll over"),
    be_verbose: bool = typer.Option(False, "--verbose", "-v"),
    dog_name: str = typer.Option("Fido"),
) -> None:
    if be_verbose:
        print(":: Demonstrating a aggregate")
    
    dog = Dog(name=dog_name)
    assert isinstance(dog, Dog)
    assert isinstance(dog, Aggregate)

    assert dog.name == dog_name
    assert dog.tricks == []

    assert isinstance(dog.id, UUID)

    if be_verbose:
        print(":: Created dog")
        print(f"   {dog=}")

    dog.add_trick(trick=added_trick_name)
    assert dog.tricks == [added_trick_name]

    if be_verbose:
        print(":: Added trick")
        print(f"   {dog=}")

    events = dog.collect_events()

    copy = None

    if be_verbose:
        print(":: Listing events with mutated copy object")

    for event in events:
        assert isinstance(event, Dog.Event)
        if be_verbose:
            print(f"   Current state: {copy=}")
            print(f"   Event to be applied to: {event=}")
        copy = event.mutate(copy)
    
    if be_verbose:
        print(f"   Final state: {copy=}")

    assert copy == dog

@app.command(name="2", help="Demonstrate application")
def app_application_example(
    added_trick_name: str = typer.Option("roll over"),
    be_verbose: bool = typer.Option(False, "--verbose", "-v"),
    dog_name: str = typer.Option("Fido"),
) -> None:
    if be_verbose:
        print(":: Demonstrating an application")

    application = DogSchool()

    dog_id = application.register_dog(name=dog_name)
    if be_verbose:
        print(f"   Registered {dog_id=}")

    application.add_trick(dog_id=dog_id, trick=added_trick_name)

    dog_as_dict = application.get_dog_as_dict(dog_id=dog_id)

    if be_verbose:
        print(f"   {dog_as_dict=}")

    assert dog_as_dict["name"] == dog_name
    assert dog_as_dict["tricks"] == (added_trick_name, )

    notifications = application.notification_log.select(start=1, limit=10)

    assert len(notifications) == 2
    assert notifications[0].id == 1
    assert notifications[1].id == 2

    if be_verbose:
        for notification in notifications:
            print(f"   {notification=}")


@app.command(name="3", help="Demonstrate unit tests")
def app_unittest_example(
    added_trick_name: str = typer.Option("roll over"),
    be_verbose: bool = typer.Option(False, "--verbose", "-v"),
    dog_name: str = typer.Option("Fido"),
) -> None:
    if be_verbose:
        print(":: Demonstrating unit tests")

    import unittest

    def test_dog_school() -> None:
        app = DogSchool()

        dog_id = app.register_dog(name=dog_name)

        if be_verbose:
            print(f"   Testing if name is equal to {dog_name} and that trick is an empty tuple")

        assert app.get_dog_as_dict(dog_id) == {
            'name': dog_name,
            'tricks': (),
        }

        if be_verbose:
            print(f"   Testing if {added_trick_name=} can be added")

        app.add_trick(dog_id, trick=added_trick_name)

        assert app.get_dog_as_dict(dog_id) == {
            'name': dog_name,
            'tricks': (added_trick_name, ),
        }

    test_dog_school()


if __name__ == "__main__":
    app()
