#!/usr/bin/python
####
# @see https://pimylifeup.com/python-sets/ - 20220527T15:11:40
# @since 202205-27
# @author stev leibelt <artodeto@bazzline.net>
####

exampleSet = {"Key Zero", 1, "Key Two", 3}

print(":: Printing content of >>exampleSet<<.")
print(exampleSet)
print("")

print(":: Printing type of >>exampleSet<<.")
print(type(exampleSet))
print("")

print(":: Iterating over values of >>exampleSet<<.")
for x in exampleSet:
    print(x)
print("")

print(":: Check if >>eampleSet<< contains >>foo<<.")
if "foo" in exampleSet:
    print("   >>exampleSet<< does contain >>foo<<.")
else:
    print("   >>exampleSet<< does not contain >>foo<<.")

#adding one value
exampleSet.add("foo")

#adding multiple values
exampleSet.update({"bar", "baz"})

#remove one value
exampleSet.remove("baz")

print(":: Printing content of >>exampleSet<<.")

#removing all values
exampleSet.clear()

#delete a set
del exampleSet

setOne = {"foo", "bar", "foobar"}
setTwo = {"foz", "baz", "foobar"}

print(":: Printing content of two sets.")
print(setOne)
print(setTwo)
print("")

print(":: Creating union of two sets.")
print(setOne.union(setTwo))
print("")

print(":: Creating intersection of two sets.")
print(setOne.intersection(setTwo))
print("")

print(":: Creating difference of set one to set two.")
print(setOne.difference(setTwo))
print("")

print(":: Creating symetric difference of set one to set two.")
print(setOne.symmetric_difference(setTwo))
print("")

