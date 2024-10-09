#!/bin/sh

. /lib/functions/uci-defaults.sh
. /lib/functions/teltonika-defaults.sh

ucidef_target_defaults() {
	local model="$1"

	case "$model" in
	RUT9*)
		# set up MAC addresses
		ucidef_set_interface_default_macaddr "lan" "$(mtd_get_mac_binary config 0x0)"
		ucidef_set_interface_default_macaddr "wan" "$(macaddr_add "$(mtd_get_mac_binary config 0x0)" 1)"

		# set up io
		[ "${model:7:1}" = "6" ] || ucidef_set_hwinfo ios soft_port_mirror

		# set sd card
		[ "${model:4:1}" = "6" ] && [ "$hw_ver" -gt 4 ] && ucidef_set_hwinfo sd_card soft_port_mirror

		# set up modem
		[ "${model:5:1}" = "1" ] && \
			ucidef_add_static_modem_info "$model" "1-1" "2" "primary"

		[ "${model:5:1}" = "6" ] && \
			ucidef_add_static_modem_info "$model" "1-1.4" "2" "primary" "gps_out"
		;;
	esac
}
