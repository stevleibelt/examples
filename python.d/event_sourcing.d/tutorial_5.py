import typer
from eventsourcing.application import Application
from eventsourcing.domain import Aggregate, event
from typing import Any
from uuid import UUID

# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part5.html
app = typer.Typer(name="part5")

if __name__ == "__main__":
    app()

