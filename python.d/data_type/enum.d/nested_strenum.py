#!/usr/bin/python
####
# ref: https://docs.python.org/3/library/enum.html
####
# Contains example of nested StrEnum
####

from enum import StrEnum, nonmember

class MyEnum(StrEnum):
    my_text = "My Text"

    @nonmember
    class MySubEnum:
        my_other_text = "This is another text"

print(f"{MyEnum.my_text=}")
print(f"{MyEnum.MySubEnum.my_other_text=}")
