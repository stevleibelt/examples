####
# Complex example from a handbook
####
# ref: https://www.freecodecamp.org/news/the-python-decorator-handbook/
# ref: https://docs.python.org/3/library/inspect.html
####
# @since: 2024-05-22
# @author: stev leibelt <artodeto@bazzline.net>
####

from inspect import Parameter, signature
from typing import Any

# You can skip the my_decorator_with_argument if you don't need to pass in an argumet
def my_decorator_with_argument(string: str = "Hello"):
    def my_decorator(func):
    #   wrapper function
    #   we are using the nested function ability of python in here
    #   nested/inner functions are scoped to the outer functions
    #       they have access to the variables of the outer functions
    #   inner functions are called automatically when the outer functions
    #       are called
    #   inner functions are not directly callable.
        def wrapper(*args, **kwargs):
            # inspect called function argument definition
            current_function_signature = signature(func)
            current_function_bind = current_function_signature.bind_partial()

            # Create a dict with parameter_name: provided_value | None
            mandatory_argument_dict: dict[str, Any] = {
                parameter.name: getattr(current_function_bind, parameter.name, None) for parameter in current_function_signature.parameters.values()
                if parameter.default == Parameter.empty and (parameter.kind not in (Parameter.VAR_KEYWORD, Parameter.VAR_POSITIONAL))
            }

            print(f"   {mandatory_argument_dict=}")
            print(f"   {kwargs=}")
            # Apply values from kwargs
            for name, value in mandatory_argument_dict.items():
                if value is None and name in kwargs:
                    mandatory_argument_dict[name] = kwargs[name]
                else:
                    # Yep, that is a kind of depdendency injection here
                    if name == "foo":
                        print(f"   {name=} is missing, setting default")
                        mandatory_argument_dict[name] = "there is no foo without a bar"
                    else:
                        print(f"   Mandatory {name=} is missing.")
                        print(f"   {func.__name__=} won't be called")
                        return None
            print(f"   {mandatory_argument_dict=}")

            print(f"   {string=}")
            # Extra processing before the function
            print(f"  Calling {func.__name__=} with {args=}, {mandatory_argument_dict=}")
            # Call the actual function being decorated
            result = func(*args, **mandatory_argument_dict)
            # Extra processing after the function
            print(f"  Calling {func.__name__=} created {result=}")

            return result
        return wrapper # Return the nested wrapper function
    return my_decorator


def my_function(*args, **kwargs) -> None:
    print("Inside my function")
    
    return "This is my result"


# decorated function/function with applied decorator function
@my_decorator_with_argument(string="Bazzline")
def my_other_function(*args, **kwargs) -> None:
    print("Inside my other function")

    return "This is my other result"

@my_decorator_with_argument(string="Bazzline")
def my_function_with_mandatory_arguments(bar: int, foo: str) -> str:
  print(f":: This is my_functon_with_mandatory_arguments calling")
  print(f"   {bar=}")
  print(f"   {foo=}")

  return f"bar={bar},foo={foo}"


def main() -> None:
    print(":: Calling not decorated function")
    my_function(1, 2, 3, foo="bar")
    print("")

    print(":: Calling decorated function")
    my_other_function(1, 2, 3, foo="bar")
    print("")

    print(":: Calling function without mandatory argument `foo`")
    my_function_with_mandatory_arguments()
    print("")

    print(":: Calling function with mandatory argument `foo` with `foo='bar'`")
    my_function_with_mandatory_arguments(bar=7, foo="bar")
    print("")


if __name__ == "__main__":
    main()
