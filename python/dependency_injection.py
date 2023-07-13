#!/usr/bin/python
####
# ref: https://itnext.io/dependency-injection-in-python-a1e56ab8bdd0?gi=071e2505f633&source=read_next_recirc-----4a2fdc48ef74----0---------------------cb3ea296_66f5_499f_bb23_013d148775f5-------
# @since: 2023-06-16
# @author: stev leibelt <artodeto@bazzline.net>
####

# Used for simple custom DI Container example
#   ref: https://docs.python.org/3.11/library/inspect.html
import inspect

class Car:
    def __init__(self, manufacturer: str, name: str):
        self._manufacturer = manufacturer
        self._name = name

    def get_manufacturer(self) -> str:
        return self._manufacturer

    def get_name(self) -> str:
        return self._name


class CarBuilder:
    def __init__(self, manufacturer: str):
        self._manufacturer = manufacturer
        self._name = None

    def with_name(self, name: str):
        self._name = name
        return self

    def build(self):
        if not self._name:
            raise ValueError("Not all dependencies fullfilled")

        return Car(
                manufacturer=self._manufacturer,
                name=self._name
            )


class SimpleContainer:
    def __init__(self):
        self._registry = {}

    def register(self, dependency_type, implementation = None):
        if not implementation:
            implementation = dependency_type

        # mro: Method resolution order
        #   returns a tuple of classes from which the current class is derived
        for base in inspect.getmro(implementation):
            # if base is not object and not the original dependency_type
            if base not in (object, dependency_type):
                # registry this base class and any intermediate base classes in
                #   this hierachy
                self._registry[base] = implementation

        self._registry[dependency_type] = implementation

    def resolve(self, dependency_type):
        if dependency_type not in self._registry:
            raise ValueError(f"{dependency_type} is not registered in the container.")

        implementation = self._registry[dependency_type]

        constructor_signature = inspect.signature(target_cls.___init__)
        constructor_params = constructor_signature.parameters.values()

        # call resolve for each dependency found by inspect
        dependencies = [
                self.resolve(param.annotation)
                for param in constructor_params
                if param.annotation is not inspect.Paramter.empty
                ]

        return implementation(*dependencies)


def dump_car(car: Car):
    print(f"This is a {car.get_name()} from {car.get_manufacturer()}")


# First way is to simple provide all dependencies by hand
first_car = Car(manufacturer='bazzline', name='normal_car')

# Second method is to use a builder which itself could hold some dependencies
#   And only provides a public api to change the dynamic parts
bazzline_car_builder = CarBuilder(manufacturer='bazzline')
second_car = (
    bazzline_car_builder
        .with_name(name='super_car')
        .build()
    )

dump_car(first_car)
dump_car(second_car)

# Third way is to use simple custom DI Container
# Full control over implementation and simple to understand
#   but limited features with required self implementation
"""
simple_container = SimpleContainer()
simple_container.register(BaseConnect, InMemoryConnection)
simple_container.register(BaseRepository[Person], InMemoryPersonRepository)
simple_container.register(BaseRepository[Order], InMemoryOrderRepository)
simple_container.register(MyClass)

# MyClass has the previously defined classes as dependencies
my_class = simple_container.resolve(MyClass)
"""

# Fourth way is to use something like dependency_injector
#   ref: https://pypi.org/project/dependency-injector/
# Lots of features including different injection types and support for asynchronous injectors
"""
class Container(containers.DeclarativeContainer):
    connection = providers.Singletone(
        InMemoryConnection
    )

    person_repository = providers.Singletone(
        InMemoryPersonRepository
    )

    order_repository = providers.Singletone(
        InMemoryOrderRepository
    )

    create_my_class = providers.Factory(
        MyClass,
        connection=connection,
        person_repository=person_repository,
        order_repository=order_repository
    )

if __name__ == '__main__':
    container = Container()

    my_class = container.create_my_class()
"""
# Fifth way is tu use injector
#   ref: https://github.com/python-injector/injector
# Lightweight with basic features and so easier to understand
#   but with limited feature list

