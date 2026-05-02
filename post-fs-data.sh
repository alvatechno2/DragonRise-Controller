#!/system/bin/sh
# This script runs early in the boot process
# log
touch /data/local/tmp/dragonrise.log
echo "DragonRise: Post-FS-Data script started" >> /data/local/tmp/dragonrise.log

# mount
mount -o remount,rw /system 2>/dev/null

# Set proper SELinux context
for kl_file in /system/usr/keylayout/Vendor_*.kl; do
    if [ -f "$kl_file" ]; then
        chcon u:object_r:system_file:s0 "$kl_file" 2>/dev/null
        echo "Dragonrise: Set context for $(basename "$kl_file")" >> /data/local/tmp/dragonrise.log
    fi
done

echo "DragonRise: Post-FS-Data script completed" >> /data/local/tmp/dragonrise.log
