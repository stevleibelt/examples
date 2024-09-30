#@ref: https://www.youtube.com/watch?v=C-gEQdGVXbk
from functools import reduce

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
print('')

from datetime import datetime

print(":: Datetime from now")
print(f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
#show help page
#help(datetime)
#works in the cli only
#dir(datetime)  #lists all methods
#datetime.today #prints help about the method

print('')
#eo: secret information
#timestamp: 13:45

# ref: https://www.freecodecamp.org/news/python-one-liners/
#bo: create a list without four lines of for-loop code
print(':: Create a list without using for')
"""
# Traditional code as example
squared_numbers = []
for i in range(10):
    squared_numbers.append(i ** 2)
print(squared_numbers)
"""
squared_numbers = [i ** 2 for i in range(10)]
print(squared_numbers)
print('')
#eo: create a list without four lines of loop code

#bo: lambda function
print(':: Create a lambda function')
"""
# Traditional code as example
def add_numbers(x, y):
    return x + y

print(add_numbers(13, 42))
"""
# lambda <list of input variables>: function code that does/returns something
add = lambda x, y: x + y
print(add(13, 42))
print('')
#eo: lambda function

#bo: map and filter
"""
# Traditional code as example
fruits = ['apple', 'banana', 'cherry']
upper_case_loop = []
for fruit in fruits:
    upper_case_loop.append(fruit.upper())
print(upper_case_loop)
"""
print(':: Using map, filter and reduce instead of for loop')
# map performs an operation on every element of an iterable
upper_case = list(map(lambda x: x.upper(), ['apple', 'banana', 'cherry']))
print(upper_case)
# filter is used to select/choose elements based on a condition
words_containing_a = list(filter(lambda x: x.startswith('a'), ['apple', 'banana', 'cherry']))
print(words_containing_a)
# reduce that makes a calculation on a list to return a single value
sum_of_numbers = reduce(lambda x, y: x+y, [1, 2, 3, 4, 5])
print(sum_of_numbers)
print('')
#eo: map and filter
#bo: ternary operator
print(':: Using ternary operator instead of for loop')
"""
# Traditional code as example
result = None
num = 5
if num % 2 == 0:
    result = "Even"
else:
    result = "Odd"
"""
num = 7
result = "Even" if num % 2 == 0 else "Odd"
print(f'{num} is {result}')
print('')
#eo: ternary operator
#bo: zip function
print(':: Using zip instead of for loop')
"""
# Traditional code as example
students = ['Dilli', 'Vikram', 'Rolex', 'Leo']
grades = [85, 92, 78, 88]

student_grade_pairs = []
for i in range(len(students)):
    student_grade_pairs.append((students[i], grades[i]))

print(student_grade_pairs)
"""
students = ['Dilli', 'Vikram', 'Rolex', 'Leo']
grades = [85, 92, 78, 88]

student_grade_pairs = list(zip(students, grades))
print(student_grade_pairs)
print('')
#eo: zip function
#bo: enumerate
print(':: Enumerate instead of loop')
"""
# Traditional code as example
grocery_list = ['Apples', 'Milk', 'Bread', 'Eggs', 'Cheese']

for i in range(len(grocery_list)):
    print(f"{i}. {grocery_list[i]}")
"""
grocery_list = ['Apples', 'Milk', 'Bread', 'Eggs', 'Cheese']

for index, item in enumerate(grocery_list):
    print(f"{index}. {item}")
print('')
#eo: enumerate
#bo: string join
print(':: Using join for a string instead of a loop')
"""
# Traditional code as example
words = ['Python', 'is', 'awesome', 'and', 'powerful']

sentence = ''
for word in words:
    sentence += word + ' '

print(sentence.strip())  # Strip to remove the trailing space
"""
words = ['Python', 'is', 'awesome', 'and', 'powerful']

sentence = ' '.join(words)
print(sentence)
print('')
#eo: string join
#bo: unpacking
print(':: Using unpacking instead of a loop')
"""
# Traditional code as example
numbers = [1, 2, 3]

a = numbers[0]
b = numbers[1]
c = numbers[2]

print(a, b, c)
"""
numbers = [1, 2, 3]

a, b, c = numbers

print(a, b, c)
print('')
#eo: unpacking
