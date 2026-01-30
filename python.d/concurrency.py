#!/usr/bin/python
####
# ref: https://www.youtube.com/watch?v=QlkXji08lno
# @since: 2026-01-30
# @author: stev leibelt <artodeto@bazzline.net>
####

from asyncio import gather, run, sleep as async_sleep
from concurrent.futures import ProcessPoolExecutor, ThreadPoolExecutor, as_completed
from time import perf_counter, sleep, time

def my_heavy_task(duration: float, task_id: int) -> None:
    start_time: time = time()
    result: int = 0

    # This simulates I/O bounded task
    sleep(duration)

    # This simulates cpu bounded task
    for i in range(1_000_000):
        result += i * task_id
    runtime = time() - start_time

    return f"{task_id=}, {result=}, {runtime=:.2f}"

async def my_heavy_async_task(duration: float, task_id: int) -> None:
    start_time: time = time()
    result: int = 0

    await async_sleep(duration)
    for i in range(1_000_000):
        result += i * task_id
    runtime = time() - start_time

    return f"{task_id=}, {result=}, {runtime=:.2f}"


def run_tasks_sequentially(duration_per_task: float, number_of_tasks: int) -> list[str]:
    result: list[str] = []

    for i in range(number_of_tasks):
        result.append(
            my_heavy_task(duration=duration_per_task, task_id=i)
        )

    return result

def run_tasks_as_threads(duration_per_task: float, number_of_tasks: int, number_of_workers: int) -> list[str]:
    result: list[str] = []

    # ref: https://docs.python.org/3/library/concurrent.futures.html#threadpoolexecutor
    with ThreadPoolExecutor(max_workers=number_of_workers) as executor:
        future_result = [
            executor.submit(
                my_heavy_task, duration=duration_per_task, task_id=i
            ) for i in range(number_of_tasks)
        ]

        for future in as_completed(future_result):
            result.append(future.result())

    return result

def run_tasks_as_process(duration_per_task: float, number_of_tasks: int, number_of_workers: int) -> list[str]:
    result: list[str] = []

    # ref: https://docs.python.org/3/library/concurrent.futures.html#processpoolexecutor
    with ProcessPoolExecutor(max_workers=number_of_workers) as executor:
        future_result = [
            executor.submit(
                my_heavy_task, duration=duration_per_task, task_id=i
            ) for i in range(number_of_tasks)
        ]

        for future in as_completed(future_result):
            result.append(future.result())

    return result


async def run_tasks_as_async(duration_per_task: float, number_of_tasks: int) -> list[str]:
    result: list[str] = []

    # ref: https://docs.python.org/3/library/asyncio.html#module-asyncio
    task_list = [my_heavy_async_task(duration=duration_per_task, task_id=i) for i in range(number_of_tasks)]

    return await gather(*task_list)


def print_result(result: list[str]) -> None:
    for line in result:
        print(f"   {line}")


def main() -> None:
    duration_per_task: float = 0.2
    number_of_tasks: int = 6
    number_of_workers: int = 6

    print(":: Starting sequencially task run")
    start_time: time = perf_counter()
    print_result(result=run_tasks_sequentially(duration_per_task=duration_per_task, number_of_tasks=number_of_tasks))
    runtime: time = perf_counter() - start_time
    print(f"   Total {runtime=:.2f}")
    print("")

    # Use this for I/O bounded tasks
    # The next task is started while the current task waits
    print(":: Starting threaded task run")
    start_time: time = perf_counter()
    print_result(result=run_tasks_as_threads(duration_per_task=duration_per_task, number_of_tasks=number_of_tasks, number_of_workers=number_of_workers))
    runtime: time = perf_counter() - start_time
    print(f"   Total {runtime=:.2f}")
    print("")

    # Use this for cpu bounded tasks
    # Real parallel execution with the trade off of more memory usage
    print(":: Starting process task run")
    start_time: time = perf_counter()
    print_result(result=run_tasks_as_process(duration_per_task=duration_per_task, number_of_tasks=number_of_tasks, number_of_workers=number_of_workers))
    runtime: time = perf_counter() - start_time
    print(f"   Total {runtime=:.2f}")
    print("")

    # Use this for I/O (network) bounded tasks
    # Single thread with event loops, more efficient than threads for the cost
    #  being more complex
    print(":: Starting async task run")
    start_time: time = perf_counter()
    print_result(result=run(run_tasks_as_async(duration_per_task=duration_per_task, number_of_tasks=number_of_tasks)))
    runtime: time = perf_counter() - start_time
    print(f"   Total {runtime=:.2f}")
    print("")


if __name__ == '__main__':
    main()
