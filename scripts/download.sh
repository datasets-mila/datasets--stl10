#!/bin/bash
source scripts/utils.sh echo -n

# Saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail

# This script is meant to be used with the command 'datalad run'

files_url=(
	"http://ai.stanford.edu/~acoates/stl10/stl10_matlab.tar.gz stl10_matlab.tar.gz"
	"http://ai.stanford.edu/~acoates/stl10/stl10_binary.tar.gz stl10_binary.tar.gz")

# These urls require login cookies to download the file
git-annex addurl --fast -c annex.largefiles=anything --raw --batch --with-files <<EOF
$(for file_url in "${files_url[@]}" ; do echo "${file_url}" ; done)
EOF
git-annex get --fast -J8
git-annex migrate --fast -c annex.largefiles=anything *

[[ -f md5sums ]] && md5sum -c md5sums
[[ -f md5sums ]] || md5sum $(list -- --fast) > md5sums
