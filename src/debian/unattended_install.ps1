# Script om de Debian Client aan te maken in VBox 

# Add Virtual Box bin-path to PATH environment variable if necessary:
if ((Get-Command VBoxManage.exe -ErrorAction SilentlyContinue) -eq $null) {
    $env:Path += ";C:\Program Files\Oracle\VirtualBox"
}

# Variables
$VMName = "Debian-Client"
$VMPath = "C:\Users\$env:USERNAME\Downloads\Debian.vdi"

if (-not (test-path $VMPath)) {
    "$VMPath is not wright, please change parameter before running script."
     return
     }

# Create a new virtual machine in VirtualBox
$VirtualBox = "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
& $VirtualBox createvm --name $VMName --ostype Debian_64 --register

# Configure the virtual machine to use 2 CPU and 2048 Mb of RAM
& $VirtualBox modifyvm "$VMName" --cpus 2 --memory 2048 --boot1=disk

# Add SATA controller and attach hard disk to it
& $VirtualBox storagectl    $VMName --name       'SATA Controller' --add sata --controller IntelAHCI
& $VirtualBox storageattach $VMName --storagectl 'SATA Controller' --port 0 --device 0 --type hdd --medium $VMPath

# Add Bridged Network
& $VirtualBox modifyvm "$VMName" --nic1 bridged --bridgeadapter1 "Intel(R) Wi-Fi 6 AX201 160MHz"

# Start the VM
& $VirtualBox startvm $VMName