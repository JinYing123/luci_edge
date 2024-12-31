include $(TOPDIR)/rules.mk

LUCI_TITLE:=Edge Compute
LUCI_DEPENDS:=+luci-base
LUCI_PKGARCH:=all

include $(BUILD_DIR)/luci.mk

# Install configuration files
define Package/luci-app-edgecompute/conffiles
/etc/config/edgecompute
endef

$(eval $(call BuildPackage,luci-app-edgecompute))
