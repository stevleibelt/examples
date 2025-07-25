####
# @author stev leibelt <artodeto.bazzline.net>
# @since 2019-01-11
####

def main() -> None:
    my_string = 'output my input'

    print('This is the full string: ',my_string)

    print('First character is: ',my_string[0])

    print('Starting with seventh character and choosing two: ',my_string[7:2])

    print('Starting with ninth character until the last three: ',my_string[7:-3])

if __name__ == '__main__':
    main()
