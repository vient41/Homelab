# Homelab


## Links and information to keep
- [Self hosted list of service](https://github.com/awesome-selfhosted/awesome-selfhosted)

## configuration of my linux docker system
- needs keyboard in french
- apt update
- create an account that can do root stuff always
- install ssh
- install docker
- git to manage configuration file of linux [Link](https://www.coderholic.com/using-git-and-github-to-sync-config-files/)
  - .bashrc
  - any other file
  - visudo

## Vigin Media Box router
- DHCP Local Settings 192.168.10.100
- Lease time 24 hours - 86.4K sec

| IP Table    | Description |
| ----------- | ----------- |
| 192.168.10.2| RPi4 Homme Assistant       |
| 192.168.10.3| tbd        |

# Home Assistant
## Backup
Once the installation of HASSio is done, must put in place backup system. 

Back up and restore Home Assistant


Backup of your Home Assistant and add-on data and configuration. They are stored in a compressed archive file (.tar). Backups are made from the Supervisor Backups panel. There is also a service available that allows you to trigger the creation of a backup from an automation. Backups are stored in the /backup directory.
A full backup includes the following directories:
- config
- share
- addons (only manually installed or created add-ons, not those installed from the store)
- ssl
- media
A partial backup consists of any number of the above default directories and installed add-ons.
### MAKING A BACKUP FROM THE UI
1. Go to Configuration > Add-ons & Backups > Backups in the UI.
2. Provide a name for the backup.
3. Choose full or partial.
4. Choose to password protect or not. Password-protected backups cannot easily be browsed outside of Home Assistant OS.
5. Click “Create” to begin the backup.
### RESTORING A BACKUP ON A NEW INSTALL
You can make use of backup which you have copied off of a previous install to restore to a new installation during the onboarding process. Follow the link at the bottom of the account creation page to upload your backup from the previous installation.
For restoring a backup at any other time, visit the Supervisor backup panel in your UI and use the following steps:
Select “Upload Backup” from the icon in the upper right of the page.
Click on the folder icon to navigate to your backup .tar file and select it.
When the upload is completed, you will be presented with the backup restore dialog for restoring it, and can then choose to restore in full or in part by manually selecting individual items.
If the backup you are uploading is more than 1GB in size, it can be faster and more efficient to make use of the Samba add-on in order to transfer files to the /backup directory.
The length of time it takes to create or restore backup will depend on how much you have to compress or decompress.
If you’re looking to slim down your backup, check if your configuration directory contains a large database file (home-assistant_v2.db). See the recorder integration page for options to keep your database data down to a size that won’t cause issues. Note the keep days, purge interval, and include/exclude options.
When the restore is complete, Home Assistant will restart to apply the new settings. You will lose the connection to the UI and it will return once the restart is completed.
--> Can also use the CLI commande to do so. 

Copy to another distant location

Copy the back to Sysnology NAS via SMB share. Very easy to do. 
https://github.com/thomasmauerer/hassio-addons/tree/master/samba-backup

The end of this video shows how to add a back up entity on the Home assistant dashboard: https://www.youtube.com/watch?v=bY39OpoN8OM&t=956s


Configuration that worked:
host: 192.168.0.20
share: Sauvegarde_distante
target_dir: /HomeAssistant
username: admin
password: Jrlsd09fpj
keep_local: 0
keep_remote: 2
trigger_time: '00:00'
trigger_days:
- Mon
- Tue
- Wed
- Thu
- Fri
- Sat
- Sun
exclude_addons: []
exclude_folders: []



Logs:
[s6-init] making user provided files available at /var/run/s6/etc...exited 0.
[s6-init] ensuring user provided files have correct perms...exited 0.
[fix-attrs.d] applying ownership & permissions fixes...
[fix-attrs.d] done.
[cont-init.d] executing container initialization scripts...
[cont-init.d] done.
[services.d] starting services
[services.d] done.
[22-03-14 18:15:43] INFO: ---------------------------------------------------
[22-03-14 18:15:43] INFO: Host/Share: 192.168.0.20/Sauvegarde_distante
[22-03-14 18:15:43] INFO: Target directory: /HomeAssistant
[22-03-14 18:15:43] INFO: Keep local/remote: 0/2
[22-03-14 18:15:43] INFO: Trigger time: 18:20
[22-03-14 18:15:43] INFO: Trigger days: Mon Tue Wed Thu Fri Sat Sun
[22-03-14 18:15:43] INFO: ---------------------------------------------------
[22-03-14 18:15:46] INFO: Samba Backup started successfully
[22-03-14 18:20:46] INFO: Backup running ...
[22-03-14 18:20:46] INFO: Creating backup "Samba Backup 2022-03-14 18:20"
[22-03-14 18:20:48] INFO: Copying backup d4aec165 (Samba_Backup_2022_03_14_18_20.tar) to share
[22-03-14 18:20:49] INFO: Deleting d4aec165 (Samba Backup 2022-03-14 18:20) local
[22-03-14 18:21:02] INFO: Backup finished

create a manual back-up 

We need to create a script and execute it. 

service: hassio.addon_stdin
data:
addon: 15d21743_samba_backup
input: trigger




## Entity naming convention
- ROOM_DEVICES_POSITON-IN-THE-ROOM



## Reverse proxy ?
I found possibility not to use reverse proxy [link](https://iximiuz.com/en/posts/multiple-containers-same-port-reverse-proxy/)

## security environment
- double stack combine NVR and face recognition
- deepstack for recognition
- frigate for NVR
- https://youtu.be/_61-hIL1AjQ


## Websocketd 
- https://github.com/tripleee/websocketd-alpine 
- https://github.com/joewalnes/websocketd 

## Network
- PFS Sense : https://www.youtube.com/watch?v=lUzSsX4T4WQ&ab_channel=NetworkChuck
- Pihole: https://www.youtube.com/watch?v=4X6KYN1cQ1Y&ab_channel=Goose
- need ubiquitin Unifi because Virgin media box is shit and you can't disable DNS.... 
