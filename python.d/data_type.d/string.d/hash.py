#!/usr/bin/python
####
# @since 2025-01-14
# @author stev leibelt <artodeto@bazzline.net>
####

from hashlib import sha3_512

def main() -> None:
    my_string: str = "This is a string"

    my_hash: str = sha3_512(my_string.encode('utf-8')).hexdigest()

    print(f"{my_string=}: {str(my_hash)=}, {len(my_hash)=}")

if __name__ == '__main__':
    main()
