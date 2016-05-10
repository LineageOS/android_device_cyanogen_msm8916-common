ifeq ($(USE_DEVICE_SPECIFIC_CAMERA),true)

# Camera
PRODUCT_PACKAGES += \
    camera.msm8916 \
    libmm-qcamera \
    Snap

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

endif
