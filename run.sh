#!/bin/sh

test_act() {
  dir=$1
  msg=$2
  if [ -d $dir ]
  then
  echo
  echo "************************************************************"
  echo "*>>> Testing: $msg"
  echo "************************************************************"
  (cd $dir; make runtest) || exit 1
  fi
}

export VLSI_TOOLS_SRC=`pwd`/act
test_act act "core ACT lib"
test_act actsim "actsim"

export PATH=${PATH}:${ACT_HOME}/bin
test_act chp2prs "chp2prs"

test_act layout "layout library"
test_act timing "cyclone"
