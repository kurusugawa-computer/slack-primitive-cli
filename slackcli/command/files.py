import slack
import click
from click_option_group import optgroup, RequiredMutuallyExclusiveOptionGroup


@click.command(name="files.upload",
               help="Uploads or creates a file. See https://api.slack.com/methods/files.upload ")
@click.option("--token", envvar="SLACK_API_TOKEN", required=True)
@click.option("--channels")
@optgroup.group("File contents", cls=RequiredMutuallyExclusiveOptionGroup)
@optgroup.option("--file")
@optgroup.option("--content")
@click.option("--filename")
@click.option("--filetype")
@click.option("--initial_comment")
@click.option("--thread_ts")
@click.option("--title")
def upload(token, channels, file, content, filename, filetype, initial_comment, thread_ts, title):
    client = slack.WebClient(token=token)

    kwargs = dict(channels=channels, file=file, content=content, filename=filename, filetype=filetype,
                  initial_comment=initial_comment, thread_ts=thread_ts)
    # 'title'だけ判定している理由：Noneのtitleを渡すと、以下のエラーが発生するため、
    # TypeError: Can not serialize value type: <class 'NoneType'>
    if title is not None:
        kwargs["title"] = title

    print(kwargs)
    response = client.files_upload(**kwargs)
    print(response)
    return response
