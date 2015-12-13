#!/bin/bash
pip install "ipython[notebook]"
pip install jupyterhub
git clone https://github.com/jupyter/jupyterhub.git
cd jupyterhub
pip install -r dev-requirements.txt -e .

#Make jupyterhub
mkdir /etc/jupyterhub
chown jupyter_usr /etc/jupyterhub

