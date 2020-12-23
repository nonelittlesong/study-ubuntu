#!/bin/bash

# root path
root_path=/home/song/Desktop/shit
# target path
target_path=/home/song/Desktop/myXML

function copyFile() {
  for f in $1/*
  do
    if [[ -f ${f} ]]; then
      if [[ ${f##*.} == xml ]]; then
        if [[ ! -d $2 ]]; then
          mkdir -p $2
        fi
        cp ${f} $2
      fi
    elif [[ -d ${f} ]]; then
      copyFile ${f} $2/${f##*/}
    fi
  done
}

copyFile ${root_path} ${target_path}

