#
# Copyright (C) 2011 The Android Open-Source Project
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

# define OMAP_ENHANCEMENT variables
include device/ti/panda/Config.mk

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/ti/panda/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/ti/panda/init.omap4pandaboard.rc:root/init.omap4pandaboard.rc \
	device/ti/panda/init.omap4pandaboard.usb.rc:root/init.omap4pandaboard.usb.rc \
        device/ti/panda/fstab.omap4pandaboard:root/fstab.omap4pandaboard \
	device/ti/panda/ueventd.omap4pandaboard.rc:root/ueventd.omap4pandaboard.rc \
	device/ti/panda/media_profiles.xml:system/etc/media_profiles.xml \
	device/ti/panda/media_codecs.xml:system/etc/media_codecs.xml \
	device/ti/panda/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        device/ti/panda/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PACKAGES := \
	com.android.future.usb.accessory \
    ti_omap4_ducati_bins \
    libOMX_Core \
    libOMX.TI.DUCATI1.VIDEO.DECODER

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	hwui.render_dirty_regions=false

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_PACKAGES += \
	boardidentity \
	libboardidentity \
	libboard_idJNI \
	Board_id


DEVICE_PACKAGE_OVERLAYS := \
    device/ti/panda/overlay

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

#HWC Hal
#PRODUCT_PACKAGES += \
#    hwcomposer.omap4

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs

# Audio
PRODUCT_PACKAGES += \
	audio.primary.panda \
	audio.a2dp.default

PRODUCT_COPY_FILES += \
	device/ti/panda/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_PACKAGES += \
	dhcpcd.conf \
	TQS_D_1.7.ini \
	calibrator

# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs

# BlueZ test tools
PRODUCT_PACKAGES += \
	hciconfig \
	hcitool

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers \
        librs_jni

# Enable AAC 5.1 decode (decoder)
#PRODUCT_PROPERTY_OVERRIDES += \
#	media.aac_51_output_enabled=true


PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
	system/extras/bugmailer/send_bug:system/bin/send_bug

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160

#$(call inherit-product-if-exists, vendor/ti/panda/device-vendor.mk)
$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/ti/blaze/device-vendor.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/omap4/ti-omap4-vendor.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/omap4/ducati-full_blaze.mk)
$(call inherit-product, device/ti/panda/wl12xx/ti-wl12xx-vendor.mk)
$(call inherit-product, device/ti/panda/wl12xx/ti-wpan-products.mk)

# clear OMAP_ENHANCEMENT variables
$(call ti-clear-vars)
