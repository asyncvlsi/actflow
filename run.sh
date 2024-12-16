#!/bin/sh

test_act() {
  dir=$1
  msg=$2
  if [ -d $dir ]
  then
  echo
  echo "************************************************************"
  echo "************************************************************"
  echo "|"
  echo "|     >>>>> Testing: $msg <<<<<"
  echo "|"
  echo "************************************************************"
  echo "************************************************************"
  ((((cd $dir; make runtest; echo $? >&3) | cat >&4) 3>&1) | (read res; exit $res)) 4>&1
  if [ $? -ne 0 ]
  then
      echo "FAILED"
      exit 1
  fi
  fi
}

export VLSI_TOOLS_SRC=`pwd`/act
test_act act "core ACT lib"
test_act actsim "actsim"

export PATH=${PATH}:${ACT_HOME}/bin
test_act chp2prs "chp2prs"

test_act layout "layout library"
test_act timing "cyclone"
test_act crosstest "Cross Tools test"
