## Task 1: Key Metrics for SRE and SLAs
### 1. Monitor System Resources:
```shell
htop
```
then navigate using F6. Top by CPU% is:
```shell
PID USER      PRI  NI  VIRT   RES   SHR S CPU%▽MEM%   TIME+  Command
418 root       20   0 44192 38216 10372 S  0.7  0.2  0:13.49 python3 /snap/ubuntu-desktop-installer/1286/usr/bin/cloud-init status --wait
1   root       20   0  163M 12660  8324 S  0.0  0.1  0:29.07 /sbin/init
2   root       20   0  2476  1432  1320 S  0.0  0.0  0:00.00 /init
```
So processes with id 418, 1 and 2 are most CPU consuming ones, but 1 and 2 have 0.0%)

By MEM% (memory):
```shell
PID  USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%▽  TIME+  Command
296  root       20   0 1008M 87124 27604 S  0.0  0.6  0:03.73 /snap/ubuntu-desktop-installer/1286/usr/bin/python3.10 -m subiquity.cmd.server --use-os-prober --storage-version=2 --postinst-hooks-dir=/snap/ubuntu-desktop-installer/1286/etc/subiquity/postinst.d
419  root       20   0 1008M 87124 27604 S  0.0  0.6  0:00.00 /snap/ubuntu-desktop-installer/1286/usr/bin/python3.10 -m subiquity.cmd.server --use-os-prober --storage-version=2 --postinst-hooks-dir=/snap/ubuntu-desktop-installer/1286/etc/subiquity/postinst.d
2809 root       20   0 1008M 87124 27604 S  0.0  0.6  0:00.02 /snap/ubuntu-desktop-installer/1286/usr/bin/python3.10 -m subiquity.cmd.server --use-os-prober --storage-version=2 --postinst-hooks-dir=/snap/ubuntu-desktop-installer/1286/etc/subiquity/postinst.d
```
Regarding the memory, top 3 are 296, 419 and 2809 processes, with 0.6% memory usage on everyone

By I/O:

Install sysstat:
```shell
sudo apt install sysstat
```
Iostat:
```shell
iostat
```
```
Linux 5.15.153.1-microsoft-standard-WSL2 (Bod)  09/19/24        _x86_64_        (12 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.08    0.00    0.07    0.01    0.00   99.84

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
sda               0.16        10.61         0.00         0.00      82713          0          0
sdb               0.01         0.29         0.00         0.00       2228          4          0
sdc               6.66       119.65        16.69        38.59     932625     130100     300772
```
This gives as information about devices, but not processes. To check processes, we can use htop, configuring it for I/O Rate, IO_RBYTES and IO_WBYTES, but there are a lot of N/A and 0's for some reason:
```shell
DISK R/W▽    PID   IO_RBYTES   IO_WBYTES     RD_SYSC     WR_SYSC USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
     N/A       1         N/A         N/A         N/A         N/A root       20   0  163M 12660  8324 S  0.0  0.1  0:32.87 /sbin/init
     N/A       2         N/A         N/A         N/A         N/A root       20   0  2476  1432  1320 S  0.0  0.0  0:00.00 /init
     N/A       7         N/A         N/A         N/A         N/A root       20   0  2520   144   132 S  0.0  0.0  0:00.01 plan9 --control-socket 6 --log-level 4 --server-fd 7 --pipe-fd 9 --log-truncate
```

Also we can try iotop:
```shell
sudo apt install iotop
sudo iotop
```

But we also see a lot of 0's
<details>
<summary>Output</summary>

```
Total DISK READ:         0.00 B/s | Total DISK WRITE:         0.00 B/s
Current DISK READ:       0.00 B/s | Current DISK WRITE:       0.00 B/s
    TID  PRIO  USER     DISK READ  DISK WRITE  SWAPIN     IO>    COMMAND                                                                                                                                                                                                                                                  1 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  init
      2 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  init
      9 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  init [Interop]
      7 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  plan9 --control-socket 6 --log-level 4 --server-fd 7 --pipe-fd 9 --log-truncate
      8 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  plan9 --control-socket 6 --log-level 4 --server-fd 7 --pipe-fd 9 --log-truncate
     36 be/3 root        0.00 B/s    0.00 B/s  ?unavailable?  systemd-journald
     56 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  systemd-udevd
     67 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/core22_1586.snap /snap/core22/1586 -o ro,nodev,allow_other,suid
     69 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/core22_1586.snap /snap/core22/1586 -o ro,nodev,allow_other,suid
     73 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/core22_1586.snap /snap/core22/1586 -o ro,nodev,allow_other,suid
     68 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/bare_5.snap /snap/bare/5 -o ro,nodev,allow_other,suid
     70 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/bare_5.snap /snap/bare/5 -o ro,nodev,allow_other,suid
     71 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/bare_5.snap /snap/bare/5 -o ro,nodev,allow_other,suid
     75 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/core22_1612.snap /snap/core22/1612 -o ro,nodev,allow_other,suid
     76 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/core22_1612.snap /snap/core22/1612 -o ro,nodev,allow_other,suid
     77 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/core22_1612.snap /snap/core22/1612 -o ro,nodev,allow_other,suid
    299 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/core22_1612.snap /snap/core22/1612 -o ro,nodev,allow_other,suid
    300 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/core22_1612.snap /snap/core22/1612 -o ro,nodev,allow_other,suid
    414 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/core22_1612.snap /snap/core22/1612 -o ro,nodev,allow_other,suid
     82 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/gtk-common-themes_1535.snap /snap/gtk-common-themes/1535 -o ro,nodev,allow_other,suid
     83 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/gtk-common-themes_1535.snap /snap/gtk-common-themes/1535 -o ro,nodev,allow_other,suid
     84 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/gtk-common-themes_1535.snap /snap/gtk-common-themes/1535 -o ro,nodev,allow_other,suid
     90 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/snapd_20290.snap /snap/snapd/20290 -o ro,nodev,allow_other,suid
     91 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/snapd_20290.snap /snap/snapd/20290 -o ro,nodev,allow_other,suid
     93 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/snapd_20290.snap /snap/snapd/20290 -o ro,nodev,allow_other,suid
     94 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/snapd_21759.snap /snap/snapd/21759 -o ro,nodev,allow_other,suid
     95 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/snapd_21759.snap /snap/snapd/21759 -o ro,nodev,allow_other,suid
     96 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/snapd_21759.snap /snap/snapd/21759 -o ro,nodev,allow_other,suid
   1602 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/snapd_21759.snap /snap/snapd/21759 -o ro,nodev,allow_other,suid
   1603 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/snapd_21759.snap /snap/snapd/21759 -o ro,nodev,allow_other,suid
    100 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/ubuntu-desktop-installer_1276.snap /snap/ubuntu-desktop-installer/1276 -o ro,nodev,allow_other,suid
    101 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/ubuntu-desktop-installer_1276.snap /snap/ubuntu-desktop-installer/1276 -o ro,nodev,allow_other,suid
    102 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/ubuntu-desktop-installer_1276.snap /snap/ubuntu-desktop-installer/1276 -o ro,nodev,allow_other,suid
    103 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/ubuntu-desktop-installer_1286.snap /snap/ubuntu-desktop-installer/1286 -o ro,nodev,allow_other,suid
    104 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/ubuntu-desktop-installer_1286.snap /snap/ubuntu-desktop-installer/1286 -o ro,nodev,allow_other,suid
    105 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/ubuntu-desktop-installer_1286.snap /snap/ubuntu-desktop-installer/1286 -o ro,nodev,allow_other,suid
    301 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/ubuntu-desktop-installer_1286.snap /snap/ubuntu-desktop-installer/1286 -o ro,nodev,allow_other,suid
    302 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  snapfuse /var/lib/snapd/snaps/ubuntu-desktop-installer_1286.snap /snap/ubuntu-desktop-installer/1286 -o ro,nodev,allow_other,suid
    112 be/4 systemd-    0.00 B/s    0.00 B/s  ?unavailable?  systemd-resolved
    125 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  cron -f -P
  keys:  any: refresh  q: quit  i: ionice  o: active  p: procs  a: accum                                                                                                                                                                                                                                              sort:  r: asc  left: SWAPIN  right: COMMAND  home: TID  end: COMMAND                                          
```

</details>

Probably, it's because I use WSL, and most of I/O operations are outside of subsystem scope

### 2. Disk Space Management:

```shell
df
```

```shell
Filesystem      1K-blocks      Used Available Use% Mounted on
none              7892572         4   7892568   1% /mnt/wsl
drivers        1000186876 347530868 652656008  35% /usr/lib/wsl/drivers
none              7892572         0   7892572   0% /usr/lib/modules
none              7892572         0   7892572   0% /usr/lib/modules/5.15.153.1-microsoft-standard-WSL2
/dev/sdc       1055762868  60634472 941424924   7% /
none              7892572       112   7892460   1% /mnt/wslg
none              7892572         0   7892572   0% /usr/lib/wsl/lib
rootfs            7889220      2080   7887140   1% /init
none              7892572       836   7891736   1% /run
none              7892572         0   7892572   0% /run/lock
none              7892572         0   7892572   0% /run/shm
tmpfs                4096         0      4096   0% /sys/fs/cgroup
none              7892572        76   7892496   1% /mnt/wslg/versions.txt
none              7892572        76   7892496   1% /mnt/wslg/doc
C:\            1000186876 347530868 652656008  35% /mnt/c
D:\             976658364 941753176  34905188  97% /mnt/d
snapfuse              128       128         0 100% /snap/bare/5
snapfuse            76160     76160         0 100% /snap/core22/1586
snapfuse            76160     76160         0 100% /snap/core22/1612
snapfuse            93952     93952         0 100% /snap/gtk-common-themes/1535
snapfuse            41856     41856         0 100% /snap/snapd/20290
snapfuse            39808     39808         0 100% /snap/snapd/21759
snapfuse           134272    134272         0 100% /snap/ubuntu-desktop-installer/1276
snapfuse           134912    134912         0 100% /snap/ubuntu-desktop-installer/1286
```

We can see 2 main filesystems of different Windows OSs, that are mounted to /mnt/c and mnt/d directories.

```shell
du
```

<details>
<summary>Output</summary>

```shell
44      ./.git/hooks
0       ./.git/info
12      ./.git/logs/refs/heads
4       ./.git/logs/refs/remotes/origin
4       ./.git/logs/refs/remotes
16      ./.git/logs/refs
28      ./.git/logs
28      ./.git/objects/04
4       ./.git/objects/07
4       ./.git/objects/0a
4       ./.git/objects/0b
4       ./.git/objects/10
4       ./.git/objects/18
4       ./.git/objects/1b
4       ./.git/objects/23
0       ./.git/objects/27
8       ./.git/objects/2f
0       ./.git/objects/32
0       ./.git/objects/34
0       ./.git/objects/39
0       ./.git/objects/3d
4       ./.git/objects/43
0       ./.git/objects/49
4       ./.git/objects/4a
0       ./.git/objects/4b
0       ./.git/objects/4c
0       ./.git/objects/4e
0       ./.git/objects/4f
0       ./.git/objects/50
4       ./.git/objects/52
48      ./.git/objects/54
36      ./.git/objects/56
0       ./.git/objects/64
28      ./.git/objects/69
8       ./.git/objects/6c
4       ./.git/objects/6d
0       ./.git/objects/6e
4       ./.git/objects/71
4       ./.git/objects/77
4       ./.git/objects/79
0       ./.git/objects/7a
0       ./.git/objects/7b
0       ./.git/objects/7c
0       ./.git/objects/7d
0       ./.git/objects/7e
44      ./.git/objects/80
0       ./.git/objects/82
0       ./.git/objects/86
4       ./.git/objects/89
4       ./.git/objects/8a
4       ./.git/objects/94
4       ./.git/objects/98
4       ./.git/objects/9a
0       ./.git/objects/9f
4       ./.git/objects/a0
68      ./.git/objects/ab
0       ./.git/objects/ac
0       ./.git/objects/ad
72      ./.git/objects/ae
0       ./.git/objects/b5
0       ./.git/objects/bf
4       ./.git/objects/c0
44      ./.git/objects/c4
4       ./.git/objects/c6
4       ./.git/objects/cc
92      ./.git/objects/d3
36      ./.git/objects/d4
32      ./.git/objects/d5
4       ./.git/objects/d6
4       ./.git/objects/dc
0       ./.git/objects/e5
0       ./.git/objects/e6
52      ./.git/objects/e8
4       ./.git/objects/e9
76      ./.git/objects/ec
4       ./.git/objects/ed
32      ./.git/objects/f0
0       ./.git/objects/f1
0       ./.git/objects/f3
36      ./.git/objects/f6
0       ./.git/objects/fa
0       ./.git/objects/fb
4       ./.git/objects/fd
0       ./.git/objects/ff
0       ./.git/objects/info
12      ./.git/objects/pack
864     ./.git/objects
0       ./.git/refs/heads
0       ./.git/refs/remotes/origin
0       ./.git/refs/remotes
0       ./.git/refs/tags
0       ./.git/refs
944     ./.git
0       ./.idea/inspectionProfiles
8       ./.idea
996     .
```

</details>

We can see disk space usage of files in this working directory (I will not put everything, because it's too much I guess)

The top 3 largest files in the /var directory:

```shell
sudo find /var -printf '%s %p\n'| sort -nr | head -3
```

```shell
138027008 /var/lib/snapd/snaps/ubuntu-desktop-installer_1286.snap
137453568 /var/lib/snapd/snaps/ubuntu-desktop-installer_1276.snap
137453568 /var/lib/snapd/seed/snaps/ubuntu-desktop-installer_1276.snap
```

## Task 2: Terraform Installation and Nginx Deployment

