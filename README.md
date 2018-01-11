# config-gsettings

### Introduction ###
Configuring vino-server immediately for Ubuntu16.04 is not possible via remote shell.<br>
The key is to set the DBUS_SESSION_BUS_ADDRESS environment variable.<br>
You can execute `./configure.sh` and configure vino-server automatically to make your remote desktop work.<br>


### Attention ###
You can't execute `./configure.sh` as root or with sudo.<br>
The port 5901 is used to configure.
