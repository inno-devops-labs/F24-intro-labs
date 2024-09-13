# Task 1

1. **Analyze system boot:**
    - The output for `systemd-analyze`:
    ```
    Startup finished in 4.906s (firmware) + 6.530s (loader) + 1.464s (kernel) + 2.244s (initrd) + 10.359s (userspace) = 25.505s 
    graphical.target reached after 10.342s in userspace.
    ```
    
    - The output for `systemd-analyze blame`:
   ```shell
   5.848s NetworkManager-wait-online.service
    2.776s sys-module-fuse.device
    2.769s dev-tpm0.device
    2.769s sys-devices-LNXSYSTM:00-LNXSYBUS:00-INTC6000:00-tpm-tpm0.device
    2.749s dev-ttyS3.device
    2.749s sys-devices-platform-serial8250-serial8250:0-serial8250:0.3-tty-ttyS3.device
    2.749s sys-devices-LNXSYSTM:00-LNXSYBUS:00-INTC6000:00-tpmrm-tpmrm0.device
    2.749s dev-tpmrm0.device
    2.746s dev-ttyS2.device
    2.746s sys-devices-platform-serial8250-serial8250:0-serial8250:0.2-tty-ttyS2.device
    2.737s dev-ttyS0.device
    2.737s sys-devices-platform-serial8250-serial8250:0-serial8250:0.0-tty-ttyS0.device
    2.734s sys-devices-platform-serial8250-serial8250:0-serial8250:0.1-tty-ttyS1.device
    2.734s dev-ttyS1.device
    2.709s sys-module-configfs.device
    2.505s dev-disk-by\x2did-nvme\x2dnvme.1987\x2d353131323130383036323339303339343539\x2d3531314253303531324742\x2d00000001\x2dpart2.device
    2.505s dev-disk-by\x2dpartuuid-5714f068\x2d6e70\x2d419f\x2da3c9\x2d5bc803eb49eb.device
    2.505s dev-disk-by\x2ddiskseq-1\x2dpart2.device
    2.505s dev-nvme0n1p2.device
    2.505s dev-disk-by\x2dpartlabel-Microsoft\x5cx20reserved\x5cx20partition.device
    2.505s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459\x2dpart2.device
    2.505s sys-devices-pci0000:00-0000:00:1d.0-0000:01:00.0-nvme-nvme0-nvme0n1-nvme0n1p2.device
    2.505s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459_1\x2dpart2.device
    2.505s dev-disk-by\x2dpath-pci\x2d0000:01:00.0\x2dnvme\x2d1\x2dpart2.device
    2.501s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459\x2dpart4.device
    2.501s dev-disk-by\x2duuid-188EDFF68EDFCA80.device
    2.501s sys-devices-pci0000:00-0000:00:1d.0-0000:01:00.0-nvme-nvme0-nvme0n1-nvme0n1p4.device
    2.501s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459_1\x2dpart4.device
    2.501s dev-disk-by\x2ddiskseq-1\x2dpart4.device
    2.501s dev-disk-by\x2dpartuuid-e7ab3230\x2d0e18\x2d4ed1\x2d8522\x2dcad678fb672c.device
    2.501s dev-disk-by\x2did-nvme\x2dnvme.1987\x2d353131323130383036323339303339343539\x2d3531314253303531324742\x2d00000001\x2dpart4.device
    2.501s dev-nvme0n1p4.device
    2.501s dev-disk-by\x2dpath-pci\x2d0000:01:00.0\x2dnvme\x2d1\x2dpart4.device
    2.500s dev-nvme0n1p6.device
    2.500s sys-devices-pci0000:00-0000:00:1d.0-0000:01:00.0-nvme-nvme0-nvme0n1-nvme0n1p6.device
    2.500s dev-disk-by\x2duuid-3f1233b8\x2d7632\x2d4052\x2d80dd\x2db99e1f584fc8.device
    2.500s dev-disk-by\x2dpath-pci\x2d0000:01:00.0\x2dnvme\x2d1\x2dpart6.device
    2.500s dev-disk-by\x2dlabel-fedora.device
    2.500s dev-disk-by\x2did-nvme\x2dnvme.1987\x2d353131323130383036323339303339343539\x2d3531314253303531324742\x2d00000001\x2dpart6.device
    2.500s dev-disk-by\x2dpartuuid-c2019719\x2dcf4e\x2d4ed7\x2db3d9\x2dfd02ef9f7fc6.device
    2.500s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459\x2dpart6.device
    2.500s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459_1\x2dpart6.device
    2.500s dev-disk-by\x2ddiskseq-1\x2dpart6.device
    2.499s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459\x2dpart1.device
    2.499s dev-disk-by\x2dpartuuid-18d2c8dd\x2d84d0\x2d4670\x2dab39\x2d5b824263184c.device
    2.499s dev-disk-by\x2ddiskseq-1\x2dpart1.device
    2.499s dev-disk-by\x2dpath-pci\x2d0000:01:00.0\x2dnvme\x2d1\x2dpart1.device
    2.499s dev-disk-by\x2duuid-883C\x2d3CB3.device
    2.499s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459_1\x2dpart1.device
    2.499s sys-devices-pci0000:00-0000:00:1d.0-0000:01:00.0-nvme-nvme0-nvme0n1-nvme0n1p1.device
    2.499s dev-nvme0n1p1.device
    2.499s dev-disk-by\x2did-nvme\x2dnvme.1987\x2d353131323130383036323339303339343539\x2d3531314253303531324742\x2d00000001\x2dpart1.device
    2.499s dev-disk-by\x2dpartlabel-EFI\x5cx20System\x5cx20Partition.device
    2.497s sys-devices-pci0000:00-0000:00:1d.0-0000:01:00.0-nvme-nvme0-nvme0n1-nvme0n1p5.device
    2.497s dev-disk-by\x2ddiskseq-1\x2dpart5.device
    2.497s dev-nvme0n1p5.device
    2.497s dev-disk-by\x2did-nvme\x2dnvme.1987\x2d353131323130383036323339303339343539\x2d3531314253303531324742\x2d00000001\x2dpart5.device
    2.497s dev-disk-by\x2dpath-pci\x2d0000:01:00.0\x2dnvme\x2d1\x2dpart5.device
    2.497s dev-disk-by\x2duuid-97cbc979\x2d378d\x2d4908\x2d871c\x2d26d00b6fcbb7.device
    2.497s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459\x2dpart5.device
    2.497s dev-disk-by\x2dpartuuid-8eddcde3\x2db681\x2d405e\x2d9f9a\x2dab657f10fdf8.device
    2.497s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459_1\x2dpart5.device
    2.497s dev-disk-by\x2duuid-16163D6F163D50CB.device
    2.497s dev-nvme0n1p3.device
    2.497s dev-disk-by\x2dpartuuid-608de5aa\x2dfa67\x2d4976\x2d9a3c\x2d930eb8a9cca3.device
    2.497s dev-disk-by\x2ddiskseq-1\x2dpart3.device
    2.497s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459_1\x2dpart3.device
    2.497s dev-disk-by\x2did-nvme\x2dnvme.1987\x2d353131323130383036323339303339343539\x2d3531314253303531324742\x2d00000001\x2dpart3.device
    2.497s dev-disk-by\x2dpartlabel-Basic\x5cx20data\x5cx20partition.device
    2.497s dev-disk-by\x2dpath-pci\x2d0000:01:00.0\x2dnvme\x2d1\x2dpart3.device
    2.497s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459\x2dpart3.device
    2.497s sys-devices-pci0000:00-0000:00:1d.0-0000:01:00.0-nvme-nvme0-nvme0n1-nvme0n1p3.device
    2.496s dev-disk-by\x2dpath-pci\x2d0000:01:00.0\x2dnvme\x2d1.device
    2.496s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459_1.device
    2.496s sys-devices-pci0000:00-0000:00:1d.0-0000:01:00.0-nvme-nvme0-nvme0n1.device
    2.496s dev-disk-by\x2did-nvme\x2dnvme.1987\x2d353131323130383036323339303339343539\x2d3531314253303531324742\x2d00000001.device
    2.496s dev-disk-by\x2did-nvme\x2d511BS0512GB_511210806239039459.device
    2.496s dev-disk-by\x2ddiskseq-1.device
    2.496s dev-nvme0n1.device
    2.004s plymouth-quit-wait.service
    2.003s sys-devices-pci0000:00-0000:00:02.0-drm-card1-card1\x2deDP\x2d1-intel_backlight.device
     938ms plymouth-switch-root.service
     676ms systemd-binfmt.service
     613ms initrd-switch-root.service
     608ms abrtd.service
     575ms systemd-resolved.service
     529ms systemd-oomd.service
     505ms dnf-makecache.service
     503ms tor.service
     440ms NetworkManager.service
     439ms thermald.service
     202ms firewalld.service
     181ms systemd-journal-flush.service
     126ms systemd-tmpfiles-setup.service
     120ms upower.service
     120ms user@1000.service
     104ms systemd-tmpfiles-clean.service
     101ms iio-sensor-proxy.service
     100ms udisks2.service
      98ms systemd-udev-trigger.service
      97ms smb.service
      94ms power-profiles-daemon.service
      92ms accounts-daemon.service
      91ms polkit.service
      73ms passim.service
      68ms sssd-kcm.service
      67ms systemd-logind.service
      62ms systemd-tmpfiles-setup-dev-early.service
      56ms switcheroo-control.service
      56ms dev-zram0.swap
      55ms ModemManager.service
      53ms systemd-vconsole-setup.service
      52ms lvm2-monitor.service
      48ms systemd-journald.service
      47ms bluetooth.service
      47ms var-lib-nfs-rpc_pipefs.mount
      44ms systemd-udevd.service
      42ms avahi-daemon.service
      41ms geoclue.service
      39ms systemd-rfkill.service
      35ms gssproxy.service
      33ms systemd-fsck@dev-disk-by\x2duuid-883C\x2d3CB3.service
      32ms systemd-tmpfiles-setup-dev.service
      31ms modprobe@dm_mod.service
      31ms boot-efi.mount
      30ms cups.service
      28ms rtkit-daemon.service
      28ms virtqemud.service
      27ms dracut-shutdown.service
      27ms unbound-anchor.service
      27ms dracut-cmdline.service
      26ms systemd-sysctl.service
      22ms colord.service
      22ms systemd-random-seed.service
      22ms systemd-backlight@backlight:intel_backlight.service
      21ms systemd-homed.service
      20ms plymouth-read-write.service
      20ms dbus-broker.service
      19ms systemd-fsck@dev-disk-by\x2duuid-97cbc979\x2d378d\x2d4908\x2d871c\x2d26d00b6fcbb7.service
      18ms systemd-zram-setup@zram0.service
      18ms systemd-userdbd.service
      16ms audit-rules.service
      16ms plymouth-start.service
      14ms dracut-pre-udev.service
      14ms systemd-machined.service
      14ms dev-hugepages.mount
      13ms dev-mqueue.mount
      13ms uresourced.service
      13ms sys-kernel-debug.mount
      13ms initrd-cleanup.service
      12ms sys-kernel-tracing.mount
      12ms user-runtime-dir@1000.service
      12ms auditd.service
      12ms flatpak-system-helper.service
      12ms kmod-static-nodes.service
      11ms wpa_supplicant.service
      10ms dracut-pre-pivot.service
      10ms systemd-update-utmp.service
       9ms boot.mount
       9ms gdm.service
       9ms home.mount
       9ms rpc-statd-notify.service
       8ms systemd-user-sessions.service
       8ms initrd-parse-etc.service
       8ms initrd-udevadm-cleanup-db.service
       8ms systemd-remount-fs.service
       6ms systemd-modules-load.service
       6ms systemd-fsck-root.service
       6ms modprobe@drm.service
       6ms modprobe@loop.service
       5ms modprobe@fuse.service
       5ms systemd-network-generator.service
       5ms modprobe@configfs.service
       5ms proc-sys-fs-binfmt_misc.mount
       4ms systemd-update-utmp-runlevel.service
       4ms systemd-sysusers.service
       4ms modprobe@efi_pstore.service
       3ms sys-fs-fuse-connections.mount
       2ms tmp.mount
      94us systemd-homed-activate.service
    ```

2. **Check system load:**
    - The output for command `uptime`:
   
    ```
    12:55:42 up 13:00,  1 user,  load average: 1.80, 1.54, 1.50
   ```
   
    - The output for command `w`:
   ```shell
   12:55:44 up 13:00,  1 user,  load average: 1.66, 1.51, 1.49
    USER     TTY        LOGIN@   IDLE   JCPU   PCPU WHAT
    t        tty2      Thu23   13:00m  0.02s  0.02s /usr/libexec/gnome-session-binary
    ```