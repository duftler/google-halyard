#!/bin/bash
# bootstrap.sh
#
#   Copyright 2014, Google Inc.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

OWNER=GoogleCloudPlatform
REPO=google-halyard-private

function download {
  scratch=$(mktemp -d -t tmp.XXXXXXXXXX) || exit
  script_file=$scratch/bootstrap_2.sh

  echo "Downloading install script: $URL"
  read -p 'Please enter your GitHub Personal Access Token: ' TOKEN

  GITHUB_PATH=https://api.github.com/repos/$OWNER/$REPO/contents/scripts/install/bootstrap_2.sh

  curl -# --header "Authorization: token $TOKEN" --header 'Accept: application/vnd.github.v3.raw' $GITHUB_PATH > $script_file || exit

  chmod 775 $script_file

  echo "Running install script from: $script_file"
  $script_file $TOKEN
}

download < /dev/tty
