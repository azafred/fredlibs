#!/usr/bin/env bash
git add .
git commit -am '$@'
git push
./pushtag.sh
VERSION=$(git describe --abbrev=0 --tags)
echo "Creating Source"
python2 ./setup.py sdist
echo "Creating Wheel"
python2 ./setup.py bdist_wheel
echo "Uploading to pypi"
twine upload dist/*-${VERSION}*
