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
echo "#### download the prebuild dependencies for ACT_HOME ####"
echo

if [ -d "../packaging" ]; then echo "please exec from repository root (one folder up)"; exit 1; fi

if [ x$ACT_HOME = x ]
then
	echo "Please set the environment variable ACT_HOME to the install directory"
        exit 1
fi
#remove any old versions
rm -f actflow_dependencies_sources*.tar.gz
rm -f actflow_dependencies*.tar.gz
# grab the latest dependencies by asking the github API for the file name
# it would be nicer with jq but its not avalible out of the box on some systems
# the alternative is to do fixed filenames and get them via url 
PACKAGE_URL=$(curl -sL https://api.github.com/repos/bics-rug/actflow-dependencies/releases/latest | grep "browser_download_url.*actflow_dependencies_package*" | cut -d : -f 2,3 | tr -d \")
SOURCE_URL=$(curl -sL https://api.github.com/repos/bics-rug/actflow-dependencies/releases/latest | grep "browser_download_url.*actflow_dependencies_sources*" | cut -d : -f 2,3 | tr -d \")
# and download
echo "dependency source: $SOURCE_URL"
wget --quiet $SOURCE_URL
echo "dependency package: $PACKAGE_URL"
wget --quiet $PACKAGE_URL
# extract the ACT_HOME install
mkdir -p $ACT_HOME
tar -C $ACT_HOME --strip-components=1 -xf actflow_dependencies_package*.tar.gz

