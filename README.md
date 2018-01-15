# config-gsettings

### Introduction ###
These shell scripts are to configure your Ubuntu to enable remote desktop.<br>


Configuring vino-server immediately for Ubuntu16.04 is not possible via remote shell.<br>
The key is to set the DBUS_SESSION_BUS_ADDRESS environment variable.<br>
You can execute `./configure.sh` which configures vino-server automatically to enable your remote desktop.<br>

The port for remote desktop is configurable: `./configure.sh [PORT]`.<br>
By default, it is 5901.

### Attention ###
Do NOT ssh via remote shell with root to do this configuration, this may cause some permission issue.<br>
Multi-remote-desktop is unachievable. Because the remote desktop that you get is a real desktop, meaning that it is different from some others, such as vnc4server, which produces simulated desktops.
