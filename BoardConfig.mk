#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/tecno/TECNO-KE6

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := TECNO-KE6
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 320

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery

BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11b00000
BOARD_KERNEL_TAGS_OFFSET := 0x07880000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_DTB_OFFSET := 0x07880000

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_SEPARATED_DTBO := false
PRODUCT_COPY_FILES += $(TARGET_PREBUILT_DTB):dtb.img

BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 40894464
BOARD_CACHEIMAGE_PARTITION_SIZE := 314572800
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := tecno_dynamic_partitions
BOARD_TECNO_DYNAMIC_PARTITIONS_PARTITION_LIST := system product
BOARD_TECNO_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Platform
TARGET_BOARD_PLATFORM := mt6761

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6761
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Sepolicy
TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true
TARGET_HAS_FUSEBLK_SEPOLICY_ON_VENDOR := true
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Treble
BOARD_VNDK_VERSION := current
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext
BUILD_WITHOUT_VENDOR := true