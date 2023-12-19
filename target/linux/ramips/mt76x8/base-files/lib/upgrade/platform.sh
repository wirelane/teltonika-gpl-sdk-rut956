. /lib/upgrade/common.sh

PART_NAME=firmware
REQUIRE_IMAGE_METADATA=1

platform_check_image() {
	return 0
}

platform_do_upgrade() {
	default_do_upgrade "$1"
}

compatible_to_ec200() {
	{ ! find_hw_mod "2c7c_6005"; } && {
		echo "EC200* modem detected but fw does not support it"
		return 1
	}
	return 0
}

platform_check_hw_support() {
	local adc_ver board exp

	board="$(cat /sys/mnf_info/name)"
	exp="^RUT9(51|56|01|06)"
	[[ ! $board =~ $exp ]] && return 0

	{ ! prepare_metadata_hw_mods "$1"; } && return 1

	[ -d "/sys/bus/usb/devices/1-1.3/1-1.3:1.0/tty/ttyCH343USB0" ]  && \
		{ ! find_hw_mod "CH343"; } && {
			echo "Found new RS232 chip but this fw does not support it"
			return 1
		}

	adc_ver="$(cat /sys/class/hwmon/hwmon0/device/name)"
	[ "$adc_ver" = "tla2021" ] && { ! find_hw_mod "TLA2021"; } && {
		echo "Found new adc chip TLA2021 but this fw does not support it"
		return 1
	}

	json_init
	json_load_file /etc/board.json
	json_get_keys modems modems
	json_select modems

	local vendor product

	for modem in $modems; do
		json_select "$modem"
		json_get_var builtin builtin

		[ "$builtin" != "1" ] && {
			continue
		}

		json_get_vars vendor product
		break
	done

	[ -z "$vendor" ] || [ -z "$product" ] && {
		echo "Unable to determine current modem model"
		# FW should satisfy all contitions
		compatible_to_ec200
		return "$?"
	}

	[ "${vendor}:${product}" != "2c7c:6005" ] && return 0

	compatible_to_ec200

	return "$?"
}
