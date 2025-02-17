#!/usr/bin/env bash

# Clear out old docs
rm out/*.md

echo "Running doc/main.go"
go run doc/main.go

echo "Cleaning up output"

if sed --help | grep GNU > /dev/null; then
  sed -i 's/```/~~~/g' out/*.md
else
  sed -i "" -e 's/```/~~~/g' out/*.md
fi

if [ "$1" ]
    then
        echo "rsync to $1"
        rsync out/ $1 --delete -r -v
fi
