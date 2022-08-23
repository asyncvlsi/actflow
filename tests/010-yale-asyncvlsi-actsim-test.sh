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

echo 
echo "#### actsim test ####"
echo

source tests/test_helper.sh

lookup_binary "actsim"
lookup_shared_library "libactsimext_sh.so"

echo 
echo "#### actsim test suits ####"
echo

cd $EDA_SRC/actsim

# fix to run make test from unconfigured sources
touch $EDA_SRC/actsim/config.mk

sed -i 's/ACTTOOL=..\/actsim.$EXT/ACTTOOL=actsim/' test/run_inf.sh
sed -i 's/ACTTOOL=..\/actsim.$EXT/ACTTOOL=actsim/' test/run_num.sh
sed -i 's/ACTTOOL=..\/actsim.$EXT/ACTTOOL=actsim/' test/validate_inf.sh
sed -i 's/ACTTOOL=..\/actsim.$EXT/ACTTOOL=actsim/' test/validate_num.sh

sed -i 's/runtest: all/runtest:/' ext/Makefile
sed -i 's/runtestsub: all/runtestsub:/' ext/Makefile


make runtest || exit 1

