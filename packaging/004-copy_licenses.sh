#!/bin/bash

#
# Copyright 2022 Ole Richter - University of Groningen
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if [ -d "../packaging" ]; then echo "please exec from repository root (one folder up)"; exit 1; fi

echo 
echo "#### copy all licenses to ACT_HOME ####"
echo

# copying the licenses into the install is required to comply with the copyleft licenses for distribution

if [ x$ACT_HOME = x ]
then
	echo "Please set the environment variable ACT_HOME to the install directory"
        exit 1
fi
if [ x$EDA_SRC = x ]
then
	export EDA_SRC=$(pwd)
fi
if [ x$VLSI_TOOLS_SRC = x ]
then
	export VLSI_TOOLS_SRC=$(pwd)/act
fi

# copy all licenses into $ACT_HOME/licenses

cp $VLSI_TOOLS_SRC/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-act
cp $EDA_SRC/actsim/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-actsim
cp $EDA_SRC/BiPart/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-BiPart
cp $EDA_SRC/chp2prs/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-chp2prs
cp $EDA_SRC/Dali/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-Dali
cp $EDA_SRC/dflowmap/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-dflowmap
cp $EDA_SRC/expropt/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-expropt
cp $EDA_SRC/interact/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-interact
cp $EDA_SRC/layout/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-layout
cp $EDA_SRC/layout/LICENSE.BIN $ACT_HOME/license/LICENSE_yale-asyncvlsi-layout.bin
cp $EDA_SRC/lefdef/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-lefdef
cp $EDA_SRC/phyDB/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-phyDB
cp $EDA_SRC/PWRoute/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-PWRoute
cp $EDA_SRC/SPRoute/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-SPRoute
cp $EDA_SRC/stdlib/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-stdlib
cp $EDA_SRC/TritonRoute-WXL/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-TritonRoute
cp $EDA_SRC/Galois/LICENSE.txt $ACT_HOME/license/LICENSE_yale-asyncvlsi-Galois
cat $EDA_SRC/Galois/COPYRIGHT >> $ACT_HOME/license/LICENSE_yale-asyncvlsi-Galois
cp $EDA_SRC/LICENSE $ACT_HOME/license/LICENSE_yale-asyncvlsi-actflow


