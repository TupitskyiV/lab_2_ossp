#!/bin/bash

if ["$#" -ne 2 ]; then
   echo "Usage: $0 /local/folder/path https;//github.com/TupitskyiV/repo.git"
   exit 1
fi

LOCAL_DIR=$1
REMOTE_REPO=$2

cd "$LOCAL_DIR" || { echo "Directory '$LOCAL_DIR' does not exist."; exit 2; }

if [ ! -d ".git" ]; then
   git init
fi

git config user.name "TupitsyiV"
git config user.email "tupitskyi.v@donnu.edu.ua"

if git remoute | grep -q origin; then
    git remote remove origin
fi

git remote add origin "$REMOTE_REPO"
git add .
if ! git diff -cached -quiet; then
   git commit -m "Initial commit"
fi

git branch -M main
git push -u origin main
