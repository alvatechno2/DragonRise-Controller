#!/system/bin/sh

# This script runs after the boot process to ensure the controller runs properly.

# Set proper permissions for keylayout files
chmod 644 /system/usr/keylayout/Vendor_*.kl 2>/dev/null

# Log successful execution
echo "DragonRise: Service script executed successfully" >> /data/local/tmp/dragonrise.log
