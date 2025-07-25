#!/usr/bin/python
####
# @see https://www.freecodecamp.org/news/how-to-parse-a-string-in-python/
# @since 2023-05-07
# @author stev leibelt <artodeto@bazzline.net>
####

def main() -> None:
    username = "=+---Doe---+="

    # strip will remove all provided characters from the string
    user = username.strip("=+-")

    print("username: {}".format(username))
    print("user: {}".format(user))

if __name__ == '__main__':
    main()
