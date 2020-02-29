# nmcli-toggle-ipv6.sh

nmcli-toggle-ipv6.sh wraps the NetworkManager CLI tool to allow simple toggling of IPv6 on a network interface.  Disabling IPv6 is purposefully designed to be temporary, so that rebooting or disabling/reenabling the network interface will restore IPv6 functionality.  

It is intended to be used when IPv6 is suspected of causing a connectivity problem and needs to be temporarily disabled.  For example, it is known that some ISPs do not properly handle IPv6 routing especially on mobile networks.  (e.g. https://github.com/rubygems/rubygems/issues/2253)

## Requirements

nmcli-toggle-ipv6.sh requires that NetworkManager is installed on the Linux distribution.  (This is normally installed by default on Ubuntu)

NetworkManager is a part of the [GNOME](https://www.gnome.org) desktop environment.

## Usage

Make sure the script has executable permissions and then invoke it from the command line.

No arguments, the current active wifi interface will be toggled for ipv6
```
./nmcli-toggle.sh
```

The specified interface (e.g. wlp3s0) will be toggled for ipv6
```
./nmcli-toggle.sh wlp3s0
```
