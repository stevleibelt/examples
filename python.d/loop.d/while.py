#!/usr/bin/python
####
# Example usage of while with break and exceptions
####
# @since: 2026-03-01
# @author: stev leibelt <artodeto@bazzline.net>
####

from random import random

def main() -> None:
    current_iteration: int = 0
    maximum_number_of_iterations: int = 3
    result: str | None = None

    while current_iteration < maximum_number_of_iterations:
        try:
            current_iteration += 1
            print(f"Starting {current_iteration=}")
            # Maybe raise an exception
            if random() < 0.5:
                raise RuntimeError("This is an error")
            result = "This is the result"
            break
        except RuntimeError as runtime_error:
            print(f"Excepted {type(runtime_error)=}")
            print(f"With error: {str(runtime_error)=}")
            if current_iteration >= maximum_number_of_iterations:
                print(f"{maximum_number_of_iterations=} reached. Abort trying.")
                raise runtime_error
        finally:
            if result:
                print(f"Recieved {result=}")
            else:
                print("No result recieved.")
        print("")

if __name__ == '__main__':
    main()
