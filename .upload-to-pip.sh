#!/usr/bin/env bash
echo "git describe:              `git describe`"
echo "python setup.py --version: `python setup.py --version`"
if [[ `git describe` == `python setup.py --version` && `git describe` == *-* ]]; then
  echo 'will skip this publishing this commit, a commit with tag is comming next'
else
  pip install twine
  rm -rf build dist
  python setup.py sdist bdist_wheel
  twine upload dist/*
fi
