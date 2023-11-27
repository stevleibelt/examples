#!/usr/bin/python3
####
# ref: https://docs.python.org/3/library/argparse.html
# @author stev leibelt <artodeto.bazzline.net>
# @since 2023-06-26
####

import argparse


def main() -> None:
    # ref: https://docs.python.org/3.9/library/argparse.html
    argument_parser = argparse.ArgumentParser(
        description='My description',
        prog="Programmname"
    )
    argument_parser.add_argument('-d', '--dry-run', action='store_true', help='Fetch data but do not send')
    argument_parser.add_argument('-f', '--filename', type=argparse.FileType('r'), help='Optional filename')
    argument_parser.add_argument('-v', '--verbose', action='store_true', help='Be verbose')

    arguments = argument_parser.parse_args()

    if arguments.filename:
        print(f'Optional filename provided: {arguments.filename}')
    
    if arguments.dry_run:
        print('Dry run enabled')
    
    if arguments.verbose:
        print('Verbosity enabled')

    print('Dumping arguments')
    print(arguments)


if __name__ == '__main__':
    main()
