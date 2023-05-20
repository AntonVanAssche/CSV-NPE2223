#!/usr/bin/env bash

set -o errexit # Abort on nonzero exit code.
set -o nounset # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.
# set -o xtrace   # Enable for debugging.
#
command -v virtualbox &> /dev/null || {
    printf 'Virtualbox not found in PATH. Adding Virtualbox bin-path to PATH environment variable.\n'
    export PATH=${PATH}:/usr/local/bin
}

vm_name="Debian"
vm_path="${HOME}/VirtualBox VMs/"

vboxmanage createvm --name "${vm_name}" --ostype "Debian_64" --register
vboxmanage modifyvm "${vm_name}" --cpus 2 --memory 2048 --boot1=disk
vboxmanage storagectl "${vm_name}" --name "SATA Controller" --add sata --controller IntelAHCI
vboxmanage storageattach "${vm_name}" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "${vm_path}/${vm_name,,}.vdi"
vboxmanage modifyvm "${vm_name}" --nic1 bridged --nictype1 82545EM --bridgeadapter1 wlp0s20f3
vboxmanage startvm "${vm_name}"
