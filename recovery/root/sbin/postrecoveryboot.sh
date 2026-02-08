# device/motorola/manaus/recovery/root/sbin/postrecoveryboot.sh
#!/system/bin/sh
#
# Post recovery boot script for Motorola Edge 40 Neo (manaus)
# MediaTek MT6879
#

# Log start
log -t recovery -p i "postrecoveryboot.sh started"

# Set USB configuration
setprop sys.usb.config mtp,adb

# Ensure ADB is running
start adbd

# Set brightness
echo 1200 > /sys/class/leds/lcd-backlight/brightness 2>/dev/null || \
echo 1200 > /sys/class/backlight/panel0-backlight/brightness 2>/dev/null

# Log end
log -t recovery -p i "postrecoveryboot.sh completed"

exit 0
