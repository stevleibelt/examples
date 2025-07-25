####
#! /usr/bin/env python
####
# @author stev leibelt <artodeto.bazzline.net>
# @since 2019-01-11
####

#@see: https://docs.python.org/3/using/windows.html#from-a-script
import sys

def main() -> None:
    sys.stdout.write("hello from python %s.\n" % (sys.version,))

    print("Hello World!")

    print("Hello", "World!")

if __name__ == '__main__':
    main()
