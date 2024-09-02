define Device/tlt-desc-atrm50
	$(Device/teltonika_rutm_common)

	HARDWARE/SD_card/Physical_size := $(HW_SD_PHYSICAL_SIZE)
	HARDWARE/SD_card/Applications := $(HW_SD_APLICATIONS)
	HARDWARE/SD_card/Capacity := $(HW_SD_CAPACITY);
	HARDWARE/SD_card/Storage_formats := $(HW_SD_STORAGE_FORMATS)
	HARDWARE/Wireless/Wireless_mode := $(HW_WIFI_5)
	HARDWARE/Physical_Interfaces/Status_leds := 3 x connection status LEDs, 3 x connection strength LEDs, 10 x Ethernet port status LEDs, 4 x WAN status LEDs, 1 x Power LED, 2 x 2.4G and 5G Wi-Fi LEDs
	HARDWARE/Physical_Interfaces/Antennas := 4 x SMA for LTE, 2 x RP-SMA for WiFi, 1 x SMA for GNNS
	HARDWARE/Physical_Interfaces/Ethernet := 5 $(HW_ETH_RJ45_PORTS), $(HW_ETH_SPEED_1000)
	HARDWARE/Power/Power_consumption := Idle: <5 W, Max: <18 W
	HARDWARE/Physical_Interfaces/Antennas := 2 x SMA for Mobile, 1 x SMA for GNSS
	HARDWARE/Physical_Specification/Dimensions := 132 x 44.2 x 95.1 mm
	HARDWARE/Physical_Specification/Weight := 519 g

endef
