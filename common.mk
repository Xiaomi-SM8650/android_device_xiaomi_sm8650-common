#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/sm8650-common/sm8650-common-vendor.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs.
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enable virtual A/B compression
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/vabc_features.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# A/B
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := lz4
PRODUCT_VENDOR_PROPERTIES += ro.virtual_ab.compression.threads=true

# API level
BOARD_API_LEVEL := 34
BOARD_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_API_LEVEL)

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
