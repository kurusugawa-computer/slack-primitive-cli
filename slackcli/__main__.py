import click

import slackcli
from slackcli.command import chat, files


@click.group()
@click.version_option(version=slackcli.__version__)
def cli():
    pass


cli.add_command(chat.delete)
cli.add_command(chat.postMessage)
cli.add_command(files.delete)
cli.add_command(files.upload)

if __name__ == "__main__":
    cli()
