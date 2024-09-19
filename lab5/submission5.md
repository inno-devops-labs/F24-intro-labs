# Lab 5

## Task 1: Key Metrics for SRE and SLAs

### Monitor System Resources

#### CPU, Memory, and I/O Usage

   - [![image](https://github.com/user-attachments/assets/4bdb0965-1fc3-4044-9911-8f040dd90b98)
]


   - [![image](https://github.com/user-attachments/assets/d197ecad-c0eb-4863-8f58-47809801a75f)
]



### Disk Space Management

#### Top 3 Largest Files in `/var`

```bash
mikhail@mikhail-VirtualBox:~$ sudo find /var -type f -exec du -h {} + | sort -rh | head -n 3
505M  /var/lib/snapd/snaps/gnome-42-2204_172.snap
497M  /var/lib/snapd/snaps/gnome-42-2204_141.snap
497M  /var/lib/snapd/seed/snaps/gnome-42-2204_141.snap
mikhail@mikhail-VirtualBox:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           392M  1,7M  390M   1% /run
/dev/sda3       171G   27G  136G  17% /
tmpfs           2,0G     0  2,0G   0% /dev/shm
tmpfs           5,0M  4,0K  5,0M   1% /run/lock
/dev/sda2       512M  6,1M  506M   2% /boot/efi
tmpfs           392M  116K  392M   1% /run/user/1000
```

---

