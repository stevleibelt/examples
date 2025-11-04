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
    from eventsourcing.domain import Aggregate, event
    from uuid import UUID

    class Dog(Aggregate):
        @event(registered_event_name)
        def __init__(self, name: str) -> None:
            self.name = name
            self.tricks: list[str] = []

        @event(trick_added_event_name)
        def add_trick(self, trick: str) -> None:
            self.tricks.append(trick)
    
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


if __name__ == "__main__":
    app()
