#!/usr/bin/python
####
# ref: https://docs.python.org/3/library/pathlib.html
####
# Contains example using path
####

from pathlib import Path

def main() -> None:
    print(f"{Path(__file__)=}")
    # Resolve symlinks and eliminate ".." compontents
    print(f"{Path(__file__).resolve()=}")
    print(f"{Path(__file__).resolve().root=}")
    print(f"{Path(__file__).resolve().anchor=}")
    print(f"{Path(__file__).resolve().suffix=}")
    print(f"{Path(__file__).resolve().stem=}")
    print(f"{Path(__file__).resolve().parent=}")
    print(f"{Path(__file__).resolve().parts=}")

if __name__ == '__main__':
    main()
