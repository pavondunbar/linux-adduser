#!/bin/bash

# This Bash script will add a user and give it superuser privileges
# Script written by Pavon Dunbar

# Begin Script

# Update Packages & Remove Packages No Longer Needed

apt update && apt upgrade -y
apt autoremove -y
apt autoclean -y

# Add User

echo "Please type in a new user below: "
read username
adduser $username
usermod -a -G sudo $username
usermod -a -G www-data $username
id $username
ls -lad /home/$username
echo '$username ALL=(ALL) ALL' >> /etc/sudoers

# Verify User Has Been Added

cd /home
ls -al

echo "User $username has been successfully added and has been given root privileges."

exit 0

# End Script
