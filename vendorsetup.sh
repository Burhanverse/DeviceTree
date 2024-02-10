export KBUILD_BUILD_USER=Burhanverse
export KBUILD_BUILD_HOST=burhancodes
export BUILD_USERNAME=Burhanverse
export BUILD_HOSTNAME=burhancodes

# dependencies
git clone --depth 1 https://github.com/burhancodes/packages_apps_GoogleCamera_8.1 packages/apps/GoogleCamera_8.1

git clone --depth 1 https://github.com/zubairk22oct/Device_xiaomi_mt6768-common -b dot device/xiaomi/mt6768-common

git clone --depth 1 https://github.com/Burhanverse/android_kernel_xiaomi_mt6768 -b eleven kernel/xiaomi/mt6768
cd kernel/xiaomi/mt6768
echo -e "Patching Kernel for KernelSU..."
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -
cd ../../..

git clone --depth 1 https://github.com/zubairk22oct/Vendor_xiaomi_lava -b eleven vendor/xiaomi/lava

git clone --depth 1 https://github.com/kdrag0n/proton-clang -b master prebuilts/clang/host/linux-x86/clang-proton

git clone --depth 1 https://github.com/PixelExperience/device_mediatek_sepolicy_vndr -b eleven device/mediatek/sepolicy_vndr

#IMS Patches required for Android 11
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/SamarV-121/android_vendor_extra/blob/ec8931060fc0f5df5d318a78e681d65709b4978e/patches/frameworks/opt/net/ims/0001-Partially-Revert-Remove-references-to-deprecated-dev.patch")"
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/SamarV-121/android_vendor_extra/blob/91f90fad848792f699d00caa07566f00bbe43e26/patches/frameworks/opt/net/wifi/0001-wifi-Add-StaState-API.patch")"
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/SamarV-121/android_vendor_extra/blob/91f90fad848792f699d00caa07566f00bbe43e26/patches/frameworks/base/0008-WifiManager-Add-StaState-API.patch")"
