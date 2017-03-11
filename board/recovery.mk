# Recovery
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_cm

# TWRP
ifeq ($(WITH_TWRP),true)
-include $(COMMON_PATH)/board/twrp.mk
endif
