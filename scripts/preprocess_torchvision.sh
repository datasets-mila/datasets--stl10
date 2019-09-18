#!/bin/bash
source scripts/utils.sh echo -n

# this script is meant to be used with 'datalad run'
set -o errexit -o pipefail

_SNAME=$(basename "$0")

mkdir -p logs/

python3 -m pip install -r scripts/requirements_torchvision.txt

python3 scripts/preprocess_torchvision.py \
	1>>logs/${_SNAME}.out_$$ 2>>logs/${_SNAME}.err_$$

# Delete raw naryfiles
git rm -f stl10_binary.tar.gz md5sums

git-annex add --fast -c annex.largefiles=anything stl10_binary/

[[ -f md5sums ]] && md5sum -c md5sums
[[ -f md5sums ]] || md5sum $(list -- --fast) > md5sums
