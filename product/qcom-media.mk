# Media
PRODUCT_PACKAGES += \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

ifneq ($(QCPATH),)
PRODUCT_PACKAGES += libOmxVdecHevc
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml
