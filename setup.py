#!/usr/bin/env python
# coding: UTF-8

import os

from setuptools import find_packages, setup

here = os.path.abspath(os.path.dirname(__file__))

with open("README.md", "r", encoding="utf-8") as f:
    readme = f.read()

about = {}
with open(
    os.path.join(here, "slackcli", "__version__.py"), "r", encoding="utf-8"
) as f:
    exec(f.read(), about)

setup(
    name="slack-primitive-cli",
    version=about["__version__"],
    description="Primitive Slack CLI",
    long_description=readme,
    long_description_content_type="text/markdown",
    author="yuji38kwmt",
    author_email="yuji38kwmt@gmail.com",
    maintainer="yuji38kwmt",
    license="MIT",
    keywords="slack cli",
    url="https://github.com/yuji38kwmt/slack-primitive-cli",
    install_requires=[
        "slackclient",
        "click",
        "click-option-group",
    ],
    python_requires=">=3.6",
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3 :: Only",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Topic :: Utilities",
        "Operating System :: OS Independent",
    ],
    packages=find_packages(exclude=["tests"]),
    entry_points={"console_scripts": ["slackcli=slackcli.__main__:cli"]},
)
