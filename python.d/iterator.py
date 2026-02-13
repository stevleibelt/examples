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
        self._length: int = len(nested_task_list)
        self._nested_task_list = nested_task_list
        self._next_index: int = 0
        self._task_index_map: dict[Task, set(int, int)] = {}

        for nested_list_index, task_list in enumerate(self._nested_task_list):
            for task_list_index, task in enumerate(task_list):
                self._task_index_map[task] = (nested_list_index, task_list_index)


    def __iter__(self):
        return self


    def set_next_index(self, task_list: list[Task]) -> int:
        if not task_list:
            raise ValueError("Task list can not be empty")

        nested_index: 0 | None = None

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


    def __next__(self):
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

    def __iter__(self) -> TaskIterator:
        return TaskIterator(self._data_list)

    def __contains__(self, task_list: list[Task]) -> bool:
        name_to_index: str = '_'.join(task.name for task in task_list)

        return name_to_index in self._name_to_index_dict

def main() -> None:
    # Define some object lists
    task_list_one: list[Task] = [
        Task(name="task_one_one"),
        Task(name="task_one_two"),
    ]

    task_list_two: list[Task] = [
        Task(name="task_two_one"),
        Task(name="task_two_two"),
        Task(name="task_two_three"),
    ]

    task_list_three: list[Task] = [
        Task(name="task_three"),
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
        print(f"   {type(value_error)}: {value_error}")

if __name__ == '__main__':
    main()
