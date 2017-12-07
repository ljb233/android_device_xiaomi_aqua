#
# Copyright (C) 2015 The Android Open-Source Project
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

DEVICE_PATH := device/xiaomi/aqua
COMMON_PATH := device/xiaomi/msm8992-common

# Use xiaomi/msm8992-common
include $(COMMON_PATH)/PlatformConfig.mk
include $(COMMON_PATH)/board/*.mk

# Call vendor blobs config
-include vendor/xiaomi/libra/BoardConfigVendor.mk

# Target kernel config
TARGET_KERNEL_CONFIG := aqua_defconfig
