define Device/teltonika_rutm_common
	$(Device/tlt-mt7621-hw-common)
	HARDWARE/WAN/Port := 1 $(HW_ETH_WAN_PORT)
	HARDWARE/WAN/Speed := $(HW_ETH_SPEED_1000)
	HARDWARE/WAN/Standard := $(HW_ETH_LAN_2_STANDARD)
	HARDWARE/LAN/Port := 3 $(HW_ETH_LAN_PORTS)
	HARDWARE/LAN/Speed := $(HW_ETH_SPEED_1000)
	HARDWARE/LAN/Standard := $(HW_ETH_LAN_2_STANDARD)
	HARDWARE/Physical_Interfaces/Ethernet := 4 $(HW_ETH_RJ45_PORTS), $(HW_ETH_SPEED_1000)
	HARDWARE/Physical_Interfaces/SIM := 2 $(HW_INTERFACE_SIM_HOLDERS)
	HARDWARE/Physical_Interfaces/USB := 1 $(HW_INTERFACE_USB)
	HARDWARE/USB/Data_rate := $(HW_USB_2_DATA_RATE)
	HARDWARE/USB/Applications := $(HW_USB_APPLICATIONS)
	HARDWARE/USB/External_devices := $(HW_USB_EXTERNAL_DEV)
	HARDWARE/USB/Storage_formats := $(HW_USB_STORAGE_FORMATS)
	HARDWARE/Input_Output/Input := 1 $(HW_INPUT_DI_50V)
	HARDWARE/Input_Output/Output := 1 $(HW_OUTPUT_DO_50V)
	HARDWARE/Physical_Specification/Casing_material := $(HW_PHYSICAL_HOUSING_AND_PANELS_AL)
	HARDWARE/Physical_Specification/Mounting_options := $(HW_PHYSICAL_MOUNTING_KIT)
endef

define Device/TEMPLATE_teltonika_rutm08
	$(Device/teltonika_rutm_common)
	$(Device/template_rutm)
	DEVICE_MODEL := RUTM08
	DEVICE_INITIAL_FIRMWARE_SUPPORT := 7.6.1

	HARDWARE/Wireless/Wireless_mode :=
	HARDWARE/Wireless/WIFI_users :=
	HARDWARE/Physical_Interfaces/SIM :=
	HARDWARE/Physical_Interfaces/Status_leds := 8 x LAN status LEDs, 1 x Power LEDs
	HARDWARE/Power/Power_consumption := Idle < 1.8 W / Max < 5.5 W
	HARDWARE/Physical_Specification/Weight := 353 g
	HARDWARE/Physical_Specification/Dimensions := 115 x 32.2 x 95.2 mm

endef

define Device/TEMPLATE_teltonika_rutm09
	$(Device/teltonika_rutm_common)
	$(Device/template_rutm)
	DEVICE_MODEL := RUTM09
	DEVICE_INITIAL_FIRMWARE_SUPPORT := 7.6.1

	HARDWARE/Wireless/Wireless_mode :=
	HARDWARE/Wireless/WIFI_users :=
	HARDWARE/Physical_Interfaces/Status_leds := 3 x WAN type LEDs, 3 x Mobile connection type, 5 x Mobile connection strength, 8 x LAN status, 1 x Power
	HARDWARE/Power/Power_consumption := Idle < 2.65 W, Max < 9.82 W
	HARDWARE/Physical_Interfaces/Antennas := 2 x SMA for Mobile, 1 x SMA for GNSS
	HARDWARE/Physical_Specification/Weight := 457 g
	HARDWARE/Physical_Specification/Dimensions := 115 x 44.2 x 95.1 mm

endef

define Device/TEMPLATE_teltonika_rutm10
	$(Device/teltonika_rutm_common)
	$(Device/template_rutm)
	DEVICE_MODEL := RUTM10
	DEVICE_INITIAL_FIRMWARE_SUPPORT := 7.6.1

	HARDWARE/Physical_Interfaces/SIM :=
	HARDWARE/Wireless/Wireless_mode := $(HW_WIFI_5)
	HARDWARE/Physical_Interfaces/Status_leds := 8 x LAN status, 1 x Power LED, 2 x 2.4G and 5G Wi-Fi LEDs
	HARDWARE/Power/Power_consumption := Idle < 3.51 W, Max < 8.65 W
	HARDWARE/Physical_Interfaces/Antennas := 2 x RP-SMA for Wi-Fi
	HARDWARE/Physical_Specification/Weight := 359 g
	HARDWARE/Physical_Specification/Dimensions := 115 x 32.2 x 95.2 mm

endef

define Device/TEMPLATE_teltonika_rutm11
	$(Device/teltonika_rutm_common)
	$(Device/template_rutm)
	DEVICE_MODEL := RUTM11
	DEVICE_INITIAL_FIRMWARE_SUPPORT := 7.6.1

	HARDWARE/Physical_Interfaces/Status_leds := 4 x WAN type LEDs, 2 x Mobile connection type, 5 x Mobile connection strength, 8 x LAN status, 1 x Power, 2 x 2.4G and 5G Wi-Fi
	HARDWARE/Power/Power_consumption := Idle < 3.9 W, Max < 12.3 W
	HARDWARE/Physical_Interfaces/Antennas := 2 x SMA for Mobile, 2 x RP-SMA for Wi-Fi, 1 x SMA for GNSS
	HARDWARE/Physical_Specification/Weight := 460 g
	HARDWARE/Physical_Specification/Dimensions := 115 x 44.2 x 95.1 mm

endef

define Device/TEMPLATE_teltonika_rutm12
	$(Device/teltonika_rutm_common)
	$(Device/template_rutm)
	DEVICE_MODEL := RUTM12
	DEVICE_INITIAL_FIRMWARE_SUPPORT := 7.6.1

	HARDWARE/Physical_Interfaces/USB :=
	HARDWARE/USB/Data_rate :=
	HARDWARE/USB/Applications :=
	HARDWARE/USB/External_devices :=
	HARDWARE/USB/Storage_formats :=
	HARDWARE/Physical_Interfaces/Status_leds := 4 x WAN type LEDs, 2 x Mobile connection type, 5 x Mobile connection strength, 8 x LAN status, 1 x Power, 2 x 2.4G and 5G Wi-Fi
	HARDWARE/Power/Power_consumption := Idle < 3.9 W, Max < 12.3 W
	HARDWARE/Physical_Interfaces/Antennas := 2 x SMA for Mobile, 2 x RP-SMA for Wi-Fi, 1 x SMA for GNSS
	HARDWARE/Physical_Specification/Weight := 460 g
	HARDWARE/Physical_Specification/Dimensions := 115 x 44.2 x 95.1 mm

endef

define Device/TEMPLATE_teltonika_rutm50
	$(Device/teltonika_rutm_common)
	$(Device/template_rutm)
	DEVICE_MODEL := RUTM50
	DEVICE_INITIAL_FIRMWARE_SUPPORT := 7.7

	HARDWARE/LAN/Port := 4 $(HW_ETH_LAN_PORTS)
	HARDWARE/Physical_Interfaces/Status_leds := 3 x connection status LEDs, 3 x connection strength LEDs, 10 x Ethernet port status LEDs, 4 x WAN status LEDs, 1 x Power LED, 2 x 2.4G and 5G Wi-Fi LEDs
	HARDWARE/Physical_Interfaces/Antennas := 4 x SMA for LTE, 2 x RP-SMA for WiFi, 1 x SMA for GNNS
	HARDWARE/Physical_Interfaces/Ethernet := 5 $(HW_ETH_RJ45_PORTS), $(HW_ETH_SPEED_1000)
	HARDWARE/Power/Power_consumption := Idle <5 W, Max <18 W
	HARDWARE/Physical_Interfaces/Antennas := 4 x SMA for Mobile, 2 x RP-SMA for Wi-Fi, 1 x SMA for GNNS
	HARDWARE/Physical_Specification/Dimensions := 132 x 44.2 x 95.1 mm
	HARDWARE/Physical_Specification/Weight := 519 g

endef


define Device/TEMPLATE_teltonika_rutm51
	$(Device/teltonika_rutm_common)
	$(Device/template_rutm)
	DEVICE_MODEL := RUTM51
	DEVICE_INITIAL_FIRMWARE_SUPPORT := 7.4.4

	HARDWARE/LAN/Port := 4 $(HW_ETH_LAN_PORTS)
	HARDWARE/Physical_Interfaces/Status_leds := 3 x connection status LEDs, 3 x connection strength LEDs, 10 x Ethernet port status LEDs, 4 x WAN status LEDs, 1 x Power LED, 2 x 2.4G and 5G Wi-Fi LEDs
	HARDWARE/Physical_Interfaces/Antennas := 4 x SMA for Mobile, 2 x RP-SMA for Wi-Fi, 1 x SMA for GNNS
	HARDWARE/Physical_Interfaces/Ethernet := 5 $(HW_ETH_RJ45_PORTS), $(HW_ETH_SPEED_1000)
	HARDWARE/Power/Power_consumption := Idle <5 W, Max <18 W
	HARDWARE/Physical_Interfaces/Antennas := 4 x SMA for Mobile, 2 x RP-SMA for Wi-Fi, 1 x SMA for GNNS
	HARDWARE/Physical_Specification/Dimensions := 132 x 44.2 x 95.1 mm
	HARDWARE/Physical_Specification/Weight := 519 g

endef

define Device/TEMPLATE_teltonika_rutm52
	$(Device/teltonika_rutm_common)
	$(Device/template_rutm)
	DEVICE_MODEL := RUTM52
	DEVICE_INITIAL_FIRMWARE_SUPPORT := 7.7

	HARDWARE/Physical_Interfaces/USB :=
	HARDWARE/USB/Data_rate :=
	HARDWARE/USB/Applications :=
	HARDWARE/USB/External_devices :=
	HARDWARE/USB/Storage_formats :=
	HARDWARE/LAN/Port := 4 $(HW_ETH_LAN_PORTS)
	HARDWARE/Physical_Interfaces/Status_leds := 4 x connection status LEDs, 6 x connection strength LEDs, 10 x Ethernet port status LEDs, 4 x WAN status LEDs, 1 x Power LED, 2 x 2.4G and 5G Wi-Fi LEDs
	HARDWARE/Physical_Interfaces/Antennas := 4 x SMA for Mobile, 2 x RP-SMA for Wi-Fi, 1 x SMA for GNNS
	HARDWARE/Physical_Interfaces/Ethernet := 5 $(HW_ETH_RJ45_PORTS), $(HW_ETH_SPEED_1000)
	HARDWARE/Power/Power_consumption := Idle <5 W, Max <18 W
	HARDWARE/Physical_Interfaces/Antennas := 4 x SMA for Mobile, 2 x RP-SMA for Wi-Fi, 1 x SMA for GNNS
	HARDWARE/Physical_Specification/Dimensions := 132 x 44.2 x 95.1 mm
	HARDWARE/Physical_Specification/Weight := 519 g

endef

define Device/TEMPLATE_teltonika_rutm59
	$(Device/teltonika_rutm_common)
	$(Device/template_rutm)
	DEVICE_MODEL := RUTM59
	DEVICE_INITIAL_FIRMWARE_SUPPORT := 7.9.3

	HARDWARE/Wireless/Wireless_mode :=
	HARDWARE/Wireless/WIFI_users :=
	HARDWARE/LAN/Port := 4 $(HW_ETH_LAN_PORTS)
	HARDWARE/Physical_Interfaces/Status_leds := 3 x connection status LEDs, 3 x connection strength LEDs, 10 x Ethernet port status LEDs, 4 x WAN status LEDs, 1 x Power LED, 2 x 2.4G and 5G Wi-Fi LEDs
	HARDWARE/Physical_Interfaces/Ethernet := 5 $(HW_ETH_RJ45_PORTS), $(HW_ETH_SPEED_1000)
	HARDWARE/Power/Power_consumption := Idle <5 W, Max <18 W
	HARDWARE/Physical_Interfaces/Antennas := 4 x SMA for Mobile, 1 x SMA for GNNS
	HARDWARE/Physical_Specification/Dimensions := 132 x 44.2 x 95.1 mm
	HARDWARE/Physical_Specification/Weight := 519 g

endef
