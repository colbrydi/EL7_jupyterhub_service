#!/bin/bash                                                                                                 
echo ""
echo ""
echo "Starting Jupyterhub service"
echo ""

#set ports in EL7
firewall-cmd --zone=public --add-port=8888/tcp --permanent
firewall-cmd --reload

#Skip this step if you already have jupyterhub installed
./jupyterhub_install.sh

#Copy Service file
cp jupyterhub.service /usr/lib/systemd/system/                                                                 
#stop jupyterhub if it is running
systemctl stop jupyterhub

#This can probably be cleaned up
systemctl enable jupyterhub
systemctl start jupyterhub
systemctl daemon-reload  
systemctl status jupyterhub        

