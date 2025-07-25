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

exampleDictionary = {
        'foo': {
            'my_property': 'my first value'
            },
        'bar': {
            'my_property': 'my second value'
            }
    }

print(":: Printing content of >>exampleDictionary<<.")
print(exampleDictionary)
print("")

print(":: Printing all keys of >>exampleDictionary<<.")
print(list(exampleDictionary))
print("")

print(":: Printing type of >>exampleDictionary<<.")
print(type(exampleDictionary))
print("")

print(":: Iterating over values of >>exampleDictionary<<.")
for x in exampleDictionary:
    print("   Dumping values of key >>{}<<".format(x))
    print("   {}".format(exampleDictionary[x]))
print("")

print(":: Check if >>exampleDictionary<< contains >>foo<<.")
if "foo" in exampleDictionary:
    print("   >>exampleDictionary<< does contain >>foo<<.")
else:
    print("   >>exampleDictionary<< does not contain >>foo<<.")

# Merge two diretories
# firstDictionary.update(secondDictionary)
#   Result: first one gets updated
# `**` unpacks a dictionary
#   Unpack and merge the key and value pairs
# thirdDictionary = { **firstDictionary, **secondDictionary }
#from itertools import chain
# thirdDictionary = dict(chain(firstDictionary.items(), secondDictionary.items()))
#
#from collections import ChainMap
# thirdDictionary = dict(ChainMap(firstDictionary, secondDictionary))
# available since python 3.9
# thirdDictionary = firstDictionary | secondDictionary
# firstDictionary |= secondDictionary

