include $(TOPDIR)/rules.mk

APP_TITLE:=VuCI Support for BACnet

APP_TLT_NAME:=BACnet Router
APP_ROUTER:=$(TLT_PLATFORM_NAME)
APP_APP_NAME:=bacnet-router

define Package/vuci-app-bacnet-ui/teltonika_rut9m
  PKG_ROUTER:=RUT956 RUT906
endef

define Package/vuci-app-bacnet-ui/mdm9x07
  PKG_ROUTER:=TRB145
endef

define Package/vuci-app-bacnet-ui/teltonika_trb2xx
  PKG_ROUTER:=TRB245 TRB255
endef

include ../app.mk

define Package/vuci-app-bacnet-ui/description
  Bacnet router application is designed for communication between BACnet IP and MS/TP serial networks.
endef

# call BuildPackage - OpenWrt buildroot signature
