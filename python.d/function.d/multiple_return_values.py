####
# A lot of function examples (possible maybe)
####
# @since: 2024-10-18
# @author: stev leibelt <artodeto@bazzline.net>
####
from dataclasses import dataclass
from typing import Tuple


@dataclass
class MyFirstDto:
    name: str
    id: int


@dataclass
class MySecondDto(MyFirstDto):
    yes_or_no: bool


def multiple_return_values() -> Tuple[MyFirstDto, MySecondDto]:
    return MyFirstDto(name="first", id=1), MySecondDto(name="second", id=2, yes_or_no=True)


def main() -> None:
    # Note
    # Following line is not valid python
    # my_first_dto: MyFirstDto, my_second_dto: MySecondDto = multiple_return_values()
    my_first_dto , my_second_dto = multiple_return_values()

    print(my_first_dto)
    print(my_second_dto)


if __name__ == '__main__':
    main()
