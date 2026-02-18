#!/usr/bin/python
####
# Example usage of iterators with a nested object list.
####
# ref: https://docs.python.org/3/library/itertools.html
# @since: 2026-02-13
# @author: stev leibelt <artodeto@bazzline.net>
####
from collections.abc import Iterable, Iterator


class Task:
    def __init__(self, name: str):
        self.name = name


class TaskIterator(Iterator):
    def __init__(self, nested_task_list: list[list[Task]]):
        self._nested_task_list_length: int = len(nested_task_list)
        self._nested_index_to_task_list_length: dict[int, int] = {}
        self._nested_task_list = nested_task_list
        self._next_nested_index: int = 0
        self._next_task_index: int = 0
        self._task_index_map: dict[Task, set(int, int)] = {}

        for i, task_list in enumerate(self._nested_task_list):
            self._nested_index_to_task_list_length[i] = len(task_list)
            for j, task in enumerate(task_list):
                if task in self._task_index_map:
                    raise ValueError(f"Can not add {task.name=} twice")

                self._task_index_map[task] = (i, j)

    def __iter__(self):
        return self


    def set_next_index(self, task: Task) -> None:
        if not task in self._task_index_map:
            raise ValueError(f"{task.name} not in collection")

        nested_index, task_index = self._task_index_map[task]

        self._next_task_index = nested_index + 1
        self._next_task_index = task_index + 1


    def __next__(self) -> list[Task]:
        print(f"__next__: {self._next_nested_index=}")
        print(f"__next__: {self._next_task_index=}")
        if self._next_nested_index not in self._nested_index_to_task_list_length:
            raise StopIteration()

        print(f"__next__: {self._nested_index_to_task_list_length[self._next_nested_index]=}")
        if self._next_task_index >= self._nested_index_to_task_list_length[self._next_nested_index]:
            print("__next__: Jumping to next nested list")
            self._next_nested_index += 1
            self._next_task_index = 0

        print(f"__next__: {self._next_nested_index=}")
        print(f"__next__: {self._next_task_index=}")
        if self._next_nested_index >= self._nested_task_list_length:
            print("__next__: StopIteration")
            raise StopIteration()

        task_index = self._next_task_index
        self._next_task_index += 1
        print(f"__next__: {self._next_task_index=}")
        print(f"__next__: {self._nested_task_list[self._next_nested_index][task_index].name=}")

        return self._nested_task_list[self._next_nested_index][task_index]



class TaskListIterator(Iterator):
    def __init__(self, nested_task_list: list[list[Task]]):
        self._length: int = len(nested_task_list)
        self._nested_task_list = nested_task_list
        self._next_index: int = 0
        self._task_index_map: dict[Task, set(int, int)] = {}

        for nested_list_index, task_list in enumerate(self._nested_task_list):
            for task_list_index, task in enumerate(task_list):
                self._task_index_map[task] = (nested_list_index, task_list_index)


    def __iter__(self):
        return self


    def set_next_index(self, task_list: list[Task]) -> None:
        if not task_list:
            raise ValueError("Task list can not be empty")

        nested_index: int | None = None

        for task in task_list:
            if nested_index is None:
                if not task in self._task_index_map:
                    raise ValueError("Task list not in collection")
                nested_index = self._task_index_map[task][0]
            
            if nested_index != self._task_index_map[task][0]:
                raise ValueError("Task list not in collection")

        if nested_index is None:
            raise ValueError("Task list not in collection")

        self._next_index = nested_index + 1


    def __next__(self) -> list[Task]:
        if self._next_index >= self._length:
            raise StopIteration()

        index = self._next_index
        self._next_index += 1

        return self._nested_task_list[index]


class TaskCollection(Iterable):
    def __init__(self):
        self._name_to_index_dict = {}
        self._data_list: list[list[Task]] = []
        self._task_index_map: dict[Task, set(int, int)] = {}

    def add(self, task_list: list[Task]) -> None:
        combined_name: str = '_'.join(task.name for task in task_list)
        if combined_name not in self._name_to_index_dict:
            self._name_to_index_dict[combined_name] = len(self._data_list)
            self._data_list.append(task_list)

    def __iter__(self) -> TaskListIterator:
        return TaskListIterator(self._data_list)

    def __contains__(self, task_list: list[Task]) -> bool:
        name_to_index: str = '_'.join(task.name for task in task_list)

        return name_to_index in self._name_to_index_dict

def main() -> None:
    # Define some object lists
    task_one_one = Task(name="task_one_one")
    task_one_two = Task(name="task_one_two")
    task_two_one = Task(name="task_two_one")
    task_two_two = Task(name="task_two_two")
    task_two_three = Task(name="task_two_three")
    task_three_one = Task(name="task_three_one")

    task_list_one: list[Task] = [
        task_one_one,
        task_one_two
    ]

    task_list_two: list[Task] = [
        task_two_one,
        task_two_two,
        task_two_three,
    ]

    task_list_three: list[Task] = [
        task_three_one
    ]
    print(f"task_list_one: {', '.join(task.name for task in task_list_one)}")
    print(f"task_list_two: {', '.join(task.name for task in task_list_two)}")
    print(f"task_list_three: {', '.join(task.name for task in task_list_three)}")
    print("")

    # Create collection
    collection = TaskCollection()
    print(f"Adding to collection: {', '.join(task.name for task in task_list_one)}")
    collection.add(task_list = task_list_one)
    print(f"Adding to collection: {', '.join(task.name for task in task_list_two)}")
    collection.add(task_list = task_list_two)
    print("")

    # Demonstrate __contains__ implementation
    print(f"{task_list_one in collection=}")
    print(f"{task_list_two in collection=}")
    print(f"{task_list_three in collection=}")
    print("")

    # Demonstrate iteration
    iterator = iter(collection)

    # Using iterator
    print("Using the TaskListIterator")
    print("Iteration from the beginning")
    for task_list in iterator:
        print(f"   task_list: {', '.join(task.name for task in task_list)}")
    print("")

    print("Iteration from index of task_list_two")
    iterator.set_next_index(task_list=task_list_two)
    for task_list in iterator:
        print(f"   task_list: {', '.join(task.name for task in task_list)}")
    print("")

    print("Iteration from index of task_list_one")
    iterator.set_next_index(task_list=task_list_one)
    for task_list in iterator:
        print(f"   task_list: {', '.join(task.name for task in task_list)}")
    print("")

    try:
        print("Iteration from index of task_list_three")
        iterator.set_next_index(task_list=task_list_three)
        for task_list in iterator:
            print(f"   task_list: {', '.join(task.name for task in task_list)}")
        print("")
    except ValueError as value_error:
        print(f"   Expected error: {type(value_error)}: {value_error}")
    print("")

    print("Using the TaskIterator")
    print("Iteration from the beginning")
    iterator = TaskIterator(nested_task_list=collection._data_list)
    for task in iterator:
        print(f"{task.name=}")
    print("")

    print("Using the TaskIterator")
    print("Iteration from index of task_two_two")
    iterator.set_next_index(task_two_two)
    for task in iterator:
        print(f"{task.name=}")
    print("")

if __name__ == '__main__':
    main()
