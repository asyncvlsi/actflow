#!/bin/bash

# call the repo build script
bash $EDA_SRC/build || exit 1

# this act test lib addon is not build/installed it is build by the testrunner on demand @TODO find a better way
cd $VLSI_TOOLS_SRC/act/test/dl/
make
cp $VLSI_TOOLS_SRC/act/test/dl/ext.lib $ACT_HOME/lib/