#!/usr/bin/python3
####
# ref: https://docs.python.org/3/library/subprocess.html
###
# This file provides an example how one main process calls multiple sub process
####

import argparse
from os import getpid
from random import choice, randint
from subprocess import Popen, PIPE
from time import sleep
from typing import Any

def start_subprocess(seconds_to_sleep: int, will_fail: bool) -> None:
    pid: int = getpid()
    seconds_iterator: int = 1
    will_fail_at_second: int = randint(0, seconds_to_sleep) 

    print(f"Starting: {pid=}, {seconds_to_sleep=}")
    while seconds_iterator <= seconds_to_sleep:
        if will_fail and will_fail_at_second >= seconds_iterator:
            raise RuntimeError(f"Failing {pid=} as ordered")
        print(f"Running: {pid=}, {seconds_iterator}/{seconds_to_sleep}")
        sleep(1)
        seconds_iterator += 1
    print(f"Finished: {pid=}, {seconds_to_sleep=}")

def main(number_of_subprocesses: int) -> None:
    command_list: list[str] = []
    subprocess_dict: dict[str, Any] = {}

    # create commands
    for _ in range(0, number_of_subprocesses):
        seconds_to_sleep: int = randint(1, 8) 
        will_fail: bool = choice([True, False])
        command: list[str] = [
            "python",
            "parallel_subprocess.py",
            "--subprocess",
            f"{seconds_to_sleep}"
        ]
        if will_fail:
            command.append("--will-fail")
        command_list.append(command)

    # start commands
    for index, command in enumerate(command_list):
        print(f"Starting {command=} with {index=}")
        subprocess = Popen(command, stdout=PIPE, stderr=PIPE)
        subprocess_dict[index] = {
            "command": command,
            "return_code": None,
            "subprocess": subprocess,
            "status": "running",
            "stdout": None,
            "stderr": None,
        }

    # check commands
    while True:
        number_of_running_subprocess: int = 0

        # check state and update status
        for key, data in subprocess_dict.items():
            if data["status"] == "running":
                return_code: int | None = data["subprocess"].poll()

                if return_code is None:
                    print(f"{key=} is still running")
                    number_of_running_subprocess += 1
                else:
                    stdout, stderr = data["subprocess"].communicate()

                    subprocess_dict[key]["return_code"] = return_code
                    subprocess_dict[key]["stdout"] = stdout

                    if return_code > 0:
                        subprocess_dict[key]["status"] = "failed"
                        subprocess_dict[key]["stderr"] = stderr
                    else:
                        subprocess_dict[key]["status"] = "finished"

        # stop if all processes are finished
        if number_of_running_subprocess == 0:
            print("All sub processes are finished or failed")
            break;
        else:
            print("")
            sleep(1)

    for data in subprocess_dict.values():
        print(f"{data['command']=}")
        print(f"   {data['status']=}")
        print(f"   {data['stdout']=}")

        if data["status"] != "finished":
            print(f"   {data['stderr']=}")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Example subprocess")
    parser.add_argument("--subprocess", help="Calls a subprocess that sleeps for give seconds.", required=False, type=int)
    parser.add_argument("--will-fail", action="store_true", help="Used with --subprocess, triggers that the subprocess will fail.")
    parser.add_argument("--number-of-subprocess", help="Sets the number of called sub processes.", required=False, type=int)
    args = parser.parse_args()

    if args.subprocess:
        start_subprocess(seconds_to_sleep=args.subprocess, will_fail=args.will_fail)
    else:
        number_of_subprocess = args.number_of_subprocess if args.number_of_subprocess else 3
        main(number_of_subprocesses=number_of_subprocess)

