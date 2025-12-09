####
# Complex example for inspect
# Never name this file `inspect.py`, except you want o have a clash
#   of module/namespace issue
####
# ref: https://docs.python.org/3/library/inspect.html
####
# @since: 2025-12-09
# @author: stev leibelt <artodeto@bazzline.net>
####

from inspect import Parameter, signature


def foo(a, *, b: int, c: bool = False, **kwargs) -> None:
    pass


def main() -> None:
    signature_of_foo = signature(foo)
    # Creates a BoundedArguments, a object that hols the arguments passed to
    #   this function
    # ref: https://runebook.dev/en/docs/python/library/inspect/inspect.BoundArguments
    # bind_partial contains only the arguments that are provided.
    # If you would use bind() this could result a TypeError
    bind_of_foo = signature_of_foo.bind_partial()

    # Iterate over a dictionary of type Parameter
    print(":: Investigating signature(function_name).parameters.values()")
    for parameter in signature_of_foo.parameters.values():
        print(f"   {parameter.name=}")
        print(f"   {getattr(bind_of_foo, parameter.name, None)=}")
        print(f"   {parameter=}")
        print(f"   {parameter.default == Parameter.empty=}")
        print(f"   {parameter.kind=}")
        print(f"   {type(parameter.kind)=}")
        print(f"   {parameter.kind == Parameter.VAR_POSITIONAL=}")
        print(f"   {parameter.kind == Parameter.VAR_KEYWORD=}")
        print(f"   {parameter.kind in (Parameter.VAR_KEYWORD, Parameter.VAR_POSITIONAL)=}")
        print("")
    
    mandatory_argument_dict = {
        parameter.name: getattr(bind_of_foo, parameter.name, None) for parameter in signature_of_foo.parameters.values()
        if parameter.default == Parameter.empty and (parameter.kind not in (Parameter.VAR_KEYWORD, Parameter.VAR_POSITIONAL))
    }

    print(":: Listing available information")
    print(f"   {signature_of_foo=}")
    print(f"   {signature_of_foo.parameters.values()=}")
    print(":: Example how to work with a parameter")
    print(f"   {signature_of_foo.parameters['b']=}")
    print(f"   {signature_of_foo.parameters['b'].annotation=}")
    print(":: Example how to use the bind_partial")
    print(f"   {bind_of_foo=}")
    print(f"   An ordered mapping of parameter names to their values: {bind_of_foo.arguments=}")
    print(f"   A tuple of positional arguments: {bind_of_foo.args=}")
    print(f"   A dictonary of keyword arguments: {bind_of_foo.kwargs=}")
    print(":: Printing mandatory but not provided arguments")
    print(f"   {mandatory_argument_dict=}")


if __name__ == '__main__':
    main()

