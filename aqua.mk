#
# Copyright (C) 2017 The LineageOS Project
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
DEVICE_PATH := device/xiaomi/aqua
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# HWUI configs
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
# Inherit common xiaomi msm8992
$(call inherit-product, device/xiaomi/msm8992-common/msm8992.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_aqua
PRODUCT_DEVICE := aqua
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi-4s
PRODUCT_MANUFACTURER := Xiaomi
BOARD_VENDOR := Xiaomi

# Device layout config
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Device specific overlay
DEVICE_PACKAGE_OVERLAYS := \
    $(DEVICE_PATH)/overlay

# Board info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Build fingerprint and name
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=aqua \
	BUILD_FINGERPRINT="Xiaomi/libra/libra:7.0/NRD90M/V8.2.3.0.NXKCNEC:user/release-keys" \
	PRIVATE_BUILD_DESC="libra-user 7.0 NRD90M V8.2.3.0.NXKCNEC release-keys"

# Fingerprint blobs
$(call inherit-product, vendor/xiaomi/aqua/aqua-vendor.mk)

# Fingerprint config for aqua device
PRODUCT_COPY_FILES += \
    device/xiaomi/aqua/keylayout/uinput-fpc.kl:system/usr/keylayout/uinput-fpc.kl \
    device/xiaomi/aqua/idc/uinput-fpc.idc:system/usr/idc/uinput-fpc.idc

# Fingerprint permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Build fingerprintd from source
PRODUCT_PACKAGES += \
    fingerprintd

# Fingerprint prop
TARGET_SYSTEM_PROP += device/xiaomi/aqua/system.prop

# Ramdisk package
PRODUCT_PACKAGES += \
    init.aqua.fpc.rc

# SELinux requirements
BOARD_SEPOLICY_DIRS += \
    device/xiaomi/aqua/sepolicy
