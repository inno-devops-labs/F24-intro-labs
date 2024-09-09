# Task 1: Key Metrics for SRE and SLAs


### 1. Monitor System Resources:

I used `htop` command to find processes that are using most CPU and memory. Using `f6` button I sorted them by the columns. CPU top updates every second. Here what I got:

CPU
| PID        | CPU (%)       | MEM (%)          | Command                                                 |
|------------|---------------|------------------|---------------------------------------------------------|
| 2401       |  3.3%         | 1.9%             | /home/zaurall/.vscode-server/bin/4849ca9bdf9666755eb463 |
| 1          |  2.0%         | 0.1%             | /sbin/init                                              |
| 358        |  0.7%         | 1.2%             | /snap/ubuntu-desktop-installer/1286/usr/bin/python3.10  |

In memory usage we have in top 3 many same processes runed by one command

Memory
| PID        | CPU (%)       | MEM (%)          | Command                                                 |
|------------|---------------|------------------|---------------------------------------------------------|
| 2401       |  3.3%         | 1.9%             | /home/zaurall/.vscode-server/bin/4849ca9bdf9666755eb463 |
| 2402       |  0.0%         | 1.9%             | /home/zaurall/.vscode-server/bin/4849ca9bdf9666755eb463 |
| 2403       |  0.0%         | 1.9%             | /home/zaurall/.vscode-server/bin/4849ca9bdf9666755eb463 |

After that I decided to run `iostat` command to see I/O usage:

I/O 
| Device | tps  | kB_read/s | kB_wrtn/s | kB_dscd/s | kB_read | kB_wrtn | kB_dscd |
|--------|------|-----------|-----------|-----------|---------|---------|---------|
| sda    | 0.44 | 28.67     | 0.00      | 0.00      | 74161   | 0       | 0       |
| sdb    | 0.04 | 0.86      | 0.00      | 0.00      | 2228    | 4       | 0       |
| sdc    | 19.04| 198.64    | 11.43     | 398.29    | 513813  | 29576   | 1030240 |

tps - transaction per second or activity of the device in terms of I/O usage. Here we can see that the top is following:
1. sdc
2. sda
3. sdb

### 2. Disk Space Management:

To find disk space usage we can use `df -h` command:

| Filesystem      | Size  | Used | Avail | Use% | Mounted on                              |
|-----------------|-------|------|-------|------|-----------------------------------------|
| none            | 3.8G  | 4.0K | 3.8G  | 1%   | /mnt/wsl                                |
| drivers         | 477G  | 420G | 57G   | 89%  | /usr/lib/wsl/drivers                    |
| /dev/sdc        | 1007G | 18G  | 938G  | 2%   | /                                       |
| G:\             | 15G   | 15G  | 876M  | 95%  | /mnt/g                                  |
| C:\             | 477G  | 420G | 57G   | 89%  | /mnt/c                                  |
| snapfuse        | 128K  | 128K | 0     | 100% | /snap/bare/5                            |
| snapfuse        | 132M  | 132M | 0     | 100% | /snap/ubuntu-desktop-installer/1276      |
| snapfuse        | 132M  | 132M | 0     | 100% | /snap/ubuntu-desktop-installer/1286      |
| snapfuse        | 75M   | 75M  | 0     | 100% | /snap/core22/1586                       |
| snapfuse        | 39M   | 39M  | 0     | 100% | /snap/snapd/21759  

Disk space on `/mnt/g` and `/mnt/c` have very high usage and should be monitored or cleared up to prevent running out of space. It's common for `snapfuce` to be 100% loaded.


I decided to analyze /var directory using `find /var -type f -print0 | xargs -0 du -h | sort -rh` command. I got a lot of files in this dir, and took 3 largest files:

1. /var/lib/snapd/snaps/ubuntu-desktop-installer_1286.snap (132 MB)
2. /var/lib/snapd/seed/snaps/ubuntu-desktop-installer_1276.snap (132 MB)
3. /var/lib/snapd/seed/snaps/gtk-common-themes_1535.snap (92 MB)


# Task 2: Terraform Installation and Nginx Deployment