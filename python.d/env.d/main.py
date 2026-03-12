from dotenv import load_dotenv
from os import environ

def _main() -> None:
    my_not_existing_variable=environ.get("MY_NOT_EXISTING_VARIABLE")
    print(f"{my_not_existing_variable=}")

    my_empty_variable=environ.get("MY_EMPTY_VARIABLE")
    print(f"{my_empty_variable=}")

    my_integer=environ.get("MY_INTEGER")
    print(f"{my_integer=}")

    my_string=environ.get("MY_STRING")
    print(f"{my_string=}")
    
    raw_my_data = environ.get("MY_DATA")
    my_data = eval(raw_my_data.replace('\\\n', '').replace('"', '')) if raw_my_data else []
    print(f"{my_data=}")
    print(":: Iterating over my_data")
    for part in my_data:
        print(f"   {part=}")

if __name__ == "__main__":
    load_dotenv()
    _main()
