#!/bin/sh

resolve() {
	local domain="$1"
	local server="$2"

	if [ -x "$(command -v dig)" ]; then
		if [ -z "$server" ]; then
			dig +short "$domain"
		else
			dig +short "@$server" "$domain"
		fi
		return $?
	fi

	if [ -x "$(command -v drill)" ]; then
		if [ -z "$server" ]; then
			drill "$domain" | grep "^$domain." | cut -d$'\t' -f5
		else
			drill "@$server" "$domain" | grep "^$domain." |\
				cut -d$'\t' -f5
		fi
		return $?
	fi
	exit 1
}

try_update() {
	while read ip; do
		if ntpdate -bu "$ip"; then
			return 0
		fi
	done

	return 1
}

pool="pool.ntp.org"
dns="1.1.1.1"

# try default DNS server first
resolve "$pool" "" | try_update
[ $? -eq 0 ] && exit 0

# try fallback public dns server
ping -q -c 1 "$dns" || exit 1

resolve "$pool" "$dns" | try_update
exit $?
