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
echo "#### package ACT_HOME install ####"
echo

if [ x$ACT_HOME = x ]
then
	echo "Please set the environment variable ACT_HOME to the install directory"
        exit 1
fi

# move to the folder above act_home so the pathes inside the tar are nice
WORK_DIR=$(pwd)
mv packaging/README_package.md $ACT_HOME/README.md
mv actflow_build_* $ACT_HOME/

# patch hardcoded path in the act configure file
sed -i 's/\/opt\/act/\$ACT_HOME/g' $ACT_HOME/scripts/config

cd $ACT_HOME/..
tar -czf $WORK_DIR/actflow_package_${CIRCLE_SHA1:0:6}_$(date '+%Y-%m-%d').tar.gz $(realpath --relative-to ./ $ACT_HOME)

# create a package that has all static libs and includes removed
rm -rf $ACT_HOME/include
rm -rf $ACT_HOME/share/cmake*
rm -rf $ACT_HOME/share/pkgconfig
find $ACT_HOME -type f -name "*.a" -delete
find $ACT_HOME -type f -name "*.h" -delete
find $ACT_HOME -type f -name "*.H" -delete
find $ACT_HOME -type f -name "*.hpp" -delete
find $ACT_HOME -type f -name "*.cmake" -delete
find $ACT_HOME -type f -name "cmake*" -delete
find $ACT_HOME -type f -name "*.cmake.in" -delete
find $ACT_HOME -type f -name "*.cpp" -delete
find $ACT_HOME -type f -name "*.c" -delete
find $ACT_HOME -type f -name "*.ipp" -delete
find $ACT_HOME -type f -name "*.f" -delete
find $ACT_HOME -type f -name "*.f03" -delete
find $ACT_HOME -type f -name "Makefile*" -delete
find $ACT_HOME -type f -name "*.m4" -delete
find $ACT_HOME -type d -empty -delete

tar -czf $WORK_DIR/actflow_slim_package_${CIRCLE_SHA1:0:6}_$(date '+%Y-%m-%d').tar.gz $(realpath --relative-to ./ $ACT_HOME)