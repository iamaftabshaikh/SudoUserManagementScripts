#!/bin/bash

# --------------------------------------
# Script to check sudo access of user.
#
# Author: Aftab Shaikh
# Date: 07-Aug-2023
# Version: v1.0
# 
# This script will check if user has sudo access or not.
# --------------------------------------


# User input for the username from command line argument
USERNAME="$1"

# Check if username is provided
if [[ -z "${USERNAME}" ]]
then
  echo 'Missing username. Usage: ./scriptname.sh username'
  exit 1
fi

# Check sudo privileges
sudo -l -U ${USERNAME} | grep "(ALL : ALL) NOPASSWD: ALL" &> /dev/null

if [[ "$?" -eq 0 ]]
then
  echo "User ${USERNAME} has full sudo access."
else
  echo "User ${USERNAME} does not have full sudo access."
fi

exit 0