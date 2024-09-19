# Task 1: Operating System Analysis

1) Analyze System Boot Time
```
❯ systemd-analyze
Startup finished in 5.721s (firmware) + 2.946s (loader) + 1.250s (kernel) + 12.029s (userspace) = 21.948s 
graphical.target reached after 11.751s in userspace.
```

```
❯ systemd-analyze blame
7.645s NetworkManager-wait-online.service
2.101s systemd-modules-load.service
1.007s boot.mount
 904ms NetworkManager.service
 481ms docker.service
 419ms dev-nvme0n1p6.device
 276ms tlp.service
 200ms ldconfig.service
 148ms user@1000.service
 141ms systemd-journal-flush.service
 119ms upower.service
 119ms systemd-udev-trigger.service
  93ms udisks2.service
  91ms systemd-tmpfiles-setup.service
  84ms systemd-hostnamed.service
  82ms systemd-remount-fs.service
  79ms systemd-tmpfiles-setup-dev-early.service
  79ms user-runtime-dir@1000.service
  79ms systemd-udevd.service
  74ms systemd-vconsole-setup.service
  73ms systemd-tmpfiles-clean.service
  70ms systemd-journald.service
  63ms containerd.service
  55ms systemd-journal-catalog-update.service
  51ms systemd-tmpfiles-setup-dev.service
  50ms systemd-userdbd.service
  41ms systemd-backlight@backlight:amdgpu_bl1.service
  35ms polkit.service
  35ms systemd-logind.service
  34ms wpa_supplicant.service
  34ms systemd-timesyncd.service
  31ms systemd-update-done.service
  29ms dev-disk-by\x2duuid-96c218c7\x2ddf6a\x2d4ec1\x2da65f\x2d90ad9933adb7.swap
  29ms systemd-udev-load-credentials.service
  21ms bluetooth.service
  18ms dev-zram0.swap
  16ms systemd-zram-setup@zram0.service
  15ms dbus-broker.service
  15ms alsa-restore.service
  14ms systemd-sysctl.service
  13ms systemd-sysusers.service
  12ms dev-hugepages.mount
  12ms dev-mqueue.mount
  11ms sys-kernel-debug.mount
  10ms systemd-rfkill.service
  10ms sys-kernel-tracing.mount
   9ms nvidia-persistenced.service
   9ms thermald.service
   9ms rtkit-daemon.service
   9ms kmod-static-nodes.service
   9ms modprobe@configfs.service
   9ms systemd-random-seed.service
   8ms modprobe@drm.service
   8ms modprobe@fuse.service
   7ms sshd.service
   6ms systemd-update-utmp.service
   5ms sys-fs-fuse-connections.mount
   5ms sys-kernel-config.mount
   4ms modprobe@loop.service
   4ms systemd-user-sessions.service
   4ms modprobe@dm_mod.service
   3ms docker.socket
   3ms tmp.mount
```
Insights:

Userspace takes the longest time to start up on my machine (12.029s)

NetworkManager-wait-online.service (7.645s): This service is the largest factor, waiting for the network to be online before proceeding.

2) Check System Load and Uptime
```
❯ uptime
 14:23:44 up  1:52,  2 users,  load average: 1.62, 1.71, 1.72
❯ w
 14:23:49 up  1:52,  2 users,  load average: 1.57, 1.70, 1.71
USER     TTY       LOGIN@   IDLE   JCPU   PCPU  WHAT
john               12:31    1:42m  0.00s  0.17s /usr/lib/systemd/systemd --user
john     tty1      13:35    1:52m 41:16   0.07s /usr/lib/firefox/firefox -contentproc -childID 40 -isForBrowser -prefsLen

```
Insights:

The three load averages represent the system load over the last 1, 5, and 15 minutes:
- 1 minute: 1.62
- 5 minutes: 1.71
- 15 minutes: 1.72

john has been logged in since 12:31 with minimal activity.
The second session (also by "john") on tty1 is running Firefox, which has used significant CPU time (41 minutes, 16 seconds).

Firefox seems to be the most resource-intensive application currently running.

# Task 2: Networking Analysis

1) Traceout
```
❯ traceroute yandex.ru
traceroute to yandex.ru (213.180.193.56), 30 hops max, 60 byte packets
 1  _gateway (10.248.1.1)  1.255 ms  1.372 ms  1.493 ms
 2  10.250.0.2 (10.250.0.2)  0.645 ms  3.703 ms  1.948 ms
 3  10.252.6.1 (10.252.6.1)  1.431 ms  1.644 ms  1.518 ms
 4  188.170.164.34 (188.170.164.34)  4.236 ms  4.116 ms  3.958 ms
 5  * * *
 6  * * *
 7  83.169.204.166 (83.169.204.166)  15.959 ms  15.980 ms  16.149 ms
 8  * vla-e3-ae92.yndx.net (93.158.160.149)  19.686 ms *
 9  sas-32z3-ae1.yndx.net (87.250.239.183)  49.182 ms sas-32z9-eth-trunk1.yndx.net (87.250.239.87)  24.639 ms
 ```

The first three hops are within a private IP address space (10.x.x.x), indicating local gateway.

Hop 4 is the first hop outside the local network.

Hops 5-6 did not provide any response. It could happen due to their configuration or due to the overload.

Latency at hope 7 increases. It can indicate that this hop is within the another region.

Hops 8 and 9 are finally the yandex servers.

2) Dig
```
dig yandex.ru

; <<>> DiG 9.20.1 <<>> yandex.ru
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 27517
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
; COOKIE: a70a9a8cf9faf73f13cc0f7366ec205d6c2cd432471d3948 (good)
;; QUESTION SECTION:
;yandex.ru.			IN	A

;; ANSWER SECTION:
yandex.ru.		86	IN	A	213.180.193.56

;; Query time: 6 msec
;; SERVER: 10.90.137.30#53(10.90.137.30) (UDP)
;; WHEN: Thu Sep 19 16:00:13 MSK 2024
;; MSG SIZE  rcvd: 82
```

The response provides the following sections: header, opt, question, answer.

The interesting parts for us are question and answer. We ask the dns server to provide us with ip of yandex.ru domain name.
The answer shows that the domain yandex.ru resolves to the IP address 213.180.193.56. The 86 represents the Time To Live in seconds.