# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/vendor/etc/permissions/android.software.midi.xml
