#!/bin/bash

# Copyright (C) 2020 by sandy1709

FILE=/app/.git
if [ -d "$FILE" ]
then
    echo "$FILE directory exists already."
else
  git clone -b main https://github.com/sandy1709/catuserbot catuserbot
  mv catuserbot/.git .git
  rm -rf catt
fi

python -m userbot
