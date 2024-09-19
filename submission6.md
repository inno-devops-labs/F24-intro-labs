## Task 1: Operating System Analysis

```shell
systemd-analyze
```
![img.png](images/img.png)
```shell
systemd-analyze blame
```
<details>
<summary>Output</summary>

```
5.500s motd-news.service
1.591s apt-daily-upgrade.service
 834ms docker.service
 670ms man-db.service
 215ms snapd.seeded.service
 181ms apt-daily.service
 166ms dev-sdc.device
 118ms networkd-dispatcher.service
 107ms snapd.service
 103ms systemd-resolved.service
  59ms systemd-logind.service
  55ms containerd.service
  51ms user@1000.service
  47ms apport.service
  42ms systemd-udevd.service
  39ms packagekit.service
  38ms systemd-journal-flush.service
  36ms e2scrub_reap.service
  32ms keyboard-setup.service
  31ms systemd-tmpfiles-clean.service
  29ms systemd-udev-trigger.service
  27ms rsyslog.service
  26ms systemd-journald.service
  23ms modprobe@configfs.service
  22ms modprobe@drm.service
  22ms modprobe@efi_pstore.service
  22ms modprobe@fuse.service
  17ms dev-hugepages.mount
  16ms dev-mqueue.mount
  16ms sys-kernel-debug.mount
  15ms sys-kernel-tracing.mount
  13ms plymouth-read-write.service
  11ms snap-bare-5.mount
  11ms plymouth-quit.service
  10ms snap-core22-1586.mount
  10ms snap-core22-1612.mount
  10ms systemd-tmpfiles-setup-dev.service
   9ms snap-gtk\x2dcommon\x2dthemes-1535.mount
   9ms systemd-sysctl.service
   8ms systemd-sysusers.service
   8ms systemd-tmpfiles-setup.service
   8ms snap-snapd-20290.mount
   7ms snap-snapd-21759.mount
   6ms snap-ubuntu\x2ddesktop\x2dinstaller-1276.mount
   6ms systemd-remount-fs.service
   6ms snap-core24-490.mount
   5ms polkit.service
   5ms systemd-user-sessions.service
   5ms snap-ubuntu\x2ddesktop\x2dinstaller-1286.mount
   4ms console-setup.service
   3ms systemd-update-utmp.service
   3ms systemd-update-utmp-runlevel.service
   3ms snap-terraform-736.mount
   3ms user-runtime-dir@1000.service
   3ms sys-fs-fuse-connections.mount
   2ms snap.mount
   2ms plymouth-quit-wait.service
   1ms ufw.service
   1ms setvtrgb.service
   1ms snapd.socket
 440us docker.socket
```

</details>

```shell
uptime
```
![img_1.png](images/img_1.png)

```shell
w
```
![img_2.png](images/img_2.png)

As we can see, boot time is very fast. I guess that the main reason is that it's WSL

Regarding the 'uptime' and 'w' commands, looks like 'w' is just and extended version that provided data about users

## Task 2: Networking Analysis

```shell
sudo apt install traceroute
traceroute google.com
```

<details>
<summary>Output</summary>

```
traceroute to google.com (216.239.38.120), 30 hops max, 60 byte packets
 1  Bod.mshome.net (172.26.16.1)  0.395 ms  0.377 ms  0.337 ms
 2  10.247.1.1 (10.247.1.1)  1.862 ms  1.682 ms  1.463 ms
 3  10.250.0.2 (10.250.0.2)  0.910 ms  0.886 ms  5.221 ms
 4  10.252.6.1 (10.252.6.1)  1.472 ms  1.450 ms  1.274 ms
 5  188.170.164.34 (188.170.164.34)  9.472 ms  9.452 ms  9.435 ms
 6  * * *
 7  * * *
 8  * * *
 9  83.169.204.117 (83.169.204.117)  16.004 ms 83.169.204.115 (83.169.204.115)  15.653 ms 83.169.204.113 (83.169.204.113)  15.506 ms
10  72.14.222.181 (72.14.222.181)  18.062 ms 178.176.152.61 (178.176.152.61)  15.920 ms 72.14.222.181 (72.14.222.181)  18.423 ms
11  192.178.241.157 (192.178.241.157)  22.274 ms 192.178.241.51 (192.178.241.51)  17.335 ms 192.178.241.157 (192.178.241.157)  22.226 ms
12  * * 192.178.241.146 (192.178.241.146)  16.658 ms
13  192.178.240.241 (192.178.240.241)  30.954 ms * *
14  142.251.238.70 (142.251.238.70)  31.710 ms 216.239.48.224 (216.239.48.224)  38.031 ms 72.14.232.76 (72.14.232.76)  35.565 ms
15  74.125.253.147 (74.125.253.147)  31.501 ms 216.239.57.5 (216.239.57.5)  32.864 ms 142.250.233.27 (142.250.233.27)  35.404 ms
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  * * *
23  * * *
24  * * *
25  any-in-2678.1e100.net (216.239.38.120)  36.189 ms  36.182 ms  32.335 ms
```

</details>

We see that target server was reached, latency is quite normal

```shell
dig google.com
```

<details>
<summary>Output</summary>

```
; <<>> DiG 9.18.28-0ubuntu0.22.04.1-Ubuntu <<>> google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 56588
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;google.com.                    IN      A

;; ANSWER SECTION:
google.com.             26896   IN      CNAME   forcesafesearch.google.com.
forcesafesearch.google.com. 24602 IN    A       216.239.38.120

;; Query time: 0 msec
;; SERVER: 10.255.255.254#53(10.255.255.254) (UDP)
;; WHEN: Thu Sep 19 18:25:19 MSK 2024
;; MSG SIZE  rcvd: 85
```

</details>

We see that ip address is the same as in traceroute.
