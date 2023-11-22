#!/bin/bash

# Check if the script is being run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Prompt for the username
read -p "Enter the desired username: " username

# Prompt for the password (hidden input)
read -s -p "Enter the password for $username: " password
echo

# Create the user with their home directory
useradd -m -s /bin/bash "$username"

# Set the password
echo "$username:$password" | chpasswd
echo "Password for user $username set."

# Create SSH directory and set permissions
mkdir -m 700 "/home/$username/.ssh"

# Create SSH-related files
touch "/home/$username/.ssh/authorized_keys" "/home/$username/.ssh/known_hosts" "/home/$username/.ssh/config" "/home/$username/.ssh/id_rsa" "/home/$username/.ssh/id_rsa.pub"

# Set permissions for SSH-related files
chmod 700 "/home/$username/.ssh"
chmod 600 "/home/$username/.ssh/authorized_keys"
chmod 600 "/home/$username/.ssh/id_rsa"
chmod 644 "/home/$username/.ssh/id_rsa.pub"
chmod 644 "/home/$username/.ssh/known_hosts"
chmod 600 "/home/$username/.ssh/config"

# Add the user to the sudoers file
if ! grep -q "^$username" /etc/sudoers; then
  echo "$username    ALL=(ALL:ALL) ALL" >> /etc/sudoers
  echo "User $username added to the sudoers file."
else
  echo "User $username is already in the sudoers file."
fi
