# `cite-api-docs`

- See [current version numbers of CITE libraries](https://github.com/cite-architecture/current-library-version)
- See [automatically generated API docs](https://cite-architecture.github.io/cite-api-docs)

## Usage

To build

    ./refresh.sh
    git add docs
    git commit -m "UPDATE MSG"
    git push


## TBD

- automate git so docs are automatically pushed when `./refresh.sh` is run
- set up a machine to execute `refresh.sh` on a regular cycle with `cron`
