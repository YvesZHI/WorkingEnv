# Huawei-config

### Introduction ###
apt-remove-duplicate-source-entries.py is to remove the source entries duplicated of apt.<br>
initProxy.sh                           is to generate proxy settings for Huawei yellow cloud.<br>
configure.sh                           is to configure your Ubuntu to enable remote desktop.<br>
recompile_git.sh                       is to recompile git with source code.


##### About configure.sh #####
Configuring vino-server is necessary to enable remote desktop whereas it's impossible to configure via remote shell.<br>
The key is to set the DBUS_SESSION_BUS_ADDRESS environment variable.<br>
You can execute `./configure.sh` which configures vino-server automatically to enable your remote desktop.<br>

ATTENTION:<br>
Do NOT ssh via remote shell with root to do `./configure.sh`, this can cause some permission issue.<br>
Multi-remote-desktop is unachievable. Because the remote desktop that you get is a real desktop, meaning that it is different from some others, such as vnc4server, which produces simulated desktops.

The port for remote desktop is configurable: `./configure.sh [PORT]`. By default, it is 5901.

##### About recompile_git.sh #####
You may need this because git behind proxy under Ubuntu may cause some bug: https://askubuntu.com/questions/186847/error-gnutls-handshake-failed-when-connecting-to-https-servers/187199#187199<br>
In this case, you need to `apt remove git` and `./recompile_git.sh`.
