
 #!/bin/bash


 log_file="create_users.log"
 csv_file="create_users.csv"


 echo "=== User creation started: $(date) ===" >> "log_file"
 echo "username,password" > "$csv_file"


 users=("frank" "chester" "jery" "rick")


 for user in "${users[@]}"; do
     if [ -d "/home/$user" ]; then
        echo "User $user already exists" | tee -a "$log_file"
        continue
     fi

 
     sudo useradd -m -s /bin/bash "$user"


     password=$(openssl rand -base64 12)
     sudo bash -c "echo 'user:$password' | chpasswd"
     echo "$password" > "${user}_pqssword.txt"
     echo "$user,$password" >> "csv_file"
 

     sudo -u "$user" mkdir -p /home/$user/.ssh
     sudo -u "$user" ssh-keygen -t rsa -b 2048 -N "" -f /home/$user/.ssh/id_rsa


     echo "User $user created. Password saved to ${user}_password.txt" | tee -a "$log_file"


 done

 echo "=== Finished: $(date) ===" >> "$log_file"

 echo "Done"
