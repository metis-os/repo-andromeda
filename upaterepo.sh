#!/bin/sh
cd x86_64
repo-add -n -R metis.db.tar.gz *.pkg.tar.zst
find . -type f -name "*.old" -delete
cd ../
