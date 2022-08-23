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
echo "#### package the repository sources ####"
echo

# packaging and suppling the sources with working build scripts is required by multiple strong copyleft licenses
# that we need to comply to

if [ -d "../packaging" ]; then echo "please exec from repository root (one folder up)"; exit 1; fi

# create refernce file of which build version is it (to destingush installed versions later)
touch "actflow_build_${CIRCLE_SHA1:0:6}_$(date '+%Y-%m-%d')"

# pack everything without the git repo information
tar --exclude-vcs \
-czf actflow_sources_${CIRCLE_SHA1:0:6}_$(date '+%Y-%m-%d').tar.gz ./*

