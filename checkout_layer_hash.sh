#!/bin/sh
# (C) 2015-12-12 Gunnar Andersson
# License: GPLv2

fail() {
   echo "FAILED."
   [ -n "$1" ] && echo "Message: " $@
   exit 1
}

layer=$1
[ -z "$layer" ] && fail "No layer name given"

# cd to same directory as this script, to find the other script
MYDIR=$(dirname "$0")
cd "$MYDIR"
MYDIR=$PWD

# Extract revision from readme
revision=$(./get_layer_info_from_README.sh $layer revision)

# Fail if could not fetch revision
[ -z "$revision" ] && fail "Fetched revision was empty"

# Checkout the right revision in this layer
cd $layer || fail "Can't cd to layer directory ($layer)"
git checkout $revision

