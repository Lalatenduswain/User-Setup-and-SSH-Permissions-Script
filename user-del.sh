#!/bin/bash

# Check if the script is being run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Prompt for the username to be removed
read -p "Enter the username to be removed: " username

# Check if the user exists
if id "$username" &>/dev/null; then
  # Remove the user and their home directory
  userdel -r "$username"
  echo "User $username and their home directory have been removed."
else
  echo "User $username does not exist."
fi
