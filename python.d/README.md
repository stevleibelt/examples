# python

## Debugging

* Debugging can be done by `import pdb`
* `pdb.breakpoint()` or `pdb.set_trace()` in the code
* `python -m pdb my.py` for execution

## Linting and performance profiling

* Either use `black`, `pylint` or `mypy`
* `pyling my.py` to generate detailed report about potential issues, coding convention violations and more
* You can built in `profile` and `snakeviz` to generate profiling results and listing them in a webbrowser
  * Or package `line_profiler`
  * Or package `memory_profiler`

## Decorators

* Decorators are functions that are wrapping another function call
* Decorators have to support one parameter which is the original called function

## Module, packages and subpackages

> A module is a file containing Python definitions and statements.

[source](https://docs.python.org/3/tutorial/modules.html#tut-modules)

> Packages are a way of structuring Python’s module namespace by using “dotted module names”.
> ...
> The `__init__.py` files are required to make Python treat directories containing the file as packages.

[source](https://docs.python.org/3/tutorial/modules.html#packages)

```bash
# ref: https://fastapi.tiangolo.com/tutorial/bigger-applications/

.
├── app                  # "app" is a Python package
│   ├── __init__.py      # this file makes "app" a "Python package"
│   ├── main.py          # "main" module, e.g. import app.main
│   ├── dependencies.py  # "dependencies" module, e.g. import app.dependencies
│   └── routers          # "routers" is a "Python subpackage"
│   │   ├── __init__.py  # makes "routers" a "Python subpackage"
│   │   ├── items.py     # "items" submodule, e.g. import app.routers.items
│   │   └── users.py     # "users" submodule, e.g. import app.routers.users
│   └── internal         # "internal" is a "Python subpackage"
│       ├── __init__.py  # makes "internal" a "Python subpackage"
│       └── admin.py     # "admin" submodule, e.g. import app.internal.admin
```


* The `app` directory contains everything
  * It has an **empty** file `app/__init__.py`, so it is a "Python package" (a collection of "Python modules"): `app`
  * It contains an `app/main.py` file. As it is inside a Python package (a directory with a file `__init__.py`), it is a **module** of that package: `app.main`
* There's also an `app/dependencies.py` file, just like `app/main.py`, it is a **module**: `app.dependencies`
* There's a subdirectory `app/routers/` with another file `__init__.py`, so it's a **Python subpackage**: `app.routers`
* The file `app/routers/items.py` is inside a package, `app/routers/`, so, it's a **submodule**: `app.routers.items`
* The same with `app/routers/users.py`, it's another **submodule**: `app.routers.users`
* There's also a subdirectory `app/internal/` with another file `__init__.py`, so it's another **Python subpackage**: `app.internal`
* And the file `app/internal/admin.py` is another **submodule**: `app.internal.admin`

```python
import routers.items  # This imports the module namespace into your file
from routers.items import BaseItemClass # This imports names from the module directly into your local namespace
                                        # This does not introduce the module name into your local namespace, routers is not defined

# To call a method fomr a module namespace, you have to call it with the module namespace
users.create(name="Max Power")  # Assuming module users has a function called create
```

## Links

* [Dockstring Convetions: python.org](https://peps.python.org/pep-0257/) - 20230425
* [Learning Python: python-guide.org](https://docs.python-guide.org/intro/learning/) - 20230424
* [Python For Beginners: python.org](https://www.python.org/about/gettingstarted/) - 20230424
* [Python debuggung handbook: freecodecamp.org](https://www.freecodecamp.org/news/python-debugging-handbook/) - 20240126
* [Style Guide](https://peps.python.org/pep-0008/) - 20230425
* [The Python Decorator Handbook: freecodecamp.org](https://www.freecodecamp.org/news/the-python-decorator-handbook/) - 20240129
* [The Python Tutorial: python.org](https://docs.python.org/3/tutorial/index.html) - 20230424
* [What is new in Python 3.8: python.org](https://docs.python.org/3.8/whatsnew/3.8.html) - 20230425
* [What is new in Python 3.9: python.org](https://docs.python.org/3.9/whatsnew/3.9.html) - 20230425
* [What is new in Python 3.10: python.org](https://docs.python.org/3.10/whatsnew/3.10.html) - 20230425
* [What is new in Python 3.11: python.org](https://docs.python.org/3.11/whatsnew/3.11.html) - 20230425
* [What is new in Python 3.12: python.org](https://docs.python.org/3.12/whatsnew/3.12.html) - 20240129

