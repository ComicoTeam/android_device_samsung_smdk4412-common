#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/smdk4412-common

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := false

TARGET_BOOTANIMATION_PRELOAD := true

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_64_BIT_BINDER := true

BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos4
TARGET_SOC := exynos4x12
TARGET_BOOTLOADER_BOARD_NAME := smdk4x12

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

# Board already specifies -mcpu, but it won't hurt to add mtune, too
BOARD_GLOBAL_CFLAGS += -mtune=cortex-a9
BOARD_GLOBAL_CPPFLAGS += -mtune=cortex-a9

# Specify L1/L2 caches used for Exynos 4412
BOARD_GLOBAL_CFLAGS += --param l1-cache-line-size=32 --param l1-cache-size=32 --param l2-cache-size=1024
BOARD_GLOBAL_CPPFLAGS += --param l1-cache-line-size=32 --param l1-cache-size=32 --param l2-cache-size=1024

EXYNOS4X12_ENHANCEMENTS := true
EXYNOS4_ENHANCEMENTS := true

ifdef EXYNOS4X12_ENHANCEMENTS
BOARD_GLOBAL_CFLAGS += -DEXYNOS4_ENHANCEMENTS
BOARD_GLOBAL_CFLAGS += -DEXYNOS4X12_ENHANCEMENTS
endif

# Kernel
BOARD_KERNEL_CMDLINE := console=ttySAC2,115200
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
#KERNEL_TOOLCHAIN := prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
LZMA_RAMDISK_TARGETS := recovery

TARGET_PROCESS_SDK_VERSION_OVERRIDE += \
    /system/vendor/bin/hw/rild=19

TARGET_LD_SHIM_LIBS := \
    /system/lib/libsuspend.so|libsuspend-shim.so \
    /system/lib/libandroid_servers.so|libsuspend-shim.so

WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true

# Filesystem
#BOARD_NAND_PAGE_SIZE := 4096
#BOARD_NAND_SPARE_SIZE := 128
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12381585408
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true

# Hardware tunables
BOARD_HARDWARE_CLASS := hardware/samsung/lineagehw \
    device/samsung/smdk4412-common/lineagehw

# Graphics
USE_OPENGL_RENDERER := true
BOARD_USES_SKIAHWJPEG := true
TARGET_PROVIDES_LIBEGL_MALI := true
TARGET_NEEDS_NATIVE_WINDOW_FORMAT_FIX := true
# Only needed by Samsung skia changes (not ported beyond 4.4)
#BOARD_GLOBAL_CFLAGS += -DSEC_HWJPEG_G2D
BOARD_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH
BOARD_USE_MALI_ALIGNMENT := true

# FIMG Acceleration
BOARD_USES_FIMGAPI := true
BOARD_USES_SKIA_FIMGAPI := true

# HWC
BOARD_USES_PROPRIETARY_HWC := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# HWComposer
BOARD_USES_HWCOMPOSER := true
BOARD_USE_SYSFS_VSYNC_NOTIFICATION := true

# Camera
BOARD_CAMERA_HAVE_ISO := true
BOARD_CAMERA_MSG_MGMT := true
#TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# OMX
BOARD_NONBLOCK_MODE_PROCESS := true
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USES_MFC_FPS := true
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_CSC_FIMC := false

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Logging
TARGET_USES_LOGD := false

# RIL
BOARD_MOBILEDATA_INTERFACE_NAME := "pdp0"
# RIL
TARGET_SPECIFIC_HEADER_PATH += device/samsung/smdk4412-common/include

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4334
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_BAND                        := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI          := true

# Network Routing
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true
BOARD_CUSTOM_BT_CONFIG := device/samsung/smdk4412-common/bluetooth/vnd_smdk4x12.txt

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/s3c-usbgadget/gadget/lun%d/file"

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/smdk4412-common/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/smdk4412-common/recovery/graphics.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP Support - Optional
ifeq ($(WITH_TWRP),true)
-include device/samsung/smdk4412-common/twrp/twrp.mk
endif

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/smdk4412-common/selinux

# Charging mode
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGER_ENABLE_SUSPEND := true
WITH_LINEAGE_CHARGER := false
RED_LED_PATH := /sys/class/leds/led_r/brightness
GREEN_LED_PATH := /sys/class/leds/led_g/brightness
BLUE_LED_PATH := /sys/class/leds/led_b/brightness
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness

SELINUX_IGNORE_NEVERALLOWS := true

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.exynos4

# LPM Battery Percentage
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Use release-keys to sign the build
BUILD_KEYS := release-keys

ifeq ($(BUILD_KEYS),release-keys)
PRODUCT_DEFAULT_DEV_CERTIFICATE := .android-certs/releasekey
endif

# inherit from the proprietary version
-include vendor/samsung/smdk4412-common/BoardConfigVendor.mk
