#!/bin/bash
#
# Script to prepare and mount storage devices for MinIO
# Identifies unmounted devices, formats them with XFS, and configures fstab entries

# Exit on error, undefined vars, and pipe failures
set -euo pipefail

# Find all unmounted block devices
unmounted_devices=($(lsblk -J -o NAME,SIZE,ROTA,TYPE,MODEL,MOUNTPOINTS \
  | jq -r '.blockdevices[] | 
    select(((has("children") | not) and .mountpoints[] == null) or 
           (.children[]?.mountpoints[] == null)) | 
    .name' \
  | uniq))

# Process each device
for i in "${!unmounted_devices[@]}"; do
    mount_point="/mnt/minio-data$((i+1))"
    device="/dev/${unmounted_devices[i]}"
    label="minio-data$((i+1))"

    echo "mkdir -p ${mount_point}"
    echo "mkfs.xfs -f -L ${label} ${device}"
    echo "echo 'LABEL=${label} ${mount_point}  xfs     defaults,noatime        0 0' >> /etc/fstab"
done

echo "mount -a"
