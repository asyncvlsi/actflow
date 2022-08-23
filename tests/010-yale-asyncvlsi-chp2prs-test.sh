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
echo "#### chp2prs test ####"
echo

source tests/test_helper.sh

lookup_binary "chp2prs"
lookup_shared_library "libactchp2prspass.so"


echo 
echo "#### chp2prs test suits ####"
echo

cd $EDA_SRC/chp2prs

# fix to run make test from unconfigured sources
touch $EDA_SRC/chp2prs/config.mk

sed -i 's/.\/run_expr.sh/.\/run_expr.sh || exit 1/' test/run.sh
sed -i 's/.\/run_expr_qdiopt.sh yosys/.\/run_expr_qdiopt.sh yosys || exit 1/' test/run.sh
sed -i 's/.\/run_expr_bdopt.sh yosys/.\/run_expr_bdopt.sh yosys || exit 1/' test/run.sh
sed -i 's/.\/run_expr_qdiopt.sh genus/.\/run_expr_qdiopt.sh yosys || exit 1/' test/run.sh
sed -i 's/.\/run_expr_bdopt.sh genus/.\/run_expr_bdopt.sh yosys || exit 1/' test/run.sh

make runtest || exit 1

