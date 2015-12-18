#!/bin/sh
# (C) 2015-12-12 Gunnar Andersson
# License: GPLv2

layer=$1
hash=$2

# cd to same directory as this script, to find the other script
MYDIR=$(dirname "$0")
cd "$MYDIR"
MYDIR=$PWD

# Extract revision from readme
revision=$(./get_layer_info_from_README.sh $layer revision)

# Checkout the right revision in this layer
cd $layer
git checkout $revision

