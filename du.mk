# Copyright (C) 2017 The Dirty Unicorns Project
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

$(call inherit-product, device/google/walleye/device.mk)

PRODUCT_PACKAGES += \
    Dialer \
    Launcher3 \
    WallpaperPicker

PRODUCT_COPY_FILES += \
    device/google/walleye/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

PRODUCT_RESTRICT_VENDOR_FILES := owner

# DU build properties
PRODUCT_NAME := du_walleye
PRODUCT_DEVICE := walleye
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 2
PRODUCT_MANUFACTURER := Google

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=google/walleye/walleye:8.1.0/OPM1.171019.019/4527419:user/release-keys \
    PRIVATE_BUILD_DESC="walleye-user 8.1.0 OPM1.171019.019 4527419 release-keys"

$(call inherit-product-if-exists, vendor/google/walleye/walleye-vendor.mk)
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)
$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)

GAPPS_VARIANT := pico
#GAPPS_FORCE_MMS_OVERRIDES := true
#GAPPS_PACKAGE_OVERRIDES := PrebuiltBugle
PRODUCT_PACKAGES += Feedback
PRODUCT_PACKAGES += GoogleBackupTransport
PRODUCT_PACKAGES += GoogleContactsSyncAdapter
PRODUCT_PACKAGES += GoogleFeedback
PRODUCT_PACKAGES += GoogleOneTimeInitializer
PRODUCT_PACKAGES += GooglePartnerSetup
PRODUCT_PACKAGES += PrebuiltGmsCore
PRODUCT_PACKAGES += GoogleServicesFramework
PRODUCT_PACKAGES += GoogleLoginService
PRODUCT_PACKAGES += SetupWizard
PRODUCT_PACKAGES += Phonesky
PRODUCT_PACKAGES += GoogleCalendarSyncAdapter
PRODUCT_PACKAGES += GoogleTTS
PRODUCT_PACKAGES += GooglePackageInstaller
PRODUCT_PACKAGES += PrebuiltGmsCoreInstantApps
PRODUCT_PACKAGES += Turbo
#PRODUCT_PACKAGES += PrebuiltBugle

#GAPPS_VARIANT := nano
PRODUCT_PACKAGES += FaceLock
PRODUCT_PACKAGES += Velvet

#GAPPS_VARIANT := micro
GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_PACKAGE_OVERRIDES := Chrome
GAPPS_PACKAGE_OVERRIDES := PrebuiltGmail
GAPPS_FORCE_PIXEL_LAUNCHER := false
GAPPS_EXCLUDED_PACKAGES := PixelLauncher
GAPPS_EXCLUDED_PACKAGES := Wallpapers
GAPPS_EXCLUDED_PACKAGES := PixelLauncherIcons
GAPPS_EXCLUDED_PACKAGES := GoogleHome
PRODUCT_PACKAGES += CalendarGooglePrebuilt
PRODUCT_PACKAGES += Chrome
PRODUCT_PACKAGES += PrebuiltGmail

#GAPPS_VARIANT := mini
GAPPS_PACKAGE_OVERRIDES := CalculatorGoogle
GAPPS_PACKAGE_OVERRIDES := PrebuiltDeskClockGoogle
GAPPS_BYPASS_PACKAGE_OVERRIDES := Photos
PRODUCT_PACKAGES += CalculatorGoogle
PRODUCT_PACKAGES += PrebuiltDeskClockGoogle
PRODUCT_PACKAGES += PlusOne
PRODUCT_PACKAGES += Hangouts
PRODUCT_PACKAGES += Maps
PRODUCT_PACKAGES += Photos
PRODUCT_PACKAGES += YouTube

#GAPPS_VARIANT := full
GAPPS_EXCLUDED_PACKAGES := Books
GAPPS_EXCLUDED_PACKAGES := FitnessPrebuilt
GAPPS_EXCLUDED_PACKAGES := Videos
GAPPS_EXCLUDED_PACKAGES := PlayGames
PRODUCT_PACKAGES += CloudPrint2
PRODUCT_PACKAGES += EditorsDocs
PRODUCT_PACKAGES += Drive
PRODUCT_PACKAGES += PrebuiltKeep
PRODUCT_PACKAGES += Music2
PRODUCT_PACKAGES += Newsstand
PRODUCT_PACKAGES += PrebuiltNewsWeather
PRODUCT_PACKAGES += EditorsSheets
PRODUCT_PACKAGES += EditorsSlides
PRODUCT_PACKAGES += talkback

#GAPPS_VARIANT := stock
#GAPPS_EXCLUDED_PACKAGES := GoogleCamera
#GAPPS_EXCLUDED_PACKAGES := GoogleContacts
GAPPS_FORCE_MMS_OVERRIDES := false
GAPPS_EXCLUDED_PACKAGES := PrebuiltBugle
GAPPS_FORCE_WEBVIEW_OVERRIDES := true
GAPPS_FORCE_DIALER_OVERRIDES := true
#GAPPS_FORCE_DIALER_OVERRIDES := true
#GAPPS_EXCLUDED_PACKAGES := GoogleDialer
PRODUCT_PACKAGES += GoogleCamera
PRODUCT_PACKAGES += GoogleContacts
PRODUCT_PACKAGES += LatinImeGoogle
PRODUCT_PACKAGES += TagGoogle
PRODUCT_PACKAGES += GoogleVrCore
PRODUCT_PACKAGES += GooglePrintRecommendationService
PRODUCT_PACKAGES += GoogleExtServices
PRODUCT_PACKAGES += GoogleExtShared
PRODUCT_PACKAGES += GoogleDialer
PRODUCT_PACKAGES += WebViewGoogle

#GAPPS_VARIANT := super
#GAPPS_EXCLUDED_PACKAGES := Wallet
GAPPS_EXCLUDED_PACKAGES := GoogleHindiIME
GAPPS_EXCLUDED_PACKAGES := GoogleJapaneseInput
GAPPS_EXCLUDED_PACKAGES := KoreanIME
GAPPS_EXCLUDED_PACKAGES := GooglePinyinIME
GAPPS_EXCLUDED_PACKAGES := GoogleZhuyinIME
PRODUCT_PACKAGES += Wallet
PRODUCT_PACKAGES += DMAgent
PRODUCT_PACKAGES += GoogleEarth
PRODUCT_PACKAGES += GCS
PRODUCT_PACKAGES += Tycho
PRODUCT_PACKAGES += Street
PRODUCT_PACKAGES += TranslatePrebuilt
PRODUCT_PACKAGES += ProjectFi
PRODUCT_PACKAGES += GoogleAssistant
