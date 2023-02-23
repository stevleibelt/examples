#ref: https://www.youtube.com/watch?v=6tNS--WetLI
#timestamp: 12:00
import unittest

class Foo(object):
    

    def __init__(self, bar: str):
        self._bar = bar

    def repeat(self, string: str) -> str:
        return (string*2)

foo = Foo('foo')

#print(foo.repeat('bar'))

class FooTest(unittest.TestCase):

    #each function with a prefix of >>test_<< will be executed automatically
    def test_repeat(self):
        instance = Foo('foo')
        result = instance.repeat('bar')

        self.assertEqual(result, 'barbar')
        self.assertEqual(result, 'bar bar')

#normally, you have to call it the following way
#   python -m unittest unittests.py
#but with the next lines, we are triggering the unittest module on our own
if __name__ == '__main__':
    unittest.main()

