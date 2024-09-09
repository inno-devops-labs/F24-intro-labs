# Task 1: Operating System Analysis


I used `systemd-analyze` to check the overall boot time and identify slow services.

```
$ systemd-analyze
Startup finished in 3.302s (userspace) 
graphical.target reached after 3.295s in userspace.
$ systemd-analyze blame
2min 55.997s dev-loop0.device
     18.280s apt-daily.service
      7.695s motd-news.service
      2.697s postgresql@14-main.service
      1.905s snapd.service
       927ms docker.service
       593ms man-db.service
       258ms dev-sdc.device
       227ms logrotate.service
       221ms networkd-dispatcher.service
       220ms dpkg-db-backup.service
       188ms systemd-resolved.service
       159ms snapd.seeded.service
       125ms console-getty.service
       117ms user@0.service
       111ms systemd-logind.service
       100ms packagekit.service
        97ms systemd-udev-trigger.service
        87ms containerd.service
        86ms systemd-journal-flush.service
        85ms user@1000.service
        76ms systemd-tmpfiles-clean.service
        71ms systemd-udevd.service
        62ms apport.service
        54ms e2scrub_reap.service
        52ms keyboard-setup.service
        41ms systemd-journald.service
        41ms modprobe@configfs.service
        40ms dev-hugepages.mount
        39ms dev-mqueue.mount
        37ms modprobe@drm.service
        37ms sys-kernel-debug.mount
        37ms modprobe@efi_pstore.service
        35ms sys-kernel-tracing.mount
        35ms modprobe@fuse.service
        34ms snap-bare-5.mount
        32ms snap-core22-1586.mount
        31ms snap-core22-1612.mount
        29ms snap-gtk\x2dcommon\x2dthemes-1535.mount
        26ms snap-snapd-21465.mount
        26ms rsyslog.service
        23ms systemd-tmpfiles-setup.service
        21ms systemd-sysusers.service
        17ms systemd-tmpfiles-setup-dev.service
        16ms systemd-sysctl.service
        15ms polkit.service
        14ms snap-snapd-21759.mount
        14ms systemd-remount-fs.service
        14ms user-runtime-dir@0.service
        14ms snap-core24-490.mount
        12ms plymouth-read-write.service
        12ms snap-ubuntu\x2ddesktop\x2dinstaller-1276.mount
        12ms plymouth-quit.service
        12ms snap-ubuntu\x2ddesktop\x2dinstaller-1286.mount
        12ms snap-ubuntu\x2ddesktop\x2dinstaller-1276.mount
        12ms plymouth-quit.service
        12ms snap-ubuntu\x2ddesktop\x2dinstaller-1286.mount
         9ms snap-terraform-731.mount
         9ms systemd-update-utmp.service
         7ms user-runtime-dir@1000.service
         7ms console-setup.service
         6ms setvtrgb.service
         6ms systemd-user-sessions.service
         5ms snap.mount
         4ms sys-fs-fuse-connections.mount
         4ms systemd-update-utmp-runlevel.service
         4ms plymouth-quit-wait.service
         4ms ufw.service
         3ms postgresql.service
         2ms snapd.socket
         2ms getty@tty1.service
         1ms docker.socket
```

I have wsl and it's booting very fastly in approximately 3.3 second. `dev-loop0.device` service is the most time-consuming, taking nearly 3 minutes. There also exists several services that are taking long time.

Using `uptime` and `w` commands I checked system load and uptime.

```
$ uptime
 00:51:59 up  2:54,  2 users,  load average: 0.08, 0.13, 0.16
$ w
 00:52:11 up  2:54,  2 users,  load average: 0.07, 0.13, 0.15
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
zaurall  pts/1    -                21:57    2:54m  0.03s  0.02s -bash
root     pts/7    -                23:36    1:15m  0.03s  0.02s -bash
```

The system was up for 2 hours and 54 minutes with a low load average. It means that system is under minimal load. It's true because I didn't run any hard programs here.


# Task 2: Networking Analysis


```
$ traceroute example.com
traceroute to example.com (93.184.215.14), 30 hops max, 60 byte packets
 1  DESKTOP-QAR5BLG.mshome.net (172.22.176.1)  0.556 ms  0.506 ms  0.463 ms
 2  10.91.48.1 (10.91.48.1)  4.156 ms  4.114 ms  4.098 ms
 3  10.252.6.1 (10.252.6.1)  4.046 ms  10.886 ms  3.966 ms
 4  188.170.164.34 (188.170.164.34)  12.025 ms  11.881 ms  11.844 ms
 5  * * *
 6  * * *
 7  * * *
 8  83.169.204.70 (83.169.204.70)  38.414 ms  38.336 ms 83.169.204.74 (83.169.204.74)  38.322 ms
 9  war-b3-link.ip.twelve99.net (195.12.255.204)  41.650 ms  41.565 ms  41.551 ms
10  ffm-bb2-link.ip.twelve99.net (62.115.120.20)  57.235 ms  57.159 ms ffm-bb1-link.ip.twelve99.net (62.115.117.224)  57.145 ms
11  prs-bb2-link.ip.twelve99.net (62.115.122.138)  78.836 ms  76.641 ms prs-bb1-link.ip.twelve99.net (62.115.123.13)  62.704 ms
12  * ash-bb2-link.ip.twelve99.net (62.115.112.242)  148.539 ms rest-bb1-link.ip.twelve99.net (62.115.122.159)  139.388 ms
13  ash-b2-link.ip.twelve99.net (62.115.123.125)  147.196 ms  165.924 ms *
14  edgio-ic-315152.ip.twelve99-cust.net (213.248.83.119)  155.997 ms 62.115.175.71 (62.115.175.71)  154.502 ms  154.488 ms
15  ae-65.core1.dcd.edgecastcdn.net (152.195.64.153)  157.259 ms  156.214 ms ae-66.core1.dcd.edgecastcdn.net (152.195.65.153)  145.538 ms
16  93.184.215.14 (93.184.215.14)  157.131 ms  153.883 ms  152.918 ms
17  93.184.215.14 (93.184.215.14)  154.269 ms  157.579 ms  158.626 ms
```

```
$ dig example.com

; <<>> DiG 9.18.18-0ubuntu0.22.04.2-Ubuntu <<>> example.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 37006
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;example.com.                   IN      A

;; ANSWER SECTION:
example.com.            2452    IN      A       93.184.215.14

;; Query time: 9 msec
;; SERVER: 10.255.255.254#53(10.255.255.254) (UDP)
;; WHEN: Tue Sep 10 01:04:49 MSK 2024
;; MSG SIZE  rcvd: 56
```

Network path has some intermediate hops experiencing timeouts, which is common. The final destination shows a higher latency which is expected over long distances. It's typical. The presence of some `* * *` indicates of packet loss or timeout.

Latency to `example.com` is relatively high, it can be because I'm using vpn.

The DNS query response was quick and accurate, resolving `example.com` to IP `93.184.215.14` in 9 milliseconds.
