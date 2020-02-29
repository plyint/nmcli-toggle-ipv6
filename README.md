# nmcli-toggle-ipv6.sh

nmcli-toggle-ipv6.sh wraps the NetworkManager CLI tool to allow simple toggling of IPv6 on a network interface.  Disabling IPv6 is purposefully designed to be temporary, so that rebooting or disabling/reenabling the network interface will restore IPv6 functionality.  

It is intended to be used when IPv6 is suspected of causing a connectivity problem and needs to be temporarily disabled.  For example, it is known that some ISPs do not properly handle IPv6 routing especially on mobile networks.  (e.g. https://github.com/rubygems/rubygems/issues/2253)

## Requirements

nmcli-toggle-ipv6.sh requires that NetworkManager is installed on the Linux distribution.  (This is normally installed by default on Ubuntu)

NetworkManager is a part of the [GNOME](https://www.gnome.org) desktop environment.

## Usage

Make sure the script has executable permissions and then invoke it using sudo from the command line.  The sudo command is required, so that the ipv6 addresses can be flushed from the interface.  If it is not provided an "Operation not permitted" error will occur.

No arguments, the current active wifi interface will be toggled for ipv6
```
sudo ./nmcli-toggle-ipv6.sh
```

The specified interface (e.g. wlp3s0) will be toggled for ipv6
```
sudo ./nmcli-toggle-ipv6.sh wlp3s0
```
