# Huawei-config

### Introduction ###
apt-remove-duplicate-source-entries.py is to remove the source entries duplicated of apt.<br>
recompile_git.sh                       is to recompile git with source code.<br>
initProxy.sh                           is to configure the proxy settings (including apt proxy and wget proxy) for Huawei yellow cloud.<br>
config.sh                              is to do basic system configuration after installing your Ubuntu.<br>
config_remote_desktop.sh               is to configure Ubuntu16.04 via remote shell to enable remote desktop.<br>
setPasswd.sh                           is to configure the password of VNC.


##### About config_remote_desktop.sh #####
Configuring vino-server is necessary to enable remote desktop whereas it's impossible to configure directly via remote shell.<br>
The keys are:
- to make the user login automatically as the remote desktop needs to read some config files in the home directory.
- to set the DBUS_SESSION_BUS_ADDRESS environment variable.
- to disable keyring to enable `vino-passwd` via remote shell.

USAGE:<br>
`./config_remote_desktop.sh` to make the user login automatically, reboot is necessary.<br>
`./config_remote_desktop.sh [PORT]` again after the next login to configure the vino-server. The `[PORT]` is used for the remote desktop. By default, the `[PORT]` is 5901.<br>
For now you should be able to get the remote desktop via your NVC viewer WITHOUT password.<br>
If you want to set a password for VNC, you MUST open a terminal IN the remote desktop that the VNC shows you and execute `./setPasswd.sh`. Doing this via remote shell doesn't work.<br>
`./setPasswd.sh none` to disable the VNC password, which allows you to get the remote desktop via your VNC viewer without password.<br>
If you don't need autologin anymore, just do `./config_remote_desktop.sh noautologin`.

ATTENTION:<br>
Do NOT ssh via remote shell as root to do `./config_remote_desktop.sh`, this can cause some permission issue.<br>
Multi-remote-desktop is unachievable. The reason is that the remote desktop that you get is a real desktop, meaning that it is different from some others, such as vnc4server, which produces simulated desktops.


##### About config.sh #####
This script does several configurations:
-) Update the CA certificate.
You must make sure that you have put the file `ca_huawei.crt` into your local repository. As you can see in the `.gitignore`, this file isn't and shouldn't be pushed into the github repository. You can get it from the manager.
-) Configure your networking service.
You can execute `./config.sh <network-interface> <last-octet-LAN-ip-address>` to start your networking service. Before doing that, you can execute `ifconfig -a` to list all available network interfaces and can get your LAN ip address from the manager.
For example, `./config.sh eth0 10` will configure `172.19.48.10` using the `eth0` to your LAN ip.
If you don't know which network interface can you use, you have to execute `ifconfig -a` and try one by one. To do so, you can execute `./config_ip.sh <network-interface> <last-octet-LAN-ip-address>`.
-) Initialize your proxy configuration.
If you need only configure your proxy, just execute `./initProxy.sh`.
-) Configure the source of ROS1.
-) Change the source of apt to cn.
-) Create a user named `mdc` and add it to sudoers.


##### About recompile_git.sh #####
You may need this because git behind proxy under Ubuntu may cause some bug: https://askubuntu.com/questions/186847/error-gnutls-handshake-failed-when-connecting-to-https-servers/187199#187199<br>
In this case, you need to `apt remove git` and `./recompile_git.sh`.
