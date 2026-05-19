####
# Simple change log example done in pure python
####
# @since: 2025-11-21
# @author: stev leibelt <artodeto@bazzline.net>
####

from dataclasses import dataclass, field
from typing import Any

@dataclass(frozen=True)
class Change:
    current: Any
    previous: Any


@dataclass(frozen=True)
class ChangeLog:
    # Extend this dict to support event names or all changes done on one
    #   attribute
    _changes: dict[str, Change] = field(default_factory=dict)


    def __len__(self) -> int:
        return len(self._changes)



    def get_change(self, attribute_name: str) -> Change | None:
        return (
            self.change_log.changes[attribute_name]
            if attribute_name in self.change_log.changes
            else None
        )


    def record_change(self, attribute_name: str, new_value: Any, obj: object):
        previous_value = (
            getattr(obj, attribute_name) if hasattr(obj, attribute_name) else None
        )

        if previous_value != new_value:
            # Only last change will be recorded, existing one will be overwritten
            self._changes[attribute_name] = Change(
                current=new_value, previous=previous_value
            )


class MyObject:
    _bar: int | None
    _change_log: ChangeLog
    _foo: str | None

    def __init__(self, bar: int | None = None, change_log: ChangeLog | None = None, foo: str | None = None):
        self._change_log = change_log if change_log is not None else ChangeLog()
        self._bar = bar
        self._foo = foo


    @property
    def bar(self) -> int | None:
        return self._bar


    @bar.setter
    def bar(self, value: int) -> None:
        self._add_change_and_set_value(name="_bar", value=value)


    @property
    def change_log(self) -> ChangeLog:
        return self._change_log


    @property
    def foo(self) -> str | None:
        return self._foo


    @foo.setter
    def foo(self, value: str) -> None:
        self._add_change_and_set_value(name="_foo", value=value)


    def _add_change_and_set_value(self, name: str, value: Any) -> None:
        # This could be a place to implement value [type] validation
        #   or extend MyObject from pydantic.BaseModel.
        self.change_log.record_change(attribute_name=name, new_value=value, obj=self)
        super().__setattr__(name, value)


def main() -> None:
    my_first_object = MyObject()
    my_second_object = MyObject(bar=3, foo="foz")

    # Making some changes
    my_first_object.bar=1
    my_first_object.bar=2
    my_first_object.foo="faz"

    my_second_object.foo="fiz"

    # Make no changes
    my_second_object.bar=3

    # Adding a non existing attribute would result into an error
    my_second_object.baz="there is no foo without a bar"

    # Output
    print(f"{my_first_object.change_log=}")
    print(f"{my_second_object.change_log=}")


if __name__ == "__main__":
    main()
