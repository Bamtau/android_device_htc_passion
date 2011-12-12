$(call inherit-product, device/htc/passion/full_passion.mk)

$(call inherit-product, vendor/evervolv/products/common.mk)

# Include GSM stuff -- FIXME: apns-conf.xml called by gsm.mk
#$(call inherit-product, vendor/evervolv/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := evervolv_passion
PRODUCT_BRAND := google
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Nexus One
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion BUILD_ID=GRK39F BUILD_FINGERPRINT=google/passion/passion:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.6 GRK39F 189904 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Perdo

ifeq ($(NIGHTLY_BUILD),true)
    BUILD_VERSION := 2.0.0p1-$(shell date +%m%d%Y)-NIGHTLY
else
    BUILD_VERSION := 2.0.0p1
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.romversion=Evervolv-$(PRODUCT_CODENAME)-$(BUILD_VERSION)

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Google Nexus One\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Hot Reboot overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/evervolv/overlay/hot_reboot

#Temp packages -- Until they are added elsewhere
PRODUCT_PACKAGES += \
    bash vim nano libncurses ssh rsync \
    e2fsck resize2fs e2fsck \
    libext2_com_err libext2_profile libext2_blkid libext2_e2p libext2_uuid libext2fs \
    Stk

# Copy hdpi specific bootanimation
PRODUCT_COPY_FILES +=  \
   vendor/evervolv/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip