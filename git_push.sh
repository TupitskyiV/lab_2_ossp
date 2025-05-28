
 #!/bin/bash


 if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /local/folder/path git@github.com:TupitskyiV/repo.git"
    exit 1
 fi


 LOCAL_DIR="$1"
 REMOTE_REPO="$2"


 if [ ! -d "$LOCAL_DIR" ]; then
    echo "Local directory does not exist."
    exit 1
 fi


 cd  "$LOCAL_DIR" || exit 1


 if [ ! -d ".git" ]; then
   git init
 fi


 git add .
 git commit -m "Initial commit"


 git remote add origin "$REMOTE_REPO" 2>/dev/nuli || git remote set-url origin "$REMOTE_REPO"
 git branch -M main 
 git pull origin main --allow-unrelated-histories
 git push -u origin main
