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
echo "#### act test ####"
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

cd $VLSI_TOOLS_SRC
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/validate_subdir.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/run_subdir_vg.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/run_subdir.sh

sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/print/validate.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/print/run_vg.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/print/run.sh

sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/dl/validate.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/dl/run_vg.sh
sed -i 's/ACT=..\/act-test.$EXT/ACT=act-test/' act/test/dl/run.sh

# in the prebuild environment dont run make use the prebuild version 
if [ -f ${ACT_HOME}/lib/ext.lib ]; then 
sed -i 's/make/#make/' act/test/dl/run.sh
sed -i 's/make/#make/' act/test/dl/run_vg.sh
export LD_LIBRARY_PATH=$ACT_HOME/lib:${LD_LIBRARY_PATH}
fi

sed -i 's/ACTTOOL=..\/v2act.$EXT/ACTTOOL=v2act/' transform/v2act/test/run.sh
sed -i 's/ACTTOOL=..\/v2act.$EXT/ACTTOOL=v2act/' transform/v2act/test/run_vg.sh
sed -i 's/ACTTOOL=..\/v2act.$EXT/ACTTOOL=v2act/' transform/v2act/test/validate.sh

sed -i 's/ACTTOOL=..\/test_inlinepass.$EXT/ACTTOOL=test_inlinepass/' transform/testing/inline/test/run.sh
sed -i 's/ACTTOOL=..\/test_inlinepass.$EXT/ACTTOOL=test_inlinepass/' transform/testing/inline/test/run_vg.sh
sed -i 's/ACTTOOL=..\/test_inlinepass.$EXT/ACTTOOL=test_inlinepass/' transform/testing/inline/test/validate.sh

sed -i 's/ACTTOOL=..\/test_mempass.$EXT/ACTTOOL=test_mempass/' transform/testing/mem/test/run.sh
sed -i 's/ACTTOOL=..\/test_mempass.$EXT/ACTTOOL=test_mempass/' transform/testing/mem/test/run_vg.sh
sed -i 's/ACTTOOL=..\/test_mempass.$EXT/ACTTOOL=test_mempass/' transform/testing/mem/test/validate.sh

sed -i 's/ACTTOOL=..\/test_arbpass.$EXT/ACTTOOL=test_arbpass/' transform/testing/arb/test/run.sh
sed -i 's/ACTTOOL=..\/test_arbpass.$EXT/ACTTOOL=test_arbpass/' transform/testing/arb/test/run_vg.sh
sed -i 's/ACTTOOL=..\/test_arbpass.$EXT/ACTTOOL=test_arbpass/' transform/testing/arb/test/validate.sh

sed -i 's/ACTTOOL=..\/test_statepass.$EXT/ACTTOOL=test_statepass/' transform/testing/state/test/run.sh
sed -i 's/ACTTOOL=..\/test_statepass.$EXT/ACTTOOL=test_statepass/' transform/testing/state/test/run_vg.sh
sed -i 's/ACTTOOL=..\/test_statepass.$EXT/ACTTOOL=test_statepass/' transform/testing/state/test/validate.sh
sed -i 's/ACTTOOL=..\/test_statepass.$EXT/ACTTOOL=test_statepass/' transform/testing/state/test/view.sh

sed -i 's/ACTTOOL=..\/prs2sim.$EXT/ACTTOOL=prs2sim/' transform/prs2sim/test/run.sh
sed -i 's/ACTTOOL=..\/prs2sim.$EXT/ACTTOOL=prs2sim/' transform/prs2sim/test/run_vg.sh
sed -i 's/ACTTOOL=..\/prs2sim.$EXT/ACTTOOL=prs2sim/' transform/prs2sim/test/validate.sh

sed -i 's/ACTTOOL=..\/prs2net.$EXT/ACTTOOL=prs2net/' transform/prs2net/test/run.sh
sed -i 's/ACTTOOL=..\/prs2net.$EXT/ACTTOOL=prs2net/' transform/prs2net/test/run_vg.sh
sed -i 's/ACTTOOL=..\/prs2net.$EXT/ACTTOOL=prs2net/' transform/prs2net/test/validate.sh

sed -i 's/ACTTOOL=..\/prs2cells.$EXT/ACTTOOL=prs2cells/' transform/prs2cells/test/run.sh
sed -i 's/ACTTOOL=..\/prs2cells.$EXT/ACTTOOL=prs2cells/' transform/prs2cells/test/run_vg.sh
sed -i 's/ACTTOOL=..\/prs2cells.$EXT/ACTTOOL=prs2cells/' transform/prs2cells/test/validate.sh

sed -i 's/ACTTOOL=..\/ext2sp.$EXT/ACTTOOL=ext2sp/' transform/ext2sp/test/run.sh
sed -i 's/ACTTOOL=..\/ext2sp.$EXT/ACTTOOL=ext2sp/' transform/ext2sp/test/run_vg.sh
sed -i 's/ACTTOOL=..\/ext2sp.$EXT/ACTTOOL=ext2sp/' transform/ext2sp/test/validate.sh

sed -i 's/ACTTOOL=..\/aflat.$EXT/ACTTOOL=aflat/' transform/aflat/test/run.sh
sed -i 's/ACTTOOL=..\/aflat.$EXT/ACTTOOL=aflat/' transform/aflat/test/run_vg.sh
sed -i 's/ACTTOOL=..\/aflat.$EXT/ACTTOOL=aflat/' transform/aflat/test/validate.sh

sed -i 's/ACTTOOL=..\/act2v.$EXT/ACTTOOL=act2v/' transform/act2v/test/run.sh
sed -i 's/ACTTOOL=..\/act2v.$EXT/ACTTOOL=act2v/' transform/act2v/test/run_vg.sh
sed -i 's/ACTTOOL=..\/act2v.$EXT/ACTTOOL=act2v/' transform/act2v/test/validate.sh

echo "running tests "
make runtest || exit 1
