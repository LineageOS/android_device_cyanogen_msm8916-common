ifneq ($(USE_DEVICE_SPECIFIC_GPS),)
# GPS
PRODUCT_PACKAGES += \
    gps.msm8916

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

endif
