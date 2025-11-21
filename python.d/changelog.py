####
# Simple changelog example done in pure python
####
# @since: 2025-11-21
# @author: stev leibelt <artodeto@bazzline.net>
####

from dataclasses import dataclass
from typing import Any

@dataclass
class Change:
    current: Any
    previous: Any


class Changelog:
    # Extend this dict to support event names or all changes done on one
    #   attribute
    changes: dict[str, Change]

    def __init__(self, changes: dict[str, Change] | None = None):
        self.changes = changes if changes else {}

    def __len__(self) -> int:
        return len(self.changes)

    def record_change(self, attribute_name: str, new_value: Any, obj: object):
        previous_value = (
            getattr(obj, attribute_name) if hasattr(obj, attribute_name) else None
        )

        if previous_value != new_value:
            # Only last change will be recorded
            self.changes[attribute_name] = Change(
                current=new_value, previous=previous_value
            )


class MyObject:
    bar: int | None
    changelog: Changelog
    foo: str | None

    def __init__(self, bar: int | None = None, changelog: Changelog | None = None, foo: str | None = None):
        self.bar = bar
        self.changelog = changelog if changelog is not None else Changelog()
        self.foo = foo


    def add_change(self, name: str, value: Any) -> None:
        # This could be a place to implement value [type] validation
        #   or extend MyObject from pydantic.BaseModel.
        if getattr(self, name) != value:
            self.changelog.record_change(attribute_name=name, new_value=value, obj=self)
            super().__setattr__(name, value)


    def get_change(self, attribute_name: str) -> Change | None:
        return (
            self.changelog.changes[attribute_name]
            if attribute_name in self.changelog.changes
            else None
        )


def main() -> None:
    my_first_object = MyObject()
    my_second_object = MyObject(bar=3, foo="foz")

    # Making some changes
    my_first_object.add_change(name="bar", value=1)
    my_first_object.add_change(name="bar", value=2)
    my_first_object.add_change(name="foo", value="faz")

    my_second_object.add_change(name="foo", value="fiz")

    # Make no changes
    my_second_object.add_change(name="bar", value=3)

    # Adding a non existing attribute would result into an error
    # my_second_object.add_change(name="baz", value="there is no foo without a bar")

    # Output
    print(f"{my_first_object.changelog.changes=}")
    print(f"{my_second_object.changelog.changes=}")

if __name__ == "__main__":
    main()
