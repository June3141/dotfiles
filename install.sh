#!/bin/bash

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$F" == ".DS_Store" ]] && continue

  echo "$f"
done
