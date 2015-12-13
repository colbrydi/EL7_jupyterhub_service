Some neighbors on the gitter jupyterhub chat room asked for my scripts to set up jupyterhub as a service in CentOS7. Please note that I am not an expert at jupyterhub or CentOS7 so there may be a better way to do this. Please feel free to use at your own risk.   

My current Jupyterhub vagrent repository is a mess so I pulled out just the setup scripts so I could just post the requested files. I typically run the install.sh script as root.

This script assumes that anaconda3 is installed in the following location:
/opt/anaconda3/bin/

I think you will be most interested in the following files:

#jupyterhub_start.sh# -- This is just a wrapper script that I use to set the appropriate path and call jupyterhub. Change to use your path to jupyterhub and your settings (for example, you may want to remove the sudospawner argument if you are not using that option and/or use a jupyterhub_config.py file instead). In my VM I run jupyterhub service from the /etc/jupyterhub directory. This is where you will want to put this wrapper script and any configuration files you have.  

#jupyterhub.service# -- This file is the systemctl file you need. A copy of this goes in  /usr/lib/systemd/system/ .  You want to rewrite it to point to your jupyterhub_start.sh script. If you put jupyerhub_start.sh in /etc/jupyterhub you probably don't need to rewrite it.

You should also check to make sure the User and Group fields are appropriate for your setup.

Once those two files are in place, you can start the service using the systemctl commands (See my install.sh file for an example of how I have things set up):

```
systemctl enable jupyterhub
systemctl start jupyterhub
systemctl daemon-reload
systemctl status jupyterhub.service
```

I think that should be it. Please let me know if this works for you.  Although I am not activaly maintining this code, I am happy to update it if anyone wants to send me suggested changes or improvements.  

- Dirk

