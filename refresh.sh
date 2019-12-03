#!/usr/bin/env /bin/bash
#
# Read list of github repos with cross-builds in JVM and ScalaJS
# from xbuildrepos.txt, update if needed, and generate API docs.
#
# Requirements:  sbt, git, POSIX.
#
export GIT=`which git`
export SED=`which sed`
export PWD=`which pwd`
export LS=`which ls`
export CP=`which cp`
export SBT=`which sbt`

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
  echo "APIDOCS IS " $APIDOCS
  echo "Copying " `$LS $APIDOCS` " to " docs/$DIR " ..."
  $CP -r $APIDOCS docs/$DIR
done;
