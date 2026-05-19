from pydantic import BaseModel

class MyModel(BaseModel):
    name: str

model_one = MyModel(name="Bernd")
print(f"{id(model_one)=}")
model_two = model_one.name = "Herbert"
print(f"{id(model_one)=}")
print(f"{model_one=}")
print(f"{id(model_two)=}")
print(f"{model_two=}")
