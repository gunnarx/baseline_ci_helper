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

# Store the location of these scripts
MYDIR=$(dirname "$0")
cd "$MYDIR"
MYDIR="$PWD"

# Extract revision from README in meta-ivi
cd "$MYDIR/../meta-ivi" || fail "Can't cd to meta-ivi directory"
revision=$($MYDIR/get_layer_info_from_README.sh $layer revision)

# Fail if we could not fetch revision
[ -z "$revision" ] && fail "Revision extracted from README was empty"

# Checkout the right revision in this layer
cd "$MYDIR/../$layer" || fail "Can't cd to layer directory ($layer)"
git checkout $revision

