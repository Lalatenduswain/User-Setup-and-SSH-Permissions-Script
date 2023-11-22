#!/bin/bash

# Check if the script is being run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Variables
username="lalatendu"
password="Qwerty@123"

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

# Check if the user already exists
if id "$username" &>/dev/null; then
  echo "User $username already exists."
else
  # Create the user
  useradd -m "$username" -s /bin/bash

  # Set the password
  echo "$username:$password" | chpasswd
  echo "Password for user $username set to $password."
fi

# Add the user to the sudoers file
if ! grep -q "^$username" /etc/sudoers; then
  echo "$username    ALL=(ALL:ALL) ALL" >> /etc/sudoers
  echo "User $username added to the sudoers file."
else
  echo "User $username is already in the sudoers file."
fi
