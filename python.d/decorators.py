# ref: https://www.freecodecamp.org/news/the-python-decorator-handbook/
# ref: https://www.freecodecamp.org/news/the-python-decorator-handbook/
####

def my_decorator(func):

#   wrapper function
#   we are using the nested function ability of python in here
#   nested/inner functions are scoped to the outer functions
#       they have access to the variables of the outer functions
#   inner functions are called automatically when the outer functions
#       are called
#   inner functions are not directly callable.
    def wrapper(*args, **kwargs):
        # Extra processing before the function
        print(f"Calling {func.__name__} with args: {args} and kwargs: {kwargs}")
        # Call the actual function being decorated
        result = func(*args, **kwargs)
        # Extra processing after the function
        print(f"Calling {func.__name__} created the result: {result}")

        return result
    return wrapper # Return the nested wrapper function

def my_function(*args, **kwargs):
    print("Inside my function")
    
    return "This is my result"

# decorated function/function with applied decorator function
@my_decorator
def my_other_function(*args, **kwargs):
    print("Inside my other function")

    return "This is my other result"


print(":: Calling not decorated function")
my_function(1, 2, 3, foo='bar')
print("")
print(":: Calling decorated function")
my_other_function(1, 2, 3, foo='bar')

