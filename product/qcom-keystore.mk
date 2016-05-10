ifneq ($(TARGET_PROVIDES_KEYMASTER),true)

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8916

endif
