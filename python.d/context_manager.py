#!/usr/bin/python
####
# ref:
#   https://fastapi.tiangolo.com/tutorial/dependencies/dependencies-with-yield/
#   https://docs.python.org/3/library/contextlib.html
# @since: 2023-06-21
# @author: stev leibelt <artodeto@bazzline.net>
####

from contextlib import ContextDecorator

class DBSession:
    def __init__(self):
        print(f"Connecting to database")


    def query(self, q: str):
        print(f"Executing query: {q}")


    def close(self):
        print(f"Disconnecting from database")


class MyContextManager(ContextDecorator):
    def __init__(self):
        print(f"Creating DBSession")
        self.db = DBSession()


    def __enter__(self):
        print(f"Returning DBSession")
        return self.db

    
    def __exit__(self, exc_type, exc_value, traceback):
        print(f"Closing DBSession")
        self.db.close()


async def get_db():
    with MyContextManager() as db:
        yield db


def main() -> None:
    db = get_db()
    # sadly not working
    #db.query(q="   Doing something while database connection is established.")


if __name__ == '__main__':
    main()
