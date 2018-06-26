#!/usr/bin/env bash

# Copyright 2018-present Open Networking Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# validate_manifest.sh
#
# Validates the repo manifest, per the DTD format given here:
# https://gerrit.googlesource.com/git-repo/+/master/docs/manifest-format.txt

echo "Verifying default.xml using manifest.dtd"

# check that xmllint is available
if ! [ -x "$(command -v xmllint)" ]
then
  echo "Please install 'xmllint' to use this script"
  exit 1
fi

# run the verification
xmllint --noout --dtdvalid manifest.dtd default.xml
status=$?

if [ $status -ne 0 ]
then
  echo "FAILURE: default.xml isn't valid - exit status: $status"
  exit $status
else
  echo "SUCCESS: default.xml validated correctly"
  exit 0
fi
