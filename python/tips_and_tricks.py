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
#timestamp: 13:45
