####
# Contains example from the eventsourcing tutorial
####
# @see: https://eventsourcing.readthedocs.io/en/stable/topics
# @since: 2025-11-05
# @author: stev leibelt <artodeto@bazzline.net>
####

import typer

app = typer.Typer(name="Event sourcing example")

from tutorial_1 import app as tutorial_1_app
from tutorial_2 import app as tutorial_2_app
from tutorial_5 import app as tutorial_5_app

tutorial_app = typer.Typer()
# Part 1 gives you a full blown example, it is working and you get the idea
#   of event sourcing
# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part1.html
tutorial_app.add_typer(tutorial_1_app, name="part-1")
# Part 2 explains the code of part 1 and especially the moving parts between
# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part2.html
tutorial_app.add_typer(tutorial_2_app, name="part-2")
# Part 3 explaines the ubiquitous language/terms of part 1 and 2 in more detail
# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part3.html
# Part 4 goes into detailed information about views and projections
# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part4.html
# Part 5 contains an example how to connect two applications aka two domains
# The applications are bounded by a system using multiple runners and persistence
#   modules
# ref: https://eventsourcing.readthedocs.io/en/stable/topics/tutorial/part5.html
tutorial_app.add_typer(tutorial_5_app, name="part-5")

app.add_typer(tutorial_app, name="tutorial")

if __name__ == "__main__":
    app()
