#
# Copyright 2016 The Android Open Source Project
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

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

PRODUCT_HARDWARE := walleye

# DEVICE_PACKAGE_OVERLAYS for the device should be before
# including common overlays since the one listed first
# takes precedence.
ifdef DEVICE_PACKAGE_OVERLAYS
$(warning Overlays defined in '$(DEVICE_PACKAGE_OVERLAYS)' will override '$(PRODUCT_HARDWARE)' overlays)
endif
DEVICE_PACKAGE_OVERLAYS += device/google/walleye/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=420

include device/google/wahoo/device.mk

# Audio XMLs
PRODUCT_COPY_FILES += \
    device/google/walleye/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    device/google/walleye/audio_platform_info_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_tavil.xml \
    device/google/walleye/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    device/google/walleye/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

# Bug 62375603
PRODUCT_PROPERTY_OVERRIDES += audio.adm.buffering.ms=3
PRODUCT_PROPERTY_OVERRIDES += vendor.audio.adm.buffering.ms=3
PRODUCT_PROPERTY_OVERRIDES += audio_hal.period_multiplier=2
PRODUCT_PROPERTY_OVERRIDES += af.fast_track_multiplier=1

# Pro audio feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml

# Enable AAudio MMAP/NOIRQ data path.
# 1 is AAUDIO_POLICY_NEVER  means only use Legacy path.
# 2 is AAUDIO_POLICY_AUTO   means try MMAP then fallback to Legacy path.
# 3 is AAUDIO_POLICY_ALWAYS means only use MMAP path.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_policy=2
# 1 is AAUDIO_POLICY_NEVER  means only use SHARED mode
# 2 is AAUDIO_POLICY_AUTO   means try EXCLUSIVE then fallback to SHARED mode.
# 3 is AAUDIO_POLICY_ALWAYS means only use EXCLUSIVE mode.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_exclusive_policy=2

# Increase the apparent size of a hardware burst from 1 msec to 2 msec.
# A "burst" is the number of frames processed at one time.
# That is an increase from 48 to 96 frames at 48000 Hz.
# The DSP will still be bursting at 48 frames but AAudio will think the burst is 96 frames.
# A low number, like 48, might increase power consumption or stress the system.
PRODUCT_PROPERTY_OVERRIDES += aaudio.hw_burst_min_usec=2000

# Enable SM log mechanism by default
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.smlog_switch=1 \
    ro.radio.log_prefix="modem_log_" \
    ro.radio.log_loc="/data/vendor/modem_dump"

PRODUCT_COPY_FILES += \
    device/google/walleye/init.logging.userdebug.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(PRODUCT_HARDWARE).logging.rc
else
PRODUCT_COPY_FILES += \
    device/google/walleye/init.logging.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(PRODUCT_HARDWARE).logging.rc
endif

PRODUCT_COPY_FILES += \
    device/google/walleye/init-common.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init-$(PRODUCT_HARDWARE).rc \
    device/google/walleye/init.common.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_HARDWARE).usb.rc \
    device/google/walleye/init.insmod.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.cfg

# Input device files
PRODUCT_COPY_FILES += \
    device/google/walleye/synaptics_dsxv26.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/synaptics_dsxv26.idc

PRODUCT_COPY_FILES += \
    device/google/walleye/nfc/libnfc-nxp.muskie.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    device/google/walleye/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf \
    device/google/walleye/thermal-engine-vr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-vr.conf

# Wifi configuration file
PRODUCT_COPY_FILES += \
    device/google/walleye/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

#IMU calibration
PRODUCT_PROPERTY_OVERRIDES += \
  persist.config.calibration_fac=/persist/sensors/calibration/calibration.xml

# HWUI common settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

# HWUI cache sizes
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=56 \
    ro.hwui.layer_cache_size=32 \
    ro.hwui.path_cache_size=16

# NFC/camera interaction workaround - DO NOT COPY TO NEW DEVICES
PRODUCT_PROPERTY_OVERRIDES += \
    ro.camera.notify_nfc=1

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Camera
PRODUCT_PACKAGES += libion

# Fingerprint sensor type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.fingerprint=fpc

# IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Pixel Experience
PRODUCT_COPY_FILES += \
  device/google/walleye/nexus.xml:system/etc/sysconfig/nexus.xml

# UI
PRODUCT_PROPERTY_OVERRIDES += \
    sys.use_fifo_ui=1

# Update engine
#PRODUCT_PACKAGES += brillo_update_payload

# Self Extractor blobs that can be built
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# touchscreen configuration
PRODUCT_COPY_FILES += \
    device/google/walleye/touchscreen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/touchscreen.idc

# Vibrator HAL
PRODUCT_PROPERTY_OVERRIDES += \
  ro.vibrator.hal.click.duration=10 \
  ro.vibrator.hal.tick.duration=4

# Default priv-app permissions
PRODUCT_COPY_FILES += \
    device/google/walleye/privapp-permissions-walleye.xml:$(TARGET_OUT_ETC)/permissions/privapp-permissions-walleye.xml
