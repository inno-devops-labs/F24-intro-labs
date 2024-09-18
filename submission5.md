## Task 1

### Monitor System Resources

``htop`` - interactive process viewer

```
from memory bar:  7,24G/15.0G
from swap bar: 0K/0K
```

#### Top 3 the most consuming applications for CPU:

CPU usage (depending on the percentage of the processor time used by the process): 
- Firefox (3.8%), 
- htop(3.2%), 
- Firefox(2.6%)

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/cpu.png" alt="CPU" width="1000"/>

#### Top 3 the most consuming applications for memory:

Physical RAM usage: 
- Telegram Desktop (4,4% - 678M), 
- plasmashell (2,9% - 441M), 
- Firefox (2.9% - 440M)

Since the processes' statistics are updated frequently, the information might be slightly defferent on the screens:

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/ram_perc.png" alt="RAM" width="1000"/>


<img src="https://raw.githubusercontent.com/caxapb/New/main/data/ram.png" alt="RAM" width="1000"/>

Shared memory usage:
- Telegram Desktop (254M), 
- Google Chrome(249M), 
- Firefox(217M)

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/shared_mem.png" alt="Shared memoty" width="1000"/>

Virtual memory usage:
- All three top processes belong to Google Chrome: 1134G (but 2,8% of RAM)

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/virt.png" alt="Virtual memoty" width="1000"/>


#### I/O usage

``iostat -k``

This command captures the statistics in kilobytes. By default, iostat measure the I/O system with the bytes unit. To make it easier to read, I made the iostat show the reports in kilobytes unit:

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/iostat.jpg" alt="I/O usage" width="800"/>

- There are 16 devices: 15 of them are virtual (loop devices) - the majority of the loop devices have little or no read/write activity; **nvme0n1** is a physical device (Non-Volatile Memory Express), connects directly to the system's Peripheral Component Interconnect Express bus. This device is responsible for the most of I/O operations (as it can be seen on the screen). 
- CPU activity: 96.01% is per idle time, so the most of the CPU resources are available.
- tps: 3.57 - The number of transfers per second that were issued to the device. 
- kB_read/s, kB_wrtn/s, and kB_dscd/s : 33,72, 38,47, and 0.00 -  amount of data read from / written to / discarded for the device.
- kB_read, kB_wrtn, and kB_dscd: 4617650, 4127342,and 0 - same meaning but in total.

``iostat -k 2 3`` - for getting the statistics 3 times with delays. **nvme0n1** is still the most used but loop4 and loop9 are the most used in reading after the nvme0n1. The first report from the iostat command contains information accumulated from the moment the system boots until the iostat command is called. In each subsequent set, information collected over the previous time interval is displayed (in this case, 2 seconds). 

Collected stats for nvme0n1:

|Report number | tps |  kB_read/s | kB_wrtn/s | kB_dscd/s | kB_read | kB_wrtn | kB_dscd |
| ------------ | --- | ---------- | --------- | --------- | ------- | ------- | --------|
|1 | 15,18 | 582,55 | 90,56| 0,00 | 14074730 | 2188018 | 0 |
|2 | 28,36 |  250,75    |   129,35 |         0,00 |        504 |        260 |          0|
|3 |  1,50  |     192,00 |         0,00 |         0,00 |        384 |          0 |          0 |

``sudo pidstat -d 2`` - provides detailed I/O statistics for processes over time:
<img src="https://raw.githubusercontent.com/caxapb/New/main/data/pidstat.png" alt="I/O usage" width="800"/>


### Disk Space Management


``sudo find /var -type f -exec du -h {} + | sort -rh | head -n 3``: find /var -type f - find all files (not directories) within the /var directory, -exec du -h {} + - execute 'du -h {} +' on each found file, sort -rh - reverse sorting of human-readable values, head -n 3 - top 3 the largest files.

```
1.3G	/var/lib/snapd/snaps/clion_275.snap
1.3G	/var/lib/snapd/snaps/clion_274.snap
903M	/var/lib/snapd/cache/266bf83fc3d0cebadef1a197074c922b88c071b83014b0947f23f7dc62228dc47dd59ec6dc094f7e73d26d35bae862c4
```

``df -h``: check available disk space:
```
Filesystem      Size  Used Avail Use% Mounted on
dev             7.6G     0  7.6G   0% /dev
run             7.6G  1.7M  7.6G   1% /run
/dev/nvme0n1p4  246G  139G   95G  60% /
tmpfs           7.6G  158M  7.4G   3% /dev/shm
tmpfs           7.6G   25M  7.5G   1% /tmp
/dev/loop0      128K  128K     0 100% /var/lib/snapd/snap/bare/5
/dev/loop2      1.3G  1.3G     0 100% /var/lib/snapd/snap/clion/275
/dev/loop1      1.3G  1.3G     0 100% /var/lib/snapd/snap/clion/274
/dev/loop3      314M  314M     0 100% /var/lib/snapd/snap/code/168
/dev/loop9       75M   75M     0 100% /var/lib/snapd/snap/core22/1586
/dev/loop4      314M  314M     0 100% /var/lib/snapd/snap/code/169
/dev/loop7       64M   64M     0 100% /var/lib/snapd/snap/core20/2318
/dev/loop5       56M   56M     0 100% /var/lib/snapd/snap/core18/2823
/dev/loop8       64M   64M     0 100% /var/lib/snapd/snap/core20/2264
/dev/loop6       56M   56M     0 100% /var/lib/snapd/snap/core18/2829
/dev/loop11      92M   92M     0 100% /var/lib/snapd/snap/gtk-common-themes/1535
/dev/loop10      75M   75M     0 100% /var/lib/snapd/snap/core22/1612
/dev/loop12      39M   39M     0 100% /var/lib/snapd/snap/snapd/21465
/dev/loop13      39M   39M     0 100% /var/lib/snapd/snap/snapd/21759
/dev/nvme0n1p1  256M   33M  224M  13% /boot/efi
tmpfs           1.6G   92K  1.6G   1% /run/user/1000
```
### Summary

To sum up, I can conclude that web-browsers and application are the main consumers of CPU and memory powers. Firefox, Chrome, and Telegram Desktop use CPU resources the most and they need RAM the most. 
- ``htop`` as a process viewer provides system monitoring and process management, is used for checking CPU and memory usage information, info about load average and uptime, and real-time data of processes with stats like priority, CPU and memory consumption, etc. 
- ``iostat`` provides overall disk I/O statistics for a system, info about CPU usage (%user, %nice, %system %iowait, %steal %idle) and I/O info (read and written bytes).
- ``pidstat`` shows the I/O statistics for processes. Chrome and Firefox are performing some disk write activity (cache data, manage temporary files, etc.). Mongodb, Telegram Desktop, systemd-journal and plasmashell have much less 'write' activity. Baloo_file_extr is part of the Baloo file indexing system for KDE Plasma and reads the most (probably adjusting of Baloo's behaviour would bring some impact to decrease the system load). jbd2/nvme0n1p4-8 is related to the journaling of filesystem (one of the most among writers).
- ``du`` (Disk Usage) estimates and displays the amount of disk space used by files, directories, or entire filesystems. For example ``du -h ~/StudyCourses/DevOps`` will compute the size of each file and folders inside a given folder, and -sh option returns a size of a given folder. 
```
du -h ~/StudyCourses/DevOps
12K	/home/anastasia/StudyCourses/DevOps/F24-DevOps/.git/objects/26
8.0K	/home/anastasia/StudyCourses/DevOps/F24-DevOps/.git/objects/14
... etc ...
120K	/home/anastasia/StudyCourses/DevOps/.git
952K	/home/anastasia/StudyCourses/DevOps
```
```
du -sh ~/StudyCourses/DevOps
952K	/home/anastasia/StudyCourses/DevOps
```
- ``df`` (Disk Free) displays information about file system disk space usage. Displays a list with features: Filesystem, 1K(M)-blocks, Used, Available, Used%/Capacity, Mounted On 
```
df -m /boot
Filesystem     1M-blocks   Used Available Use% Mounted on
/dev/nvme0n1p4    250898 141365     96717  60% /
```

>**du** traverses the directory tree, measuring how much space each file takes up, and gives you the total space. **df** simply queries the file system for remaining space. It looks the same, however a file that has no directory entries will affect df but not du.


In my case, the CPU is mostly idle and has a lot of free capacity, disk is mostly reading data and there's no significant write activity. CPU cores seem free and no major disk I/O bottlenecks (there's plenty of idle CPU time and very low I/O wait time). I have multiple versions of snap packages taking up significant space (CLion, core, and code), and I have 2 versions of Clion, thus I should conduct a cleaning for my files to free memory. Also I have running processes with MongoDB, while I don't absolutely use it, thus it seems logical to get rid of it untill I need it again. 
