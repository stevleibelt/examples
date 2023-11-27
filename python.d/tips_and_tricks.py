#@ref: https://www.youtube.com/watch?v=C-gEQdGVXbk

#bo: conditions
condition = True

if condition:
    x = 1
else:
    x = 0

print(x)

x = 1 if condition else 0

print(x)
#eo: conditions

#bo: add
num1 = 10000000000
num2 = 100000000

total = num1 + num2

print(total)

num1 = 10_000_000_000
num2 = 100_000_000

total = num1 + num2

print(total)
print(f'{total:,}')
#eo: add

#bo: files
f = open('.foo.txt', 'r')
file_contents = f.read()
f.close()
#better
##better
with open('.foo.txt', 'r') as f:
    file_contentes = f.read()

words = file_contents.split('  ')
word_count = len(words)
print(word_count)
##better
#eo: files

#bo: iterating over array
array_of_names = ['Foo', 'Bar', 'Foobar', 'Baz']

iterator = 0
for current_name in array_of_names:
    print(iterator, current_name)
    ++iterator
##better
for iterator, current_name in enumerate(array_of_names):
    print(iterator, current_name)
#eo: iterating over array

#bo: iterate over two lists at once
first_names = ['Heinz', 'Maximilian']
last_names = ['Erhardt', 'Knabe']

#zip can handle more than two lists
#zip stops iterating when the shortest lists ends
for current_first_name, current_last_name in zip(first_names, last_names):
    print(f'{current_first_name} {current_last_name}')

for value in zip(first_names, last_names):
    print(value)
#eo: iterate over two lists at once

#bo: unpacking
print(':: Unpacking')
print("  both")
a, b = (1, 2)
print(a)
print(b)
# just assign the variable you need
a, _ = (1, 2)
print(a)

print("  second only")
_, b = (1, 2)
print(b)

print("  first only")
#*_ can be used to fetch all the comming things
a, *_ = (1,2,4,5)
print(a)

print("  first and last")
a, *_, b = (1,2,3,4,5,42)
print(a)
print(b)

print('')
#eo: unpacking

#bo: class
print(':: classes')
class Person():
    pass

person = Person()
foo = 'bar'

person.first = 'arto'
person.last = 'deto'

setattr(person, foo, 'foo') #add dynamic attribute

for key, value in {'first': 'Foo', 'last': 'Bar', 'Age': 42}.items():
    setattr(person, key, value)

for key in {'first': 'Foo', 'last': 'Bar', 'Age': 42}.keys():
    print(getattr(person, key))
print('')
#eo: class

#bo: secret information
from getpass import getpass

print(':: Secret informations')
username = input('Username: ')
password = getpass('Password: ')

from datetime import datetime

#show help page
#help(datetime)
#works in the cli only
#dir(datetime)  #lists all methods
#datetime.today #prints help about the method

print('')
#eo: secret information
#timestamp: 13:45
