# Task 1 Operating System Analysis

1) **System boot time:**

``sydtemd-analyze`` - prints the time spent in the kernel before userspace has been reached, the time spent in the initrd before normal system userspace has been reached, and the time normal system userspace took to initialize. To be concise: total boot time.
```
Startup finished in 4.957s (firmware) + 2.461s (loader) + 1.464s (kernel) + 4.092s (userspace) = 12.976s 
graphical.target reached after 4.092s in userspace.
```
Here the time of BIOS firmware is 4.957s, time for bootloader is 2.461s, kernel work for starting is 1.464s, and time taken by services/processes is 4.092s. 12.976s in total to boot. Seems that it is relatively quick for a graphical boot and I don't have problems with it. The booting lasts fast and smoothly.


``systemd-analyze critical-chain`` - shows the most time-consuming services that are critical during boot:
```
The time when unit became active or started is printed after the "@" character.
The time the unit took to start is printed after the "+" character.

graphical.target @4.092s
└─sddm.service @4.092s
  └─plymouth-quit.service @3.969s +82ms
    └─systemd-user-sessions.service @3.839s +46ms
      └─network.target @3.836s
        └─NetworkManager.service @3.653s +182ms
          └─basic.target @3.651s
            └─dbus-broker.service @3.604s +45ms
              └─dbus.socket @3.554s
                └─sysinit.target @3.551s
                  └─systemd-timesyncd.service @3.346s +119ms
                    └─systemd-tmpfiles-setup.service @3.050s +265ms
                      └─local-fs.target @3.047s
                        └─boot-efi.mount @1.992s +951ms
                          └─systemd-fsck@dev-disk-by\x2duuid-C6A1\x2d0DF8.service @1.549s +126ms
                            └─dev-disk-by\x2duuid-C6A1\x2d0DF8.device @1.498s
```
@ sign means time the service became active (since the boot started), and + means how long it took to start. *graphical.targe*t was ready 4.092s after the boot started. The lower processes are dependencies. *dev-nvme0n1p4.device* refers to the NVMe storage device (/dev/nvme0n1p4) considered in the previous (5th) lab (the system prepares to use the device). This service took 488ms to start.

``systemd-analyze blame`` - prints a list of all running units, ordered by the time they took to initialize. 
```
1.135s boot-efi.mount
1.017s docker.service
 907ms dev-nvme0n1p4.device
 356ms systemd-tmpfiles-setup.service
 305ms dev-loop6.device
 304ms dev-loop9.device
 303ms dev-loop13.device
 302ms dev-loop12.device
 301ms dev-loop8.device
 301ms dev-loop11.device
 300ms dev-loop7.device
 299ms dev-loop10.device
 298ms dev-loop1.device
 298ms dev-loop3.device
 297ms dev-loop5.device
 297ms dev-loop0.device
 296ms dev-loop2.device
 295ms dev-loop4.device
 266ms ldconfig.service
 260ms systemd-udev-trigger.service
 241ms systemd-remount-fs.service
 230ms containerd.service
 215ms user@1000.service
 215ms systemd-modules-load.service
... etc ...
```
- *boot-efi.mount:* took 1.135 seconds to mount the EFI partition. Since this is related to UEFI boot, it’s expected but slightly on the higher side.
- *docker.service:* a containerization service took 1.017 seconds to start, which is reasonable but a bit slow.
- *dev-loop devices:* related to Snap or Flatpak applications are initialized during boot, each taking around 300ms (more or less).

2) **System Load and Uptime**

``uptime`` - shows how long the system has been running, amount of users, and average system load for the last 1, 5, and 15 minutes:
```
18:28:05 up  7:59,  1 user,  load average: 1.86, 2.26, 2.26
```
My system is currently running for about 8 hours with 1 logged user (me). I also can check the only exact time of my laptop being turned on:

``uptime -p``
```
up 8 hours, 0 minutes
```

``w`` - a quick summary of every user logged into a computer, what each user is currently doing, and what load all the activity is imposing on the computer itself
```
 18:30:26 up  8:02,  1 user,  load average: 2.18, 2.19, 2.22
USER     TTY       LOGIN@   IDLE   JCPU   PCPU  WHAT
anastasi tty1      10:28    8:02m  0.08s  0.08s /usr/bin/startplasma-wayland
```

1 user (me), TTY1 as a terminal device associated with the session, LOGIN - time at which the user logged in (10:28), IDLE 8:02m (duration of inactivity), JCPU is 0.08s - CPU time used by all processes, PCPU 0.08s is percentage of CPU time used by the user’s current process, and WHAT is /usr/bin/startplasma-wayland - process running in the user’s session.

#### Summary:
My boot is relatively fast and I cannot improve it too much, because firmware takes the most (5s) and it depends on hardware and BIOS. As I mentioned in the previous lab, I enabled Docker to run each time I start the boot. It takes the 2nd place in most-time-consuming processes, so it will be reasonable to disable it.

My CPU includes 16 cores, thus I can conclude that it is mostly idle, since load average for the last 1/5/15 minutes is: 1.86 / 2.26 / 2.26. Load average - over the last X minutes, the system has been handling more than Y processes competing for CPU resources on average. Most probably the most consuming processes are Browsers and Telegram Desktop.

# Task 2

1) **Traceroute** - provides a path that packets take from a local machine to the destination server, listing all intermediate hops and how long each hop takes

``traceroute google.com``:
```
traceroute to google.com (216.239.38.120), 30 hops max, 60 byte packets
 1  _gateway (192.168.0.1)  1.117 ms  1.398 ms  1.797 ms
 2  10.242.1.1 (10.242.1.1)  5.650 ms  5.762 ms  5.838 ms
 3  10.250.0.2 (10.250.0.2)  6.050 ms  6.176 ms  6.893 ms
 4  10.252.6.1 (10.252.6.1)  6.986 ms  7.082 ms  7.182 ms
 5  188.170.164.34 (188.170.164.34)  11.899 ms  11.757 ms  12.014 ms
 6  * * *
 7  * * *
 8  * * *
 9  83.169.204.117 (83.169.204.117)  17.988 ms  18.185 ms  18.610 ms
10  72.14.222.181 (72.14.222.181)  23.209 ms  23.169 ms  23.140 ms
11  172.253.75.75 (172.253.75.75)  22.496 ms 192.178.241.181 (192.178.241.181)  26.124 ms 192.178.241.51 (192.178.241.51)  18.852 ms
12  192.178.241.234 (192.178.241.234)  18.490 ms 209.85.143.20 (209.85.143.20)  19.393 ms 192.178.241.234 (192.178.241.234)  21.515 ms
13  142.251.49.78 (142.251.49.78)  33.850 ms * 209.85.249.158 (209.85.249.158)  39.025 ms
14  72.14.238.168 (72.14.238.168)  36.943 ms 108.170.235.204 (108.170.235.204)  34.366 ms 172.253.66.108 (172.253.66.108)  33.858 ms
15  142.250.56.125 (142.250.56.125)  37.383 ms 216.239.49.113 (216.239.49.113)  41.484 ms 216.239.56.113 (216.239.56.113)  34.706 ms
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  * * *
23  * * *
24  * * *
25  any-in-2678.1e100.net (216.239.38.120)  62.650 ms  59.116 ms  63.039 ms
```

#### Summary:

My router is 192.168.0.1 and a packet reaches it from my PC in less than 2ms. The next hop is 10.242.1.1 and takes about 5ms. The following raws print the following hops IP addresses and time to reach them. * * * means the hop's denying to respond. 1-3 hops are initial hops (local). 4-5 - ISP hops (12 ms -  ISP's network handles traffic efficiently). 9-14 hops are Google network (72.x.x.x IP is associated with Google's servers). 216.239.x.x IP (15 and 25 hops) are final servers with Google's domain 1e100.net. Final latency is 63ms, which is a good result for a connection to a global service. This traceroute shows a fairly efficient network path with low latency (under 63ms).

2) **Dig** - provides a DNS query for a given domain.

``dig ya.ru``
```
; <<>> DiG 9.20.1 <<>> ya.ru
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 40388
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;ya.ru.				IN	A

;; ANSWER SECTION:
ya.ru.			300	IN	A	213.180.193.56

;; Query time: 56 msec
;; SERVER: 192.168.0.1#53(192.168.0.1) (UDP)
;; WHEN: Thu Sep 19 18:44:14 MSK 2024
;; MSG SIZE  rcvd: 50
```
So, the ya.ru IP address is 213.180.193.56. It took 56msec to be completted. 'SERVER: 192.168.0.1#53(192.168.0.1) (UDP)' this is my local router and it is the DNS server. From the answer section: 'ya.ru.			300	IN	A	213.180.193.56' - router sent a packet to ya.ru and ya.ru sent back the response code - 300

#### Summary:
I can conclude that DNS resolution works very well. It is fast and efficient with low latency.