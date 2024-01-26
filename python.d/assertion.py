# ref: https://www.freecodecamp.org/news/python-debugging-handbook/
####
# Assertions can be disabled with `python -O my.py`
# Assertions should be used for internal logical checks not for data source
#   or user input validation
####

x = -1

try:
    assert x > 0, f"x: {x} should be greater than zero"
except AssertionError as e:
    print(f"Assertion failed: {e}")
