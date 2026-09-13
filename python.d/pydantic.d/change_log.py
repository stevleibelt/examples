# Pydantics design preference is to create immutable objects.
# A change should result into a new object.

from pydantic import BaseModel, ConfigDict, Field, model_validator
from time import time
from typing import Any, Generic, TypeVar

T = TypeVar("T", bound="BaseChangeModel")


class ChangeLogEntry(BaseModel):
    model_config = ConfigDict(frozen=True)
    name: str
    new_value: Any
    old_value: Any
    timestamp: float


class BaseChangeModel(BaseModel, Generic[T]):
    # Exclude=True indicates that this are internal fields
    change_log: list[ChangeLogEntry] = Field(default_factory=list, exclude=True)
    initial_data: dict[str, Any] = Field(default_factory=dict, exclude=True)
    model_config = ConfigDict(frozen=True)

    def update(self, **kwargs) -> T:
        # If you want log all the changes on an attribute, uncomment the
        #   next line
        # change_log = self.change_log.copy()
        # If you want to log only the latest change, keep the
        #   next line
        change_log = []
        current_timestamp: int = time()

        initial_data = self.initial_data.copy() if self.initial_data else self.model_dump()

        new_data = initial_data.copy()

        for key, new_value in kwargs.items():
            old_value = new_data.get(key)

            if old_value is not None and old_value != new_value:
                change_log.append(
                    ChangeLogEntry(
                        name=key,
                        new_value=new_value,
                        old_value=old_value,
                        timestamp=current_timestamp
                    )
                )

        new_data.update(kwargs)
        new_data["initial_data"] = initial_data
        new_data["change_log"] = change_log

        new_instance: T = self.__class__(**new_data)

        return new_instance


class MyModel(BaseChangeModel):
    age: int
    name: str


def main():
    my_model_1 = MyModel(age=21, name="foo bar")
    print(f"{my_model_1.change_log=}")

    # Add a non existing key won't break the model
    my_model_2 = my_model_1.update(age=42, name="foz baz", lord="mix master")
    print(f"{my_model_2.change_log=}")

    my_model_3 = my_model_2.update(age=13, name="fiz biz")
    print(f"{my_model_3.change_log=}")


if __name__ == "__main__":
    main()
