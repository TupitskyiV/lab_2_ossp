
 #!/bin/bash


 users=("frank" "chester" "jery")


 for user in "${users[@]}"; do
     if [ -d "/home/$user" ]; then
        echo "User $user already exists"
        continue
     fi

 
     sudo useradd -m -s /bin/bash "$user"


     password=$(openssl rand -base64 12)
     sudo bash -c "echo 'user:$password' | chpasswd"
     echo "$password" > "${user}_pqssword.txt"
 

     sudo -u "$user" mkdir -p /home/$user/.ssh
     sudo -u "$user" ssh-keygen -t rsa -b 2048 -N "" -f /home/$user/.ssh/id_rsa


     echo "User $user created. Password saved to ${user}_password.txt"


 done

 echo "done"
