#!/bin/bash

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$F" == ".DS_Store" ]] && continue

  echo "$f"
done

ln -s $(pwd)/xmonad ~/.xmonad
ln -s $(pwd)/i3 ~/.config/i3