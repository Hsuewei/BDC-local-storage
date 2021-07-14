# BDC-local-storage
The implementation of MSSQL BDC local storage by someone else(Can't find his/her github). However tiger.chaung@qct.io archive the directory structure. I also maintain a copy here


# Set up local storage
1. Must have a kubernetes cluster runing(on premise, in the cloud, minikube.....)
2. First decide servers' storage media type: NVMe, SSD, PMEM, or just a volume(or say device) created by software or hardware raid? Please refer to `setup-volumes-agent.sh`
## provisioner
- The default directory is `/opt/mnt/local-stoage`, and the script will create 30 PV(persistent volumn) by default
  ``` bash
  sh setup-volumes-agent.sh
  ```
- set local-storage provisioner
  ``` bash
  kubectl apply -f local-storage-provisioner.yaml
  ```
