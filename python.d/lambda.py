####
# Simple lambda examples
####
# @since: 2025-11-27
# @author: stev leibelt <artodeto@bazzline.net>
####

from typing import Callable

def main() -> None:
    # Define a lambda with one argument as list and a bool as return type
    single_value_check: Callable[[list | set | tuple], bool] = lambda a: len(a) == 1

    print(":: Calling same lambda with values")
    print(f"{single_value_check([])=}")
    print(f"{single_value_check(())=}")
    print(f"{single_value_check([1])=}")
    print(f"{single_value_check([1, 2])=}")
    print(f"{single_value_check((1, 2, 3))=}")

if __name__ == "__main__":
    main()
