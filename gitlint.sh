#!/bin/bash
# Runs ESLint against all changed files for the branch.

if [ $# -eq 0 ]; then
  echo "Comparing with Master"
  compareTo=master
else
  echo "Comparing with $1"
  compareTo=$1
fi

git diff --name-only $compareTo . | while read file; do
  # Only lint js and jsx files
  if [[ $file =~ .*\.jsx*$ ]]; then
    echo "Checking $file"
    ./node_modules/.bin/eslint --fix $file
  fi
done
