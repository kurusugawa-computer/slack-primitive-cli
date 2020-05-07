# slack-primitive-cli
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
$ slackcli --token xoxb-XXXXXXX --channel "#random" --text hello

$ export SLACK_API_TOKEN
$ slackcli --channel "#random" --text hello
```

## Uploading files

```
$ slackcli --channels "#random" --file foo.txt
```


# Supported web api methods.
`slack-primitive-cli` supports a few web api methods.

* [chat.delete](https://api.slack.com/methods/chat.delete)
* [chat.postMessage](https://api.slack.com/methods/chat.postMessage)
* [files.delete](https://api.slack.com/methods/files.delete)
* [files.upload](https://api.slack.com/methods/files.upload)
