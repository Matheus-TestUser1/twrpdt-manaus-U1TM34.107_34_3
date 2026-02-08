#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/manaus
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.mt6895 \
    bootctrl.mt6895.recovery \
    bootctrl 
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/Image

# DTBO
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtbo.img:$(TARGET_COPY_OUT_RECOVERY)/root/prebuilt/dtbo.img

# DTB (if separate)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtb:$(TARGET_COPY_OUT_RECOVERY)/root/prebuilt/dtb

# Recovery init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6879.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6879.rc

# Recovery binaries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/sbin/postrecoveryboot.sh:$(TARGET_COPY_OUT_RECOVERY)/root/sbin/postrecoveryboot.sh

# Vendor modules (if needed for touch/display)
# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/recovery/root/vendor/lib/modules/mtk_panel_drv.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/mtk_panel_drv.ko

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=manaus \
    ro.product.name=manaus \
    ro.build.product=manaus \
    ro.twrp.device=manaus \
    ro.hardware=mt6879 \
    ro.hardware.platform=mt6879 \
    ro.board.platform=mt6879

# TWRP properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.boot=true \
    ro.twrp.version=3.7.0_12 \
    twrp.version=3.7.0_12

# Disable encryption in recovery
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.state=unsupported \
    ro.crypto.type=none

# MediaTek properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.mediatek.platform=MT6879 \
    ro.mediatek.chip_ver=S01 \
    ro.mediatek.version.release=12 \
    ro.mediatek.version.sdk=4

# Debug properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    ro.secure=0 \
    ro.adb.secure=0 \
    persist.sys.usb.config=mtp,adb \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1

# USB properties
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.controller=musb-hdrc \
    sys.usb.ffs.aio_compat=true

# Disable APEX in recovery (causes issues)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.apex.updatable=false

# Override heap growth limit
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m
