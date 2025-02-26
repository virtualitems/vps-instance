# create user in linux

sudo useradd -m -s /bin/bash username # -m to create home directory, -s to set shell

# update password

sudo passwd username

# add user to group

sudo usermod -aG groupname username

# delete user

sudo userdel -r username # -r to remove home directory