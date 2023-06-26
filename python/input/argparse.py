####
# ref: https://docs.python.org/3/library/argparse.html
# @author stev leibelt <artodeto.bazzline.net>
# @since 2023-06-26
####

import argparse
import os
import sys


def main() -> None:
    argument_parser = argparse.ArgumentParser(prog="argparse",
                                              description="Example for using argparse")
    
    argument_parser.add_argument("-g", "--givenname", dest="givenname", help="User givenname", type=str)
    argument_parser.add_argument("-s", "--surname", dest="surname", help="User surname", type=str)
    argument_parser.add_argument("-t", "--title", dest="title", help="Optional title like doctor", type=str)

    (args) = argument_parser.parse_args()

    if (args.givenname is None or args.surname is None):
        print(":: Error")
        print("   Invalid amount of aruguments provided.")
        argument_parser.print_help()
        return 10

    if args.title is None:
        args.title = ""
    else:
        args.title += " "

    print(f"Hello {args.title}{args.givenname} {args.surname}")



if __name__ == '__main__':
    main()
