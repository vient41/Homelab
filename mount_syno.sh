#!/bin/bash
# Script point de montage NAS Synology

# creation du fichier servant de point de montage
mkdir /mnt/syno


# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Define the line to add
line_to_add="ip:/volume1/Videos /mnt/syno nfs vers=3,rw,noauto,user 0 0"

# Add the line to fstab
echo "$line_to_add" >> /etc/fstab

echo "Line added to /etc/fstab:"
echo "$line_to_add"
echo "ajouter le serveur IP $(hostname -I | awk '{print $1}') dans la configuration du Synology"
echo "srcipt termine"
