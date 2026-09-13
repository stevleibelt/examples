#!/usr/bin/python
####
# ref: https://docs.python.org/3/library/enum.html
####
# Contains example usage of StrEnum
####

from enum import StrEnum, auto

class MyEnum(StrEnum):
    bar = auto()
    foo = auto()


def test_if_value_exists_in_str_enum_using_error_handling(value_string: str) -> None:
    try:
        value = MyEnum(value_string)
    except ValueError:
        value = None

    print(f"{value_string=} results in {value=}")



def test_if_value_exists_in_str_enum_using_value_list(value_string: str) -> None:
    value_list: list[str] = [value for value in MyEnum]

    value: MyEnum | None = MyEnum(value_string) if value_string in value_list else None

    print(f"{value_string=} results in {value=}")


def main() -> None:
    print(":: Test if value exists in str enum using value list")
    for value in ("bar", "baz", "foo"):
        test_if_value_exists_in_str_enum_using_value_list(value_string=value)

    print("")
    print(":: Test if value exists in str enum using value list")
    for value in ("bar", "baz", "foo"):
        test_if_value_exists_in_str_enum_using_error_handling(value_string=value)
    print("")

if __name__ == '__main__':
    main()

