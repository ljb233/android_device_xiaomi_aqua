# Fingerprint blobs
$(call inherit-product, vendor/xiaomi/aqua/aqua-vendor.mk)

# Fingerprint config for aqua device
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:system/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/idc/uinput-fpc.idc:system/usr/idc/uinput-fpc.idc

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
BOARD_SEPOLICY_DIRS := \
    $(LOCAL_PATH)/sepolicy
