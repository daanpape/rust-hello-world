#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rust-hello-world
PKG_VERSION:=0.0.1
PKG_MAINTAINER := Daan Pape <daan@dptechnics.com>

HOST_BUILD_DEPENDS:=rust/host

include $(INCLUDE_DIR)/package.mk
include ../../lang/rust/rustc-triple.mk

define Package/rust-hello-world
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=Rust Hello World example
endef

define Package/rust-hello-world/description
  Hello World rust example for OpenWRT.
endef
	
CONFIGURE_ARGS = \
	--host=$(RUSTC_TARGET_ARCH) \
	--build=$(RUSTC_HOST_ARCH)

define Build/Prepare
	$(call Build/Prepare/Default)
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	cd $(PKG_BUILD_DIR)
	rustc --target=$(RUSTC_TARGET_ARCH) $(PKG_BUILD_DIR)/main.rs
endef

define Package/rust-hello-world/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/main $(1)/usr/sbin/rust-hello-world
endef

$(eval $(call BuildPackage,rust-hello-world))
