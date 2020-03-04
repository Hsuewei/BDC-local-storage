#!/bin/bash -e

#Num of persistent volumes
PV_COUNT=30

for i in $(seq 1 $PV_COUNT); do
vol=vol$i

if  [ -L /dev/mapper/db_nvme-vol ] && [ -L /dev/mapper/db_ssd-vol ] && [ -L /dev/mapper/db_hdd-vol ]
then
    mkdir -p /mnt/nvme/$vol
    mount --bind /mnt/nvme/$vol /mnt/nvme/$vol
    mkdir -p /mnt/ssd/$vol
    mount --bind /mnt/ssd/$vol /mnt/ssd/$vol
    mkdir -p /mnt/hdd/$vol
    mount --bind /mnt/hdd/$vol /mnt/hdd/$vol

elif  [ -L /dev/mapper/db_pmem-vol ] && [ -L /dev/mapper/db_ssd-vol ]
then
    mkdir -p /mnt/pmem/$vol
    mount --bind /mnt/pmem/$vol /mnt/pmem/$vol
    mkdir -p /mnt/ssd/$vol
    mount --bind /mnt/ssd/$vol /mnt/ssd/$vol

else
    mkdir -p /mnt/local-storage/$vol
    mount --bind /mnt/local-storage/$vol /mnt/local-storage/$vol
fi

done

