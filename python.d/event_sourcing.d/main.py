import typer

app = typer.Typer(name="Event sourcing example")

from tutorial_1 import app as tutorial_1_app
from tutorial_2 import app as tutorial_2_app
from tutorial_3 import app as tutorial_3_app
from tutorial_4 import app as tutorial_4_app
from tutorial_5 import app as tutorial_5_app

tutorial_app = typer.Typer()
tutorial_app.add_typer(tutorial_1_app, name="part-1")
tutorial_app.add_typer(tutorial_2_app, name="part-2")
tutorial_app.add_typer(tutorial_3_app, name="part-3")
tutorial_app.add_typer(tutorial_4_app, name="part-4")
tutorial_app.add_typer(tutorial_5_app, name="part-5")

app.add_typer(tutorial_app, name="tutorial")

if __name__ == "__main__":
    app()
