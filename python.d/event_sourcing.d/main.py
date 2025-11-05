import typer

app = typer.Typer(name="Event sourcing example")

from tutorial_1 import app as tutorial_1_app

tutorial_app = typer.Typer()
tutorial_app.add_typer(tutorial_1_app, name="part-1")

app.add_typer(tutorial_app, name="tutorial")

if __name__ == "__main__":
    app()
