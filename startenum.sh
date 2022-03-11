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
echo -e  "\n===USER INFORMATION @ $dirname===\n\n" > $userspath
echo -e  "\n==Currently Online Users==\n" >> $userspath
w >> $userspath
echo -e  "\n==User Login History==\n" >> $userspath
last >> $userspath
echo -e  "\n==/etc/passwd==\n" >> $userspath
cat /etc/passwd >> $userspath
echo -e  "\n==/etc/groups==\n" >> $userspath
cat /etc/group >> $userspath
echo -e  "\n==/etc/sudoers==\n" >> $userspath
sudo cat /etc/sudoers >> $userspath
echo -e "\n==========================\n"


# System Information
touch $filepath/host.out
hostpath=$filepath/host.out

echo -e  "\n===HOST INFORMATION @ $dirname===\n\n" > $hostpath

echo -e  "\n==HOSTNAME==\n" >> $userspath
hostname
echo -e  "\n==VERSION INFORMATION==\n" >> $userspath
uname -a
echo -e  "\n==RELEASE INFORMATION==\n" >> $userspath
cat /etc/*rel*
echo -e  "\n==SYSTEM UPTIME==\n" >> $userspath
uptime



# Persistence
touch $filepath/persistence.out
perpath=$filepath/persistence.out




# Network
touch $filepath/network.out
netpath=$filepath/network.out




# Processes
touch $filepath/process.out
procpath=$filepath/process.out




# File Enumeration
touch $filepath/files.out
filenumpath=$filepath/files.out




