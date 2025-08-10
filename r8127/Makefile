#Download realtek r8127 linux driver from official site
#Unpack source file
#Replace orginal Makefile with this file
#Put this source to 'package' folder of OpenWRT SDK
#Build(make menuconfig, make defconfig, make)

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=r8127
PKG_VERSION:=11.015.00
PKG_RELEASE:=1

#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
#PKG_CAT:=bzcat

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/r8127
  SUBMENU:=Network Devices
  TITLE:=Driver for Realtek r8127 chipsets
  VERSION:=$(LINUX_VERSION)+$(PKG_VERSION)-$(BOARD)-$(PKG_RELEASE)
  FILES:= $(PKG_BUILD_DIR)/r8127.ko
  AUTOLOAD:=$(call AutoProbe,r8127)
  DEFAULT:=y
endef

define Package/r8127/description
 This package contains a driver for Realtek r8127 chipsets.
endef

R8127_MAKEOPTS= -C $(PKG_BUILD_DIR) \
		PATH="$(TARGET_PATH)" \
		ARCH="$(LINUX_KARCH)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		TARGET="$(HAL_TARGET)" \
		TOOLPREFIX="$(KERNEL_CROSS)" \
		TOOLPATH="$(KERNEL_CROSS)" \
		KERNELPATH="$(LINUX_DIR)" \
		KERNELDIR="$(LINUX_DIR)" \
		LDOPTS=" " \
		DOMULTI=1

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Build/Compile
	$(MAKE) $(R8127_MAKEOPTS) modules
endef

$(eval $(call KernelPackage,r8127))
