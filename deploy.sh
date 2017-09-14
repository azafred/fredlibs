#!/usr/bin/env bash
git add .
git commit -am "$@"
git push
./pushtag.sh
VERSION=$(git describe --abbrev=0 --tags)
echo "=== Creating Source tarball ==="
python2 ./setup.py sdist
echo "=== Creating Wheel ==="
python2 ./setup.py bdist_wheel
echo "=== Creating Egg ==="
python2 ./setup.py bdist_egg
echo "=== Building Documentation ==="
python2 ./setup.py build_sphinx
# echo "=== Uploadig Documentation ==="
# python2 ./setup.py upload_sphinx
echo "=== Uploading to pypi ==="
twine upload dist/*-${VERSION}*
