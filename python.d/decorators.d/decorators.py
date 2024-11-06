####
# Complex example from a handbook
####
# ref: https://www.freecodecamp.org/news/the-python-decorator-handbook/
####
# @since: 2024-05-22
# @author: stev leibelt <artodeto@bazzline.net>
####

# You can skip the my_decorator_with_argument if you don't need to pass in an argumet
def my_decorator_with_argument(string: str = 'Hello'):
    def my_decorator(func):
    #   wrapper function
    #   we are using the nested function ability of python in here
    #   nested/inner functions are scoped to the outer functions
    #       they have access to the variables of the outer functions
    #   inner functions are called automatically when the outer functions
    #       are called
    #   inner functions are not directly callable.
        def wrapper(*args, **kwargs):
            print(f"This is {string} calling ...")
            # Extra processing before the function
            print(f"Calling {func.__name__} with args: {args} and kwargs: {kwargs}")
            # Call the actual function being decorated
            result = func(*args, **kwargs)
            # Extra processing after the function
            print(f"Calling {func.__name__} created the result: {result}")

            return result
        return wrapper # Return the nested wrapper function
    return my_decorator


def my_function(*args, **kwargs):
    print("Inside my function")
    
    return "This is my result"


# decorated function/function with applied decorator function
@my_decorator_with_argument(string="Bazzline")
def my_other_function(*args, **kwargs):
    print("Inside my other function")

    return "This is my other result"


print(":: Calling not decorated function")
my_function(1, 2, 3, foo='bar')
print("")
print(":: Calling decorated function")
my_other_function(1, 2, 3, foo='bar')

