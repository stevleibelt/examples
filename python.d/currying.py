#!/usr/bin/python
####
# Currying is a functional approach that turns a method with multiple arguments
#   into a chain of functions with a single argument.
####
# ref: https://www.youtube.com/watch?v=eRGlksqD6j4
# @since: 2026-01-30
# @author: stev leibelt <artodeto@bazzline.net>
####

from functools import partial
from typing import Callable


def multiply_setup(i: int) -> Callable[[int], int]:
    def multiply(j: int) -> int:
        return i * j

    return multiply


def multiply(i: int, j: int) -> int:
    return i * j


# Following code works since python 3.12
type FinalPrice = Callable[[float], float]
type DiscountFactory = Callable[[float], FinalPrice]


def apply_vat(tax_rate: float) -> DiscountFactory:
    def apply_discount(discount_amount: float) -> FinalPrice:
        def calculate_final_price(price: float) -> float:
            return (price - discount_amount) * (1 + tax_rate)

        return calculate_final_price

    return apply_discount


def main() -> None:
    print(":: Pure curry example")

    double_the_number = multiply_setup(2)
    tripple_the_number = multiply_setup(3)

    print(f"{double_the_number(2)=}")
    print(f"{tripple_the_number(3)=}")

    print("")
    print(":: Using functools")
    double_the_number = partial(multiply, 2)
    tripple_the_number = partial(multiply, i=3)

    print(f"{double_the_number(2)=}")
    print(f"{tripple_the_number(j=3)=}")

    print("")
    print(":: Using type system from python 3.12 and above")

    discount_factory: DiscountFactory = apply_vat(tax_rate=0.21)

    apply_black_friday_discount: FinalPrice = discount_factory(-100)
    apply_christmas_friday_discount: FinalPrice = discount_factory(-50)
    apply_regular_discount: FinalPrice = discount_factory(20)

    my_product_base_prize: int = 299

    print(f"{my_product_base_prize=}")
    print(f"{apply_black_friday_discount(my_product_base_prize)=:.2f}")
    print(f"{apply_christmas_friday_discount(my_product_base_prize)=:.2f}")
    print(f"{apply_regular_discount(my_product_base_prize)=:.2f}")

if __name__ == '__main__':
    main()
