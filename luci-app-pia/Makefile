include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-pia
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/luci-app-pia-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-pia
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI PIA Config
  DEPENDS:=+openvpn-openssl
endef

define Package/luci-app-pia/description
Configuration for Private Internet Access
endef

define Package/luci-app-pia/conffiles
endef

define Build/Prepare
  mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-pia/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,luci-app-pia))
