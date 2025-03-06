#!/bin/bash

devices=($(lsblk -J -o NAME,SIZE,ROTA,TYPE,MODEL,MOUNTPOINTS | jq -r '.blockdevices[] | select(((has("children") | not) and .mountpoints[] == null) or (.children[]?.mountpoints[] == null)) | .name' | uniq))

for i in ${!devices[@]} 
do 
    echo mkdir -p /mnt/minio-data$((i+1))
    echo mkfs.xfs -f -L minio-data$((i+1)) /dev/${devices[i]}
    echo "echo 'LABEL=minio-data$((i+1)) /mnt/minio-data$((i+1))  xfs     defaults,noatime        0 0' >> /etc/fstab"
done

echo mount -a
