#
# Copyright (C) 2024 Teltonika-Networks
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bacnet-router
PKG_VERSION:=2024-04-02

PKG_SOURCE_VERSION:=7.7

PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/bacnet-router
	SECTION:=net
	CATEGORY:=Network
	TITLE:=BACnet IP MS/TP serial gateway (router) application
	DEPENDS:=+libstdcpp +libpthread +librt +libuci +libtlt_uci +lib-bacnet
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/bacnet_router
endef

define Package/bacnet-router/description
	Bacnet router application is designed for communication between BACnet IP and MS/TP serial networks.
endef

define Package/bacnet-router/prerm
	#!/bin/sh
	. /lib/functions.sh
	remove_bbmd_rule() {
		config_get name "$$1" name ""
		[ "$$name" = "BACnet" ] && uci_remove firewall "$$1"
	}
	config_load 'firewall'
	config_foreach remove_bbmd_rule "redirect"
	uci_commit network
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bacnet-router $(1)/usr/sbin/bacnet-router
endef


define Package/bacnet-router/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/config $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bacnet-router $(1)/usr/sbin/bacnet-router
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/bacnet_router.init $(1)/etc/init.d/bacnet_router
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/files/bacnet_router.config $(1)/etc/config/bacnet_router
endef

$(eval $(call BuildPackage,bacnet-router))
