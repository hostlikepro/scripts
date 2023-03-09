#!/bin/bash

if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as root" 
 exit 1
else
 echo "Script starts..."
 apt-get update && sudo apt-get upgrade -y
 deluser whoyakka
 apt -y install curl
 apt -y install mc
 #NUMLOCK
 apt -y install numlockx
 #wget https://raw.githubusercontent.com/hostlikepro/linux-install-scripts/main/numlock
 #wget https://raw.githubusercontent.com/hostlikepro/linux-install-scripts/main/numlock.service
 #mv numlock /usr/local/bin/
 #mv numlock.service /etc/systemd/system/
 #systemctl enable numlock.service
 #SSH
 apt -y install openssh-server
 rm /etc/ssh/sshd_config
 wget https://raw.githubusercontent.com/hostlikepro/linux-install-scripts/main/mail/sshd_config
 mv sshd_config /etc/ssh/
 mkdir -p /root/.ssh/
 wget https://raw.githubusercontent.com/hostlikepro/linux-install-scripts/main/authorized_keys
 mv authorized_keys /root/.ssh/
 systemctl restart openssh-server
 #FTP
 apt -y install vsftpd
 wget https://raw.githubusercontent.com/hostlikepro/linux-install-scripts/main/mail/vsftpd.conf
 rm /etc/vsftpd.conf
 mv vsftpd.conf /etc/
 wget https://raw.githubusercontent.com/hostlikepro/linux-install-scripts/main/mail/ftpusers
 rm /etc/ftpusers
 mv ftpusers /etc/
 service vsftpd restart
 #UFW
 apt -y install ufw
 ufw allow 4031
 ufw allow 4032
 ufw allow 4033
fi