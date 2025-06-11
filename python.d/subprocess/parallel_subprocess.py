#!/usr/bin/python3
####
# ref: https://docs.python.org/3/library/subprocess.html
###
# This file provides an example how one main process calls multiple sub process
####

import argparse
from os import getpid
from random import randint
from subprocess import Popen, PIPE
from time import sleep

def start_subprocess(seconds_to_sleep: int) -> None:
    pid = getpid()
    print(f"Starting: {pid=}, {seconds_to_sleep=}")
    sleep(seconds_to_sleep)
    print(f"Finished: {pid=}, {seconds_to_sleep=}")

def main(number_of_subprocesses: int) -> None:
    command_list: list = []
    subprocess_dict: dict = {}

    # create commands
    for _ in range(0, number_of_subprocesses):
        seconds_to_sleep = randint(1, 8) 
        command_list.append(
            [
                "python",
                "parallel_subprocess.py",
                "--subprocess",
                f"{seconds_to_sleep}"
            ]
        )

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
                return_code = data["subprocess"].poll()

                if return_code is None:
                    print(f"{key=} is still running")
                    number_of_running_subprocess += 1
                else:
                    stdout, stderr = data["subprocess"].communicate()

                    subprocess_dict[key]["return_code"] = return_code
                    subprocess_dict[key]["stdout"] = stdout.decode()

                    if return_code > 0:
                        subprocess_dict[key]["status"] = "failed"
                        subprocess_dict[key]["stderr"] = stderr.decode()
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
        if data["status"] == "finished":
            print(f"{data['command']=}, finished with {data['stdout']=}")
        else:
            print(f"{data['command']=}, failed with {data['stdout']=}, {data['stderr']=}")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Example subprocess")
    parser.add_argument("--subprocess", help="Calls a subprocess that sleeps for give seconds.", required=False, type=int)
    parser.add_argument("--number-of-subprocess", help="Sets the number of called sub processes.", required=False, type=int)
    args = parser.parse_args()

    if args.subprocess:
        start_subprocess(seconds_to_sleep=args.subprocess)
    else:
        number_of_subprocess = args.number_of_subprocess if args.number_of_subprocess else 3
        main(number_of_subprocesses=number_of_subprocess)

