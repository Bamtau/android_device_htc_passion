# Inherit AOSP device configuration for passion.
$(call inherit-product, device/htc/passion/full_passion.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_passion
PRODUCT_BRAND := google
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Nexus One
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion BUILD_ID=GRK39F \
BUILD_FINGERPRINT=google/passion/passion:2.3.6/GRK39F/189904:user/release-keys \
PRIVATE_BUILD_DESC="passion-user 2.3.6 GRK39F 189904 release-keys"

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := Passion
#PRODUCT_VERSION_DEVICE_SPECIFIC := v1
ifeq ($(NIGHTLY_BUILD),true)
    BUILD_VERSION := 1.0.0v4-$(shell date +%m%d%Y)-NIGHTLY
else
    BUILD_VERSION := 1.0.0v4
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.romversion=MeDroid-$(PRODUCT_CODENAME)-$(BUILD_VERSION)

PRODUCT_MOTD :="\n\n\n--------------------MeDroid---------------------\nGracias Por instalar MeDroidICS en tu Google Nexus One\nPor favor visitanos en \#Memoriandroid Memoriandroid.com\nsiguenos en twitter @memoriandroide\nsi te gusta nuestro trabajo compranos unas cervezas!\n------------------------------------------------\n"

#
# Extra Packages
#
PRODUCT_PACKAGES += Stk

# Release name and versioning
PRODUCT_RELEASE_NAME := N1
PRODUCT_VERSION_DEVICE_SPECIFIC := -samuaz-$(shell date +%m%d%Y)

PRODUCT_PACKAGES += \
    Camera \
    CMSettings \
    UsbMassStorage \

# Medroid bootanimation
PRODUCT_COPY_FILES += device/htc/passion/extras/nexus-bootanimation.zip:system/media/bootanimation.zip

# Get some Gapps
$(call inherit-product-if-exists, gapps/gapps.mk)
