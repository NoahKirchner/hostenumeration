#!/bin/bash

########################
# Basic Enumeration
# 
########################


# This will be run through SSH so it will be more consistent if we manually name the directory since we
# cannot just grab the IP address from the SSH command that this is being run through.
echo "Enter directory name (Use IP address)"
read dirname
mkdir ~/hosts/$dirname
filepath=~/hosts/$dirname

# User Information

touch $filepath/users.out
userspath=$filepath/users.out
echo "===USER INFORMATION @ $dirname===\n\n"
echo "==Currently Online Users==\n" >> $userspath
w >> $userspath
echo "==User Login History==\n" >> $userspath
last >> $userspath
echo "==/etc/passwd==\n" >> $userspath
cat /etc/passwd >> $userspath
echo "==/etc/groups==\n" >> $userspath
cat /etc/groups >> $userspath
echo "==/etc/sudoers==\n" >> $userspath
sudo cat /etc/sudoers >> $userspath




# System Information



# Persistence



# Network



# Processes



# File Enumeration
