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

lookup_binary () {
  if [ x$(command -v $1) = x ]; then
    echo "missing $1"
    exit 1
  fi
  echo "found $1"
  #echo "ldd $(command -v $1)"
  ldd_out=$(ldd $(command -v $1))
  if [[ $ldd_out == *"not found"* || $ldd_out == *"missing"* || $ldd_out == *"No such file"* || $ldd_out == *"not a dynamic executable"* ]]; then
    echo "missing shared library: $ldd_out"
    exit 1
  fi
  #echo "Debug: $ldd_out"
}

lookup_shared_library () {
  if [ ! -f $ACT_HOME/lib/$1 ]; then
    echo "missing $1"
    exit 1
  fi
  echo "found $1"
  ldd_out=$(ldd $ACT_HOME/lib/$1)
  if [[ $ldd_out == *"not found"* || $ldd_out == *"missing"* || $ldd_out == *"No such file"* || $ldd_out == *"not a dynamic executable"* ]]; then
    echo "missing shared library: $ldd_out"
    exit 1
  fi
  #echo "Debug: $ldd_out"
}
