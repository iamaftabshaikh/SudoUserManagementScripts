#!/bin/bash

# --------------------------------------
# Script to create new sudo user
#
# Author: Aftab Shaikh
# Date: 07-Aug-2023
# Version: v1.0
# 
# This script creates new user on the local system
# --------------------------------------


# Check if the script is being run as root
if [[ "${UID}" -ne 0 ]]
then
  echo 'Please run with sudo or as root.'
  exit 1
fi

# User input for the username from command line argument
USERNAME="$1"

# Check if username is provided
if [[ -z "${USERNAME}" ]]
then
  echo 'Missing username. Usage: sudo ./scriptname.sh username'
  exit 1
fi

# Create the user
useradd -m ${USERNAME}

# Check to see if the useradd command succeeded
if [[ "${?}" -ne 0 ]]
then
  echo 'The account could not be created.'
  exit 1
fi
echo "User ${USERNAME} created successfully."

# Add user to sudoers file
echo "${USERNAME} ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/${USERNAME}

# Check to see if the sudoers file update succeeded
if [[ "${?}" -ne 0 ]]
then
  echo 'The user could not be added to the sudoers file.'
  exit 1
fi
echo "User ${USERNAME} added to sudoers file successfully."

exit 0