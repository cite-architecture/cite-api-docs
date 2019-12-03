# `cite-api-docs`

- See [current version numbers of CITE libraries](https://github.com/cite-architecture/current-library-versions)
- See [automatically generated API docs](https://cite-architecture.github.io/cite-api-docs)

## Usage

To build

    ./refresh.sh
    git add docs
    git commit -m "UPDATE MSG"
    git push

## To process new repositories

For repositories crossbuilding for JVM and ScalaJS:

1. add the full URL for the repository to the file `xbuildrepos.txt`
2. add a link to the file `links.md` following the model of existing links.  (These are used to create the index page for the ghpages web site.)

For repositories built for JVM only:

- TBD

## TBD

- add support for repositories building for JVM only
- automate git so docs are automatically pushed when `./refresh.sh` is run
- set up a machine to execute `refresh.sh` on a regular cycle with `cron`
