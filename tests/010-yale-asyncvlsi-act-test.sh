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
echo "#### act linker test ####"
echo

source tests/test_helper.sh

lookup_binary "act2v"
lookup_binary "act-test"
lookup_binary "adepend"
lookup_binary "aflat"
lookup_binary "atrace"
lookup_binary "ext2sp"
lookup_binary "pgen"
lookup_binary "prs2cells"
lookup_binary "prs2net"
lookup_binary "prs2sim"
lookup_binary "prsim"
lookup_binary "prspack"
lookup_binary "sv2act"
lookup_binary "act2v"
lookup_binary "techgen"
lookup_binary "test_inlinepass"
lookup_binary "test_statepass"
lookup_binary "tlint"
lookup_binary "tr2alint"
lookup_binary "v2act"

lookup_shared_library "libactpass_sh.so"
lookup_shared_library "libvlsilib_sh.so"
lookup_shared_library "libact_sh.so"


echo 
echo "#### act test suits ####"
echo

## the tests need to be pached to use the installed binaries
echo " patching tests "

# in the prebuild environment dont run make use the prebuild version 
cd $EDA_SRC/act

if [ -f ${ACT_HOME}/lib/ext.lib ]; then 
sed -i 's/make/#make/' act/test/dl/run.sh
sed -i 's/make/#make/' act/test/dl/run_vg.sh
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$ACT_HOME/lib
fi

echo "running tests "
make runtest || exit 1
