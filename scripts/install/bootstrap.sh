#!/bin/bash
# bootstrap.sh

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
#  $script_file $TOKEN
}

download < /dev/tty
