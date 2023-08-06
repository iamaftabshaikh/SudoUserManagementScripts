#!/bin/bash

# --------------------------------------
# Script to create new sudo users
#
# Author: Aftab Shaikh
# Date: 07-Aug-2023
# Version: v1.0
# 
# This script creates new users on the local system
# --------------------------------------

# Check if the script is being run as root
if [[ "${UID}" -ne 0 ]]
then
  echo 'Please run with sudo or as root.'
  exit 1
fi

# Check if at least two usernames are provided
if [[ $# -lt 2 ]]
then
  echo 'Missing usernames. Usage: sudo ./scriptname.sh username1 username2'
  exit 1
fi

# Loop over all arguments
for USERNAME in "$@"
do
  # Create the user
  useradd -m ${USERNAME}

  # Check to see if the useradd command succeeded
  if [[ "${?}" -ne 0 ]]
  then
    echo "The account ${USERNAME} could not be created."
    continue
  fi
  echo "User ${USERNAME} created successfully."

  # Add user to sudoers file
  echo "${USERNAME} ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/${USERNAME}

  # Check to see if the sudoers file update succeeded
  if [[ "${?}" -ne 0 ]]
  then
    echo "The user ${USERNAME} could not be added to the sudoers file."
    continue
  fi
  echo "User ${USERNAME} added to sudoers file successfully."
done

exit 0
