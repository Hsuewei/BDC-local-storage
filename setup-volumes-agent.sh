#!/bin/bash -e

# num of persistent volumes
PV_COUNT=25

for i in $(seq 1 $PV_COUNT); do
  vol="vol$i"

  mkdir -p /mnt/pmem/$vol
  mount --bind /mnt/pmem/$vol /mnt/pmem/$vol
  mkdir -p /mnt/nvme/$vol
  mount --bind /mnt/nvme/$vol /mnt/nvme/$vol
  mkdir -p /mnt/ssd/$vol
  mount --bind /mnt/ssd/$vol /mnt/ssd/$vol
  mkdir -p /mnt/hdd/$vol
  mount --bind /mnt/hdd/$vol /mnt/hdd/$vol
done
