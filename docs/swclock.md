# Software Pseudo RTC

If the configure flag `--enable-swclock` is set, a few service and cron jobs
are enabled that try to help with systems that don't have a hardware real
time clock.

The software pseudo RTC uses a file in `/var/lib` (exact path can be
configured) as backing store for the current date and time.

When booting the system, a service called `swclock` restores the current time
from the file. When performing a reboot or shutdown, a service called
`swclocksave` writes the current time back to the file.

A cron job is enabled that writes the current time to the backing file hourly,
so in case the system momentarily loses power, it loses "only" up to one hour.
The time will drift much worse anyway if the system is powered off (even
intentionally) for a while.

All this is ensures that the system clock is monotonically increasing and only
somewhat behind the actual wall clock time.

To catch up with real time, an additional cron job is enabled that tries to
update the time from an NTP server every four hours. This functionality is
implemented in a small shell script, that is also called from a dhcpcd hook
once a lease is obtained, assuming the DHCP client configure option was set.
