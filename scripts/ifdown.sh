#!/bin/sh
for IFPATH in /sys/class/net/*; do
	[ "$IFPATH" == "/sys/class/net/lo" ] && continue

	IF=`basename $IFPATH`

	ip link set dev "$IF" down
done
