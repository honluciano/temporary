# sync rom
repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 11.x -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/honluciano/android_device_motorola_guamp-1.git device/motorola/guamp
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8 

# build rom
source build/envsetup.sh
lunch aosp_guamp-user
m aex

# upload rom
rclone copy out/target/product/mido/AospExtended*.zip cirrus:mido -P
