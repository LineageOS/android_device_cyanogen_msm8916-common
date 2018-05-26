#
# Copyright (C) 2018 The LineageOS Project
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

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    audio.deep_buffer.media=true \
    audio.offload.min.duration.secs=30 \
    audio.offload.video=true \
    vendor.audio.av.streaming.offload.enable=true \
    vendor.audio.offload.buffer.size.kb=64 \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio_hal.period_size=192 \
    vendor.voice.path.for.pcm.voip=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd \
    ro.bluetooth.dun=true \
    ro.bluetooth.hfp.ver=1.7 \
    ro.bluetooth.sap=true \
    ro.qualcomm.bt.hci_transport=smd

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_buffer_age=false \
    debug.composition.type=c2d \
    debug.mdpcomp.idletime=600 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    debug.enable.sglscale=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false \
    drm.service.enabled=1 \
    vidc.enc.narrow.searchrange=1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.max_starting_bg=8 \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.core_ctl_min_cpu=0 \
    ro.core_ctl_max_cpu=4

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.qmi.adb_logmask=0 \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.telephony.call_ring.multiple=false

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

# Wi-Fi display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1

ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.min_freq_0=960000 \
    ro.min_freq_4=800000
else
# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.min_freq_0=800000
endif
