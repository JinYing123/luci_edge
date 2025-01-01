include $(TOPDIR)/rules.mk

LUCI_TITLE:=Edge Compute
LUCI_DEPENDS:=+luci-base
LUCI_PKGARCH:=all
PKG_VERSION:=0.0.1
PKG_RELEASE:=0
include $(TOPDIR)/feeds/luci/luci.mk

# Install configuration files
define Package/luci-app-edgecompute/conffiles
/etc/config/edgecompute
endef

$(eval $(call BuildPackage,luci-app-edgecompute))