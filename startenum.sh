#!/bin/bash

########################
# Basic Enumeration
# 
########################


# This will be run through SSH so it will be more consistent if we manually name the directory since we
# cannot just grab the IP address from the SSH command that this is being run through.
echo "Enter hostname (Use IP address)"
read dirname


# User Information

userspath=users.out
echo -e  "\n===USER INFORMATION @ $dirname===\n" > $userspath
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
hostpath=host.out

echo -e  "\n===HOST INFORMATION @ $dirname===\n" > $hostpath

echo -e  "\n==HOSTNAME==\n" >> $hostpath
hostname >> $hostpath
echo -e  "\n==VERSION INFORMATION==\n" >> $hostpath
uname -a >> $hostpath
echo -e  "\n==RELEASE INFORMATION==\n" >> $hostpath
cat /etc/*rel* >> $hostpath
echo -e  "\n==SYSTEM UPTIME==\n" >> $hostpath
uptime >> $hostpath



# Persistence
perpath=persistence.out

echo -e  "\n===PERSISTENCE INFORMATION @ $dirname===\n" > $perpath
echo -e  "\n==CRON==\n" >> $perpath
find /etc/cron* -type f -exec cat {} \; >> $perpath
sudo find /var/spool/cron/crontabs -type f -exec cat {} \; >> $perpath

# Network
netpath=network.out

echo -e  "\n===NETWORK INFORMATION @ $dirname===\n" > $netpath

echo -e  "\n==IFCONFIG==\n" >> $netpath
ifconfig -a >> $netpath
echo -e  "\n==ARP==\n" >> $netpath
arp -an >>$netpath
echo -e  "\n==NETSTAT==\n" >> $netpath
netstat -antup >> $netpath
echo -e  "\n==IPTABLES==\n" >> $netpath
sudo iptables -L >> $netpath
echo -e  "\n==lsof for ipv4/6==\n" >> $netpath
lsof -i 4 >> $netpath
lsof -i 6 >> $netpath
echo -e  "\n==DNS==\n" >> $netpath
cat /etc/hosts >>$netpath
cat /etc/resolv.conf >>$netpath

# Processes
procpath=process.out

echo -e  "\n===PROCESS INFORMATION @ $dirname===\n" > $procpath
echo -e  "\n==Process Tree==\n" >> $procpath
ps -aux >> $procpath
echo -e  "\n==Service Status==\n" >> $procpath
service --status-all >> $procpath


# File Enumeration
filenumpath=files.out

echo -e  "\n===VULNERABLE FILE INFORMATION @ $dirname===\n" > $filenumpath
find /tmp >> $filenumpath
find / -type f -perm /4000 -ls 2>/dev/null >> $filenumpath
find / -type f -perm /6000 -ls 2>/dev/null >> $filenumpath


