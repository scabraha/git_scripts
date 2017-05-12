#!/bin/bash
# Creates a commit link from the provided git reference 

ref=HEAD
for i in "$@"; do
  if [[ $i == "-o" ]]; then
    open=true
  elif [[ $i == "-c" ]]; then
    copy=true
  else
    ref=$i
  fi
done

repoUrl=`git config --get remote.origin.url`
url="${repoUrl//.git}/commit/`git rev-parse $ref`"

if [[ $copy == true ]]; then
  printf $url | pbcopy
fi

if [[ $open == true ]]; then
  open $url
fi
