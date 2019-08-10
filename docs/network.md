# Static Network Configuration

The default configuration provides multiple services that perform network
initialization and static configuration using helper scripts that require
programs from the `iproute2` package.

Configuration files are typically stored in `/etc/netcfg/` (depending on
configure options).

Please note that the loopback device is treated specially and not included in
any of the network configuration outlined below. The loopback device is brought
up and configured by a dedicated service long before the network configuration
is done.


## Interface Renaming

If the `ifrename` service is enabled (it is disabled by default), network
interfaces are renamed based on a rule set stored in the file `ifrename`.
The file contains comma separated shell globing patterns for the current
interface name, MAC address and a prefix for the new interface name.

For each network interface, rules are processed top to bottom. If the first two
globing patterns apply, the interface is renamed. Interfaces with the same
prefix are sorted by mac address and a running index is appended to the prefix.

If none of the rules apply, the interface name is left unchanged.


The intent is, to provide a way to configure persistent, deterministic names for
at least all network interfaces that are permanently installed on a board.

Extension cards or external network adapters should be given a different prefix
to avoid changes in the order as they come and go.


## Static Interface and Route Configuration

After interface renaming, an iproute2 batch script `/etc/netcfg/static` is
executed with the `-force` option is set, i.e. it will plough throug the
entire script without aborting, but the service will be marked as having
failed if any of the batch lines fail.


## Net Filter Tables


An additional service is provided that restores the nft rule set from
`/etc/nftables.rules`.


# DHCP based network configuration

If the configure option `--enable-dhcpclient` is set, two services are added.
The service `dhpcdmaster` launches a global dhcpcd instance.

For each port that should be configured via DHCP, the service `dhcpcd` needs
to be enabled manually with the port name as argument. The service the runs
after the master service and sends a signal to the master to operate on that
port.
