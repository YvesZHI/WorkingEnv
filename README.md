# config-gsettings

### Introduction ###
These shell scripts are to configure your Ubuntu to enable remote desktop.<br>


Configuring vino-server immediately for Ubuntu16.04 is not possible via remote shell.<br>
The key is to set the DBUS_SESSION_BUS_ADDRESS environment variable.<br>
You can execute `./configure.sh` which configures vino-server automatically to enable your remote desktop.<br>


### Attention ###
The port for remote desktop is configurable: `./configure.sh [PORT]`.<br>
By default, it is 5901.
