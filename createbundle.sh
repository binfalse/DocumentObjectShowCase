#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

BUNDLENAME=ro-bundle.zip

# remove the bundle if it already exists
[ -f $BUNDLENAME ] && rm $BUNDLENAME

# create mime type file
echo -n application/vnd.wf4ever.robundle+zip > mimetype

# create zip with mime type files being the first file, uncompressed
zip -q -0 "$BUNDLENAME" mimetype

# add all other files with the default compression
zip -q -r "$BUNDLENAME" . -x mimetype "$BUNDLENAME" .git\*

# finally list the contents of the bundle
unzip -l "$BUNDLENAME"



