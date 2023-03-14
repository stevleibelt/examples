#switch-case example

class Foo():
    pass


class Bar():
    pass


class Baz():
    pass


def handle_class(myObject):

    match myObject:
        case Foo():
            status_code = 10
            status_message = "There is no foo without a bar!"

        case Bar():
            status_code = 20
            status_message = "There is no bar without a foo!"

        case _:
            status_code = 99
            status_message = "No foo, no bar, no baz!"

    print("   Status code >>{0}<<.".format(status_code))
    print("   Status message >>{0}<<.".format(status_message))


bar = Bar()
baz = Baz()
foo = Foo()

print(":: Testing handling of an instance of >>Bar<<.")
handle_class(bar)

print(":: Testing handling of an instance of >>Baz<<.")
handle_class(baz)

print(":: Testing handling of an instance of >>Foo<<.")
handle_class(foo)

