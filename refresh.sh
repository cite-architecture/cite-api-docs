#!/usr/bin/env /bin/bash
#
# Read list of github repos with cross-builds in JVM and ScalaJS
# from xbuildrepos.txt, update repos if needed, and generate API docs.
# Copy resulting API docs into ghpages directory, and write a time-stamped
# index file into the root of the ghpages directory.
#
# Requirements:  sbt, git, POSIX.
#
export GIT=`which git`
export SED=`which sed`
export PWD=`which pwd`
export LS=`which ls`
export CP=`which cp`
export SBT=`which sbt`
export DATE=`which date`
export CAT=`which cat`
export RM=`which rm`

export DOCSSUBDIR=jvm/target/scala-2.12/api
export ROOT=`pwd`

for REPO in $(cat xbuildrepos.txt) ; do
  echo $REPO
  DIR=`$SED "s#https://github.com/cite-architecture/##" <<<"$REPO"`
  if [ ! -d $DIR ]
  then
    echo "Cloning " $REPO "... "
    $GIT clone $REPO
  fi
  echo "Pulling and building in " $ROOT/$DIR
  (cd $ROOT/$DIR && $GIT pull &&  $SBT doc)
  #(cd $ROOT/$DIR && exec echo "After cd $ROOT/$DIR, working in "`$PWD`)

  cd $ROOT
  export APIDOCS=$DIR/$DOCSSUBDIR
  #echo "APIDOCS IS " $APIDOCS
  printf "\n\n"
  echo $CP " -r" $APIDOCS  docs/$DIR
  $CP -r $APIDOCS docs/$DIR
done;

export STAMPED=`date`
printf "## CITE architecture libraries: API documentation\n\nLast updated: $STAMPED\n\n" > header.md
$CAT header.md links.md > docs/index.md
$RM header.md
