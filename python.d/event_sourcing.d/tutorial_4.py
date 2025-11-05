import typer
from eventsourcing.application import Application
from eventsourcing.domain import Aggregate, event
from typing import Any
from uuid import UUID

# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part4.html
app = typer.Typer(name="part4")

if __name__ == "__main__":
    app()

