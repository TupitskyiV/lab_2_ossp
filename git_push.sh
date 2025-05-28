
 #!/bin/bash


 if [ "$#" -ne 2 ]; then
    echo "Error: Invalid number of arguments..."
    echo "Uses: $0 /home/student/SysProg/LabWork_1 git@github.com:TupitskyiV/lab_2_ossp.git"
    exit 1
 fi

 LOCAL_DIR="$1"
 REMOTE_REPO="$2"

 if [ ! -d "$LOCAL_DIR" ]; then
    echo "Error: Directory does not exist: '$LOCAL_DIR'"
    exit 1
 fi


 if ! cd "$LOCAL_DIR"; then
     echo "Error: Cannot access directory"
     exit 1
 fi


if [ ! -d ".git" ]; then
    echo "Initializing Git repository '$LOCAL_DIR'"
    git init
 fi


 git add .
 git commit -m "Initial commit" || echo "Nothing commit"


 echo "Configuring remote repository..." 
 git remote add origin "$REMOTE_REPO" 2>/dev/null || git remote set-url origin "$REMOTE_REPO"


 echo "Setting main branch..."
 git branch -M main


 echo "Pulling changes from GitHub..."
 if ! git pull origin main --allow-unrelated-histories --rebase=false; then
      echo "Error: Pull failed - resolve conflicts manually."
      exit 1
 fi

 git add .
 git commit -m "Merged remote changes" || echo  "No changes to commit after merge"

 echo "Pushing to GitHub..."
 if git push origin main; then 
     echo "Success! Code uploaded to GitHub"
 else
     echo "Error: Push failed. Try to pull again or resolve conflicts"
     exit 1
 fi
