#!/bin/bash
# Runs ESLint against all changed files for the branch.

if [ $# -eq 0 ]; then
	echo "Comparing with Master"
	compareTo=master
else
	echo "Comparing with $1"
	compareTo=$1
fi

git diff --name-only $compareTo react/ | while read line; do
	echo "Checking $line"
	./node_modules/.bin/eslint --fix $line
done
