import typer

app = typer.Typer(name="Event sourcing example")

tutorial_app = typer.Typer()

app.add_typer(tutorial_app, name="tutorial")

# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part1.html
@tutorial_app.command(name="part-1")
def tutorial_app_part_one(
    added_trick_name: str = typer.Option("roll over"),
    be_verbose: bool = typer.Option(False, "--verbose", "-v"),
    dog_name: str = typer.Option("Fido"),
    registered_event_name: str = typer.Option("Registered"),
    trick_added_event_name: str = typer.Option("TrickAdded")
) -> None:
    from eventsourcing.application import Application
    from eventsourcing.domain import Aggregate, event
    from typing import Any
    from uuid import UUID

    class Dog(Aggregate):
        @event(registered_event_name)
        def __init__(self, name: str) -> None:
            self.name = name
            self.tricks: list[str] = []

        @event(trick_added_event_name)
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

    if be_verbose:
        print("")
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


if __name__ == "__main__":
    app()
