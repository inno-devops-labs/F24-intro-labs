# Task 1

1. **Monitoring system resources:**
    - For CPU the most consuming applications are:
      - Gnome Shell
      - Pycharm
      - Htop
    - For Memory the most consuming are:
      - Pycharm
      - Telegram
      - Gnome Shell

2. **Disk management space:**
   - The disk space is used by 31% of available space ~240GB. 
   I have the dual-boot system with Fedora and Windows. The `df` command shows only the disk usage of mounted OS.
   
   - Output for the `df` command:
   
     ```
      Filesystem     1K-blocks     Used Available Use% Mounted on
      /dev/nvme0n1p6 240124928 71147700 164497388  31% /
      devtmpfs            4096        0      4096   0% /dev
      tmpfs            8074264     3516   8070748   1% /dev/shm
      efivarfs             184      113        67  63% /sys/firmware/efi/efivars
      tmpfs            3229708     2108   3227600   1% /run
      /dev/nvme0n1p6 240124928 71147700 164497388  31% /home
      tmpfs            8074264    11792   8062472   1% /tmp
      /dev/nvme0n1p5    996780   363956    564012  40% /boot
      /dev/nvme0n1p1     98304    46476     51828  48% /boot/efi
      tmpfs            1614852     3924   1610928   1% /run/user/1000
      ```


   - To find top 3 largest files, we have to use the following command:
      ```shell
      find /var -type f -exec du -h {file} + | sort -rh | head -n 3
      ```
   - The largest files are part of flatpack repository for building the system and applications.
      ```
      220M	/var/lib/flatpak/runtime/org.fedoraproject.Platform/x86_64/f40/0558a48ff9656735d27548f7294dc967d0af356b07a85d9f75c44371177cd688/files/lib/locale/locale-archive
      220M	/var/lib/flatpak/repo/objects/ef/513c76b4b0ee4f372ada7ef33740fee594fef46f8d05e5fa38e9e091671904.file
      171M	/var/lib/flatpak/repo/objects/a8/7cd22a3808536c2e743a95517d218fc781262a19fd3e383a56dbed1f4e2d2b.file
      ```