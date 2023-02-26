#Important notes
#   An import is always checking from your >>current working directory<< and your >>$PATH<<
#   If your folder has a __init__.py, this defines your namespace package
#   => import is not specific to a path
#   Once you create a __init__.py, this directory path becomes your default package (python will prioritize this package/directory name over all others)
#   A module is just code in a file
#   A module is also an object in python: `print(globals())`
#   => import creates a key in/variable in the namespace
#   Packages are modules in a directory
#   Python has two types of packages, regular packages and namespaced packages
#       Regular packages -> Directory name becomes the package name
#           Example 1
#               Filesystem structure
#                   main.py
#                   package1
#                       __init__.py
#
#               You can call
#                   package1.__path__
#                   package1.__file__
#                   package1.__package__
#                   package1.__name__
#                   package1.__spec__
#
#           Example 2
#               Filesystem structure
#                   main.py
#                   package1
#                       __init__.py
#                       module1.py
#               By loading package1.module1, package1.__init__.py is executed, followed by package1.module1.py
#
#           Example 3
#               Filesystem structure
#                   main.py
#                   package1
#                       __init__.py
#                       module1.py
#                       package2.py
#                           __init__.py
#                           module2.py  #has a function called hallo
#               Import module2 by >>import package1.package2.module2<<
#                   You have to call >>package1.package2.module2.hello()<<
#                   To fix that, you can write >>import package1.package2.module2 as module2<<
#
#           Example 4
#               Filesystem structure - absolute import (absolute as seen from main.py)
#                   main.py
#                   package1
#                       __init__.py #contains >>import package1.package2.module2<<
#                       module1.py
#                       package2.py
#                           __init__.py
#                           module2.py  #has a function called hallo
#               We still have to write >>package1.package2.module2.hello()<<
#
#           Example 5 - relative import
#               Filesystem structure
#                   main.py # >>from . import package1<< does not work
#                   package1
#                       __init__.py
#                       module1.py
#                       package2.py
#                           __init__.py #contains >>from . import module2<< and >>from .. import module1<<
#                           module2.py
#
#           Controll what is exported within a module by writing it as the first line of code in the module file
#               __all__ = ['my_variable', 'my_function']
#               This only works if we import this with the line >>from.my_module import *<<
#               __all__ = ['my_module_one', 'my_module_two'] #could be used inside __init__.py too to import all by using >>from <string: my_package> import *<<
#
#       Namespaced packages
#
#           Example 1
#               Filesystem structure
#                   main.py
#                   package1
#                       __init__.py
#
#               You can call
#                   package1.__path__
#                   package1.__file__   #this will be empty
#                   package1.__package__
#                   package1.__name__
#                   package1.__spec__
#

#works fine
#import foo_d

#from foo_d.bar import Bar
#from foo_d.baz import Baz

#ref: https://www.youtube.com/watch?v=QCSz0j8tGmI
#ref: https://www.youtube.com/watch?v=ZBYDbAQKs3I
import sys
#hint: if you need to reload a module, use >>importlib.reload(my_module)<<
print(':: Print all bultin module names')
print(sys.builtin_module_names)
print('')

print(':: Printing all used paths')
print(sys.path)
print('')

print(':: Printing all currently loaded modules')
print(sys.modules)
print('')

print(globals())
print('')

#works when directory >>foo_<< has a >>__init__.py<< file
from foo_d import Baz
from foo_d import bar   #this works for python 3.3 and above, you don't need a __ini__.py always

print(globals())
print('')

print(':: type(bar)')
print(type(bar))
#print(type(baz))   #baz is not defined
print(':: type(Baz)')
print(type(Baz))
print('')

print(':: bar.__dict__')
print(bar.__dict__)
print('')

print(':: bar.__name__')
print(bar.__dict__['__name__'])
print(bar.__name__)
print('')

print(':: __name__')
print(__name__)
print('')

bar = bar.Bar()
baz = Baz()

