# slack-primitive-cli
[![Build Status](https://travis-ci.org/yuji38kwmt/slack-primitive-cli.svg?branch=master)](https://travis-ci.org/yuji38kwmt/slack-primitive-cli)
[![PyPI version](https://badge.fury.io/py/slack-primitive-cli.svg)](https://badge.fury.io/py/slack-primitive-cli)
[![Python Versions](https://img.shields.io/pypi/pyversions/slack-primitive-cli.svg)](https://pypi.org/project/slack-primitive-cli/)

`slack-primitive-cli` can execute [Slack web api methods](https://api.slack.com/methods) from command line.
Command line argument is correspont to web api arguments, so `slack-primitive-cli` is **primitive**.


# Requirements
* Python 3.6+

# Install

```
$ pip install slack-primitive-cli
```

https://pypi.org/project/slack-primitive-cli/


# Usage

## Sending a message

```
$ slackcli chat.postMessage --token xoxb-XXXXXXX --channel "#random" --text hello

$ export SLACK_API_TOKEN=xoxb-XXXXXXX
$ slackcli chat.postMessage  --channel "#random" --text hello
```

## Uploading files

```
$ slackcli files.upload --channels "#random" --file foo.txt
```


# Supported web api methods.
`slack-primitive-cli` supports a few web api methods.

* [chat.delete](https://api.slack.com/methods/chat.delete)
* [chat.postMessage](https://api.slack.com/methods/chat.postMessage)
* [files.delete](https://api.slack.com/methods/files.delete)
* [files.upload](https://api.slack.com/methods/files.upload)

# Additional

## Shell Completion
`slack-primitive-cli` depends on [click](https://click.palletsprojects.com/en/7.x/), so `slack-primitive-cli` can provide tab completion.
Bash, Zsh, and Fish are supported

In order to activate shell completion, you need to execute the following script.

```
$ eval "$(_SLACKCLI_COMPLETE=source slackcli)"
```


See [here](https://click.palletsprojects.com/en/7.x/bashcomplete/) for details.

