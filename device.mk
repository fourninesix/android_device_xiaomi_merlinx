#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/merlinx

# Inherit from mt6768-common
$(call inherit-product, device/xiaomi/mt6768-common/mt6768-common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/merlinx/merlinx-vendor.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/aurisys_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/aurisys_config.xml

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResOverlayMerlinx \
    SettingsOverlayMerlinx \
    SystemUIOverlayMerlinx

# Kernel
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/dtb.img:dtb.img

# Recovery
RECOVERY_TS_FW_PATH := vendor/xiaomi/merlinx/proprietary/vendor/firmware
PRODUCT_COPY_FILES += \
    $(RECOVERY_TS_FW_PATH)/novatek_ts_fw.bin:recovery/root/vendor/firmware/novatek_ts_fw.bin \
    $(RECOVERY_TS_FW_PATH)/novatek_ts_mp.bin:recovery/root/vendor/firmware/novatek_ts_mp.bin \
    $(RECOVERY_TS_FW_PATH)/novatek_ts_g6_fw.bin:recovery/root/vendor/firmware/novatek_ts_g6_fw.bin \
    $(RECOVERY_TS_FW_PATH)/novatek_ts_g6_mp.bin:recovery/root/vendor/firmware/novatek_ts_g6_mp.bin \
    $(RECOVERY_TS_FW_PATH)/novatek_ts_g6_mp.bin:recovery/root/vendor/firmware/novatek_ts_g6_mp.bin \
    $(RECOVERY_TS_FW_PATH)/novatek_ts_72d_fw.bin:recovery/root/vendor/firmware/novatek_ts_72d_fw.bin \
    $(RECOVERY_TS_FW_PATH)/novatek_ts_72d_mp.bin:recovery/root/vendor/firmware/novatek_ts_72d_mp.bin \
    $(RECOVERY_TS_FW_PATH)/focaltech_ts_fw_xinli.bin:recovery/root/vendor/firmware/focaltech_ts_fw_xinli.bin

# NFC stack (AOSP)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_merlinnfc/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_merlinnfc/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_merlinnfc/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_merlinnfc/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_merlinnfc/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_merlinnfc/com.android.nfc_extras.xml

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    NfcNci \
    Tag

# SKU-specific properties
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sku_props/build_ss_vendor.prop:$(TARGET_COPY_OUT_VENDOR)/build_ss_vendor.prop \
    $(DEVICE_PATH)/configs/sku_props/build_dsds_vendor.prop:$(TARGET_COPY_OUT_VENDOR)/build_dsds_vendor.prop


