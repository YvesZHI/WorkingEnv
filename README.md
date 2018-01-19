# Huawei-config

### Introduction ###
apt-remove-duplicate-source-entries.py is to remove the source entries duplicated of apt.<br>
initProxy.sh                           is to generate proxy settings for Huawei yellow cloud.<br>
recompile_git.sh                       is to recompile git with source code.<br>
configure.sh                           is to configure your Ubuntu to enable remote desktop.


##### About configure.sh #####
Configuring vino-server is necessary to enable remote desktop whereas it's impossible to configure via remote shell.<br>
The keys are:
- to make the user login automatically as the remote desktop needs to read some config files in your home directory.
- to set the DBUS_SESSION_BUS_ADDRESS environment variable.
- to disable keyring.

USAGE:<br>
`./configure.sh` to make the user login automatically, reboot is necessary.<br>
`./configure.sh [PORT]` again after the next login to configure the vino-server. The `[PORT]` is used for the remote desktop. By default, the `[PORT]` is 5901.<br>
`./configure.sh noautologin` to disable the autologin.

ATTENTION:<br>
Do NOT ssh via remote shell as root to do `./configure.sh`, this can cause some permission issue.<br>
Multi-remote-desktop is unachievable. The reason is that the remote desktop that you get is a real desktop, meaning that it is different from some others, such as vnc4server, which produces simulated desktops.


##### About recompile_git.sh #####
You may need this because git behind proxy under Ubuntu may cause some bug: https://askubuntu.com/questions/186847/error-gnutls-handshake-failed-when-connecting-to-https-servers/187199#187199<br>
In this case, you need to `apt remove git` and `./recompile_git.sh`.
