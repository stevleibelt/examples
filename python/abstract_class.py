import abc

class AbstractBase(metaclass=abc.ABCMeta):

    def __init__(self, name: str):
        self._name = name

    @abc.abstractmethod
    def get_name(self) -> str:
        pass

class RealBase(AbstractBase):

    def get_name(self) -> str:
        return self._name

    def set_name(self, name: str):
        self._name = name

realBase = RealBase('foo')

print(realBase.get_name())

realBase.set_name('bar')
print(realBase.get_name())

print("")

