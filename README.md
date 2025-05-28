
 # Lab Work 2 - Operating Systems and Systems Programming


 This project contains automation scripts for:
 - Creating Linux users with SSH keys
 - Initializing and pushing local directories to a remote Git repository


 ## Scripts

 ### create_users.sh
 - Logs actions to `create_users.log`
 - `create_users.sh` - creat users and generates passwords + SSH keys
 - Save paswords in `*_password.txt`
 - Appends CSV lines to `users.csv`

 ### git_push.sh
 - `git_push.sh` -pushes specified folder to GitHub
 - Initializes Git
 - Links to remote
 - Handles unrelated histories and merdes
 - Pushes to `main`


 ## Files
 - `create_users.sh`: automates user creation and SSH setup
 - `git_push/sh`: initializes and pushes a directory to GitHub
 - `create_users.csv`:  stores login/password
 - `*.txt`:  password file
 - `create_users.log`: logs creation results
