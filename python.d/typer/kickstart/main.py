from typing import Optional, Tuple
from uuid import UUID
from enum import Enum
from time import sleep

import typer

# ref: https://www.youtube.com/watch?v=FPJZrUjS8D4&list=PLIO3UV9ODwNBZOh1nf8spd-YPb5b_JZZ2&index=2
# ref: https://github.com/r3ap3rpy/tttyper
# If you want to know how testing is working
#   ref: https://www.youtube.com/watch?v=thqfLfmCjVI&list=PLIO3UV9ODwNBZOh1nf8spd-YPb5b_JZZ2&index=15



class ArgumentEnum(str, Enum):
    bar = 'bar',
    foo = 'foo'


def initialize_application():
    typer.echo('I am the initializer')


def teardown_application(value):
    typer.echo(f'Break down the walls: {value}')


cli_app = typer.Typer(callback=initialize_application, result_callback=teardown_application)
cli_sub_app = typer.Typer()

cli_app.add_typer(cli_sub_app, name='example-sub')


@cli_app.command()
def example_optional_argument(mandatory_string: str, optional_string: Optional[str] = 'default texr'):
    typer.echo(
        f'The value of the mandatory string: {mandatory_string}, the value of the optional string: {optional_string}')


@cli_app.command()
def example_colorful_output():
    styled_text = typer.style('Styled text', fg=typer.colors.BLACK, bg=typer.colors.GREEN, bold=True)
    typer.echo(f'This is a colorful output example showing a {styled_text}')
    typer.secho('More styled message', fg=typer.colors.RED, bg=typer.colors.WHITE)


@cli_app.command()
def example_exit(exit_code: int = 0):
    typer.echo(f'Exiting with code: {exit_code}')
    raise typer.Exit(code=exit_code)


@cli_app.command()
def example_user_input():
    user_input = typer.prompt('Put something in')
    typer.echo(f'Output your input: {user_input}')

    if typer.confirm('Please confirm', default=True):
        typer.echo('ack')
    else:
        typer.echo('nack')

    # Stop executing if confirm is no
    typer.confirm('Do you want to know more?', abort=True)
    typer.echo('I do work')


@cli_app.command()
def example_arguments(mandatory_string: str = typer.Argument(), optional_string: str = typer.Argument('default text')):
    typer.echo(f'Mandatory string contains: {mandatory_string}, optional string contains: {optional_string}')


@cli_app.command()
def example_options(optional_string: str = typer.Option('The default string', help='The text I should print out'),
                    required_string: str = typer.Option(..., help='This is a required string'),
                    prompt_string: str = typer.Option(..., help='This is an interactive input', prompt=True),
                    confirmed_string: str = typer.Option(..., help='You have to confirm this', confirmation_prompt=True)):
    typer.echo(f'Output the required input: {required_string}')
    typer.echo(f'Output the optional input: {optional_string}')
    typer.echo(f'Output the prompt input: {prompt_string}')
    typer.echo(f'Output the confirmed input: {confirmed_string}')


@cli_app.command()
def example_parameters(parameter_without_help: int = typer.Argument(..., min=13, max=42),
                       parameter_with_help: int = typer.Option(..., min=0, max=9),
                       parameter_with_class: UUID = typer.Option('b30c8db5-1506-4f73-995f-7162e7e9f70f'),
                       parameter_with_enum: ArgumentEnum = typer.Option(ArgumentEnum.foo.value)):
    typer.echo(f'Your first parameter: {parameter_without_help}')
    typer.echo(f'Your second parameter: {parameter_with_help}')
    typer.echo(f'Your third parameter: {parameter_with_class}')
    typer.echo(f'Your forth parameter: {parameter_with_enum.value}')


@cli_app.command()
def example_flags(force: bool = typer.Option(False, '--force')):
    if force:
        typer.echo('We use the force')
    else:
        typer.echo('No force is needed')


@cli_app.command()
def example_multiple_values(
        mandatory_multiple_values: Tuple[int, int, int] = typer.Argument((43, 4, 22)),
        optional_multiple_values: Tuple[str, str, str] = typer.Option(('Bernd', 'Jochen', 'Christa'))):

    first_age, second_age, third_age = mandatory_multiple_values
    first_name, second_name, third_name = optional_multiple_values

    if not first_name or not second_name or not third_name:
        typer.Abort('You have to provide three names')

    typer.echo(f'First person: {first_name} with an age of {first_age}')
    typer.echo(f'Second person: {second_name} with an age of {second_age}')
    typer.echo(f'Third person: {third_name} with an age of {third_age}')


@cli_sub_app.command()
def example_sub_command(something_nice: str = typer.Option('You are loved', help='Write something nice')):
    typer.echo('I am a sub command')
    typer.echo(f'Just want to output: {something_nice}')


def example_iterator(iterator_range: int = 4):
    for i in range(iterator_range):
        yield i


@cli_app.command()
def example_progressbar():
    total = 0
    typer.echo('Using built in iterator')
    with typer.progressbar(range(3)) as progress:
        for value in progress:
            sleep(0.1)

    typer.echo('Using own iterator')
    with typer.progressbar(iterable=example_iterator(iterator_range=100), length=100, label='Processing yields') as progress:
        for value in progress:
            sleep(0.01)
            progress.update(5)

    typer.echo('Done')


@cli_app.command()
def example_application_directory():
    application_directory = typer.get_app_dir('my_application')
    typer.echo(f'Application directory: {application_directory}')


@cli_app.command()
def example_launch_application():
    typer.launch('https://www.bazzline.net')


if __name__ == '__main__':
    cli_app()
