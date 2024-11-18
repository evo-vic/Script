#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/
# Initialize ROM manifest
repo init -u https://github.com/Evolution-X/manifest -b vic --git-lfs
# repo sync
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
rm -rf device/xiaomi/mojito
rm -rf packages/resources/devicesettings
# cloning DT
# device tree
git clone https://github.com/EvolutionXA15/device_xiaomi_mojito.git --depth 1 -b mojito-universe device/xiaomi/mojito
git clone https://github.com/EvolutionXA15/android_device_xiaomi_sm6150-common.git --depth 1 -b mojito-universe device/xiaomi/sm6150-common
# kernel tree
git clone https://github.com/EvolutionXA15/kernel_xiaomi_mojito.git --depth 1 -b inline-rom kernel/xiaomi/mojito
# vendor tree
git clone https://gitlab.com/sachinbarange86/android_vendor_xiaomi_mojito.git --depth 1 -b 14 vendor/xiaomi/mojito
git clone https://gitlab.com/sachinbarange86/android_vendor_xiaomi_sm6150-common.git --depth 1 -b 14 vendor/xiaomi/sm6150-common
# hardware tree
git clone https://github.com/EvolutionXA15/android_hardware_xiaomi.git --depth 1 -b mojito hardware/xiaomi
# set build environment
. build/envsetup.sh
# lunch
lunch lineage_mojito-ap3a-userdebug
# bacon
m evolution
