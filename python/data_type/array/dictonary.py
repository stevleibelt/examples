#!/usr/bin/python
####
# It is best to think of a dictionary as a set of key: value pairs, with the requirement that the keys are unique (within one dictionary). [...]
#   The main operations on a dictionary are storing a value with some key and extracting the value given the key.
# ref: https://docs.python.org/3/tutorial/datastructures.html#dictionaries - 20230403T08:58:10
####
# @since 20230403
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

