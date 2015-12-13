#!/bin/bash
# Wraper script used to start jupyter. This script assumes 
# the binaries are installed in /opt/anaconda3/bin and jupyterhub
# has been installed using the sudospawner

echo ""
echo "Starting jupyterhub"
echo ""
export PATH=/opt/anaconda3/bin/:$PATH
echo $PATH
which jupyterhub
cd /etc/jupyterhub
jupyterhub --port 8888 --JupyterHub.spawner_class=sudospawner.SudoSpawner 

#Start jupyter with a config file
#jupyterhub -f /etc/jupyterhub/jupyterhub_config.py > $jupyter_log 2>&1 &
