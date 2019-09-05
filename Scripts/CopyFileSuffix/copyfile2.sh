#!/bin/bash
#
# song@20190904
#

function copyFile() {
  for f in $1/*
  do
    if [[ -f ${f} && ${f##*.} == xml ]]; then
      if [[ ! -d $2 ]]; then
        mkdir -p $2
      fi
      cp ${f} $2
    elif [[ -d ${f} ]]; then
      copyFile ${f} $2/${f##*/}
    fi
  done
}

copyFile $1 $2

