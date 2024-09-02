define Device/teltonika_rut14x_common
	$(Device/tlt-mt7628-hw-common)
	HARDWARE/WAN/Port := 1 $(HW_ETH_WAN_PORT)
	HARDWARE/WAN/Speed :=$(HW_ETH_SPEED_100)
	HARDWARE/WAN/Standard := $(HW_ETH_WAN_STANDARD)
	HARDWARE/LAN/Port := 1 $(HW_ETH_LAN_PORT)
	HARDWARE/LAN/Speed := $(HW_ETH_SPEED_100)
	HARDWARE/LAN/Standard := $(HW_ETH_LAN_2_STANDARD)
	HARDWARE/Wireless/WIFI_users  := $(HW_WIFI_50_USERS)
	HARDWARE/Wireless/Wireless_mode := $(HW_WIFI_4), Access Point (AP), Station (STA)
	HARDWARE/Power/Connector := $(HW_POWER_CONNECTOR_3PIN)
	HARDWARE/Power/Power_consumption := Idle:< 1 W / Max:< 2 W
	HARDWARE/Physical_Interfaces/IO :=
	HARDWARE/Physical_Interfaces/Power := 1 x 3-pin power connector
	HARDWARE/Physical_Interfaces/Status_leds := 1 x WAN type LED, 1 x LAN type LED, 1 x Power LED
	HARDWARE/Physical_Interfaces/Antennas := 1 x RP-SMA for Wi-Fi
	HARDWARE/Physical_Specification/Casing_material := $(HW_PHYSICAL_HOUSING_AL)
	HARDWARE/Physical_Specification/Dimensions := 113.10 x 25 x 68.6 mm
	HARDWARE/Physical_Specification/Mounting_options := Integrated DIN rail bracket
	HARDWARE/Regulatory_&_Type_Approvals/Regulatory := CE/RED, UKCA, CB, RCM, FCC, IC, EAC, UCRF, WEEE
endef

define Device/TEMPLATE_teltonika_rut140
	$(Device/teltonika_rut14x_common)
	DEVICE_MODEL := RUT140
	HARDWARE/Physical_Specification/Weight := 142.3 g
endef
TARGET_DEVICES += TEMPLATE_teltonika_rut140

define Device/TEMPLATE_teltonika_rut142
	$(Device/teltonika_rut14x_common)
	DEVICE_MODEL := RUT142
	DEVICE_FEATURES := serial modbus sw-offload portlink
	DEVICE_PACKAGES := kmod-usb-ohci kmod-usb-serial-pl2303
	HARDWARE/Physical_Interfaces/RS232 := 1 $(HW_INTERFACE_RS232_DB9)
	HARDWARE/Physical_Specification/Weight := 149.2 g
endef
TARGET_DEVICES += TEMPLATE_teltonika_rut142
