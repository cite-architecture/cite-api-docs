# `cite-api-docs`

- See [automatically generated API docs](https://cite-architecture.github.io/cite-api-docs) with current version numbers


## Requirements

- a POSIX environment
- sbt
- git configured for non-interactive commit and push

## Usage

To build and push fresh API documentation to the repository:

    ./refresh.sh

Please do **not commit** any of the automatically cloned repositories in this repository!


## To process new repositories

For repositories crossbuilding for JVM and ScalaJS:

1. add the full URL for the repository to the file `xbuildrepos.txt`
2. add a link to the file `links.md` following the model of existing links.  (These are used to create the index page for the ghpages web site.)
