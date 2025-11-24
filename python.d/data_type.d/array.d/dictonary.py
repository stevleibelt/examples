#!/usr/bin/python
####
# It is best to think of a dictionary as a set of key: value pairs, with the requirement that the keys are unique (within one dictionary). [...]
#   The main operations on a dictionary are storing a value with some key and extracting the value given the key.
# ref:
#   https://docs.python.org/3/tutorial/datastructures.html#dictionaries - 20230403
#   https://www.freecodecamp.org/news/python-merge-dictionaries-merging-two-dicts-in-python/ - 20230514
####
# @since 2023-04-03
# @author stev leibelt <artodeto@bazzline.net>
####

from itertools import (
    chain,
    islice
)

def main() -> None:
    example_dictionary = {
            "foo": {
                "my_property": "my first value"
                },
            "bar": {
                "my_property": "my second value"
                }
        }

    print(":: Printing content of >>example_dictionary<<.")
    print(example_dictionary)
    print("")

    print(":: Printing all keys of >>example_dictionary<<.")
    print(list(example_dictionary))
    print("")

    print(":: Printing type of >>example_dictionary<<.")
    print(type(example_dictionary))
    print("")

    print(":: Iterating over values of >>example_dictionary<<.")
    for x in example_dictionary:
        print("   Dumping values of key >>{}<<".format(x))
        print("   {}".format(example_dictionary[x]))
    print("")

    print(":: Check if >>example_dictionary<< contains >>foo<<.")
    if "foo" in example_dictionary:
        print("   >>example_dictionary<< does contain >>foo<<.")
    else:
        print("   >>example_dictionary<< does not contain >>foo<<.")

    # Merge two diretories
    # first_dictionary.update(second_dictionary)
    #   Result: first one gets updated
    # `**` unpacks a dictionary
    #   Unpack and merge the key and value pairs
    # thirdDictionary = { **first_dictionary, **second_dictionary }
    #from itertools import chain
    # thirdDictionary = dict(chain(first_dictionary.items(), second_dictionary.items()))
    #
    #from collections import ChainMap
    # thirdDictionary = dict(ChainMap(first_dictionary, second_dictionary))
    # available since python 3.9
    # thirdDictionary = first_dictionary | second_dictionary
    # first_dictionary |= second_dictionary

    print(":: Chain example")
    first_iterable = [1, 3, 5]
    second_iterable = [2, 4, 6]

    my_chain = chain(first_iterable, second_iterable)

    for value in my_chain:
        print(f"{value=}")

    print("")
    limit: int = 4
    print(f":: Limit chain combined result to {limit=}")

    my_limited_chain = islice(chain(first_iterable, second_iterable), limit)
    for value in my_limited_chain:
        print(f"{value=}")

    print("")

if __name__ == "__main__":
    main()
