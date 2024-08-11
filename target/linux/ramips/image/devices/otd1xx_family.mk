define Device/tlt-desc-otd140
	$(Device/tlt-mt7628-hw-common)
	HARDWARE/System_Characteristics/Flash_Storage := $(HW_FLASH_SIZE_16M) $(HW_FLASH_TYPE_SERIAL)
	HARDWARE/Wireless/Wireless_mode :=
	HARDWARE/Wireless/WIFI_users :=
	HARDWARE/Ethernet/Port := 2 $(HW_ETH_ETH_PORTS)
	HARDWARE/Ethernet/Speed := $(HW_ETH_SPEED_100)
	HARDWARE/Ethernet/Standard := (can be configured as WAN), $(HW_ETH_LAN_2_STANDARD)
	HARDWARE/Power/Connector := $(HW_POWER_CONNECTOR_RJ45)
	HARDWARE/Power/Input_voltage_range := $(HW_POWER_VOLTAGE_POE_1)
	HARDWARE/Power/PoE_Standards :=
	HARDWARE/Power/Power_consumption := Idle: < 2.5 W / Max: < 6 W / PoE Max < 21 W
	HARDWARE/Physical_Interfaces/Power := $(HW_INTERFACE_POWER_RJ45)
	HARDWARE/Physical_Interfaces/IO:=
	HARDWARE/Physical_Interfaces/Status_leds := 3 x Mobile connection type, 3 x Mobile connection strength, 4 x ETH status LEDs
	HARDWARE/Physical_Interfaces/SIM := 2 $(HW_INTERFACE_SIM_TRAY)
	HARDWARE/Physical_Interfaces/Atennas := 2 x Internal antennas
	HARDWARE/Physical_Interfaces/Antennas_specifications := 1 x 698 - 960 / 1710 - 2690MHz, 50 Ω, VSWR <3.5, gain <3 dBi, omnidirectional; \
	1 x 698 - 960 / 1710 - 2690MHz, 50 Ω, VSWR <3, gain <4.5 dBi, omnidirectional;
	HARDWARE/PoE_In/PoE_ports := 1 x PoE In
	HARDWARE/PoE_In/PoE_standards := 802.3af/at
	HARDWARE/PoE_Out/PoE_ports := 1 x PoE Out
	HARDWARE/PoE_Out/PoE_standards := 802.3af and 802.3at Alternative B
	HARDWARE/PoE_Out/PoE_Max_Power_per_Port_(at_PSE) := 24 W Max (power supply unit dependent)
	HARDWARE/Operating_Enviroment/Ingress_Protenction_Rating := $(HW_OPERATING_PROTECTION_IP55)
	HARDWARE/Physical_Specification/Casing_material := Plastic (PC+ASA)
	HARDWARE/Physical_Specification/Dimensions := 110 x 49.30 x 235 mm
	HARDWARE/Physical_Specification/Weight := 855 g
	HARDWARE/Physical_Specification/Mounting_options := Mounting Bracket (for vertical flat surface or pole mounting)
	HARDWARE/Regulatory_&_Type_Approvals/Regulatory := CE, UKCA, EAC, UCRF, RCM
endef
