####
# Simple example showing the power of kwargs
####
# @since: 2024-10-24
# @author: stev leibelt <artodeto@bazzline.net>
####

def inject_foo(func):
    def wrapper(*args, **kwargs):
        return func(foo='foo', *args, **kwargs)
    return wrapper

def inject_bar(func):
    def wrapper(*args, **kwargs):
        return func(bar='bar', *args, **kwargs)
    return wrapper

@inject_bar
def bar_injected(foo: str = None, bar: str = None, baz: str = None):
    print(f"foo: {foo}, bar: {bar}, baz: {baz}")

@inject_foo
def foo_injected(foo: str = None, bar: str = None, baz: str = None):
    print(f"foo: {foo}, bar: {bar}, baz: {baz}")

@inject_bar
@inject_foo
def bar_and_foo_injected(foo: str = None, bar: str = None, baz: str = None):
    print(f"foo: {foo}, bar: {bar}, baz: {baz}")

print("bar_injected")
bar_injected()
print("")

print("foo_injected")
foo_injected()
print("")

print("bar_and_foo_injected")
bar_and_foo_injected()
print("")
