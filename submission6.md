# Task 1

## System Analysis

- systemd-analyze

    ```sh
    Output
    Startup finished in 4.377s (firmware) + 2.877s (loader) + 1.421s (kernel) + 12.389s (userspace) = 21.065s 
    graphical.target reached after 12.389s in userspace.
    ```

- systemd-analyze blame

    ```sh
    Output
    6.457s NetworkManager-wait-online.service
    4.065s plymouth-quit-wait.service
    2.124s systemd-timesyncd.service
    1.552s docker.service
    971ms dev-nvme0n1p6.device
    502ms systemd-update-utmp.service
    457ms systemd-udev-trigger.service
    437ms upower.service
    436ms apparmor.service
    405ms systemd-remount-fs.service
    373ms systemd-modules-load.service
    282ms systemd-tmpfiles-setup.service
    246ms modprobe@fuse.service
    ```
- uptime

    ```sh
    Output                                                               
    18:06:32 up 39 min,  1 user,  load average: 0,37, 0,55, 0,60
    ```
- systemd-analyze

    ![Alt text](image.png)

## Observation

- Total boot time 21.065 seconds
- Component loading time:
    
    - Firmware: 4.377s
    - Loader: 2.877s
    - Kernel: 1.421s
    - Userspace: 12.389s

- The slowest service:

    -  NetworkManager-wait-online.service: 6.457s
    -  plymouth-quit-wait.service: 4.065s
    -  systemd-timesyncd.service: 2.124s

- Avarage load: load values of 0.37, 0.55 and 0.60 for the last 1, 5 and 15 minutes

# Task 2

## Commands

- traceroute example.com

```sh
Output

traceroute to example.com (93.184.215.14), 30 hops max, 60 byte packets
 1  _gateway (192.168.43.1)  5.476 ms  5.402 ms  5.355 ms
 2  10.91.48.1 (10.91.48.1)  13.325 ms  23.077 ms  16.559 ms
 3  10.252.6.1 (10.252.6.1)  16.521 ms  16.482 ms  16.444 ms
 4  188.170.164.34 (188.170.164.34)  22.885 ms  26.116 ms  22.809 ms
 5  * * *
 6  * * *
 7  * * *
 8  83.169.204.70 (83.169.204.70)  143.733 ms  143.712 ms  143.689 ms
 9  war-b3-link.ip.twelve99.net (195.12.255.204)  130.782 ms  130.707 ms  130.667 ms
10  ffm-bb2-link.ip.twelve99.net (62.115.120.20)  130.581 ms  312.306 ms  312.244 ms
11  * * *
12  ash-bb2-link.ip.twelve99.net (62.115.112.242)  311.946 ms  311.930 ms  403.838 ms
13  ash-b2-link.ip.twelve99.net (62.115.123.125)  403.768 ms * ash-b2-link.ip.twelve99.net (62.115.123.123)  403.711 ms
14  62.115.175.71 (62.115.175.71)  576.266 ms  576.195 ms  576.160 ms
15  ae-65.core1.dcd.edgecastcdn.net (152.195.64.153)  499.061 ms ae-66.core1.dcd.edgecastcdn.net (152.195.65.153)  498.886 ms ae-65.core1.dcd.edgecastcdn.net (152.195.64.153)  498.828 ms
16  93.184.215.14 (93.184.215.14)  498.787 ms  494.742 ms  494.659 ms
17  93.184.215.14 (93.184.215.14)  494.598 ms  494.633 ms  494.513 ms
```

- dig example.com

```sh
Output

; <<>> DiG 9.20.1 <<>> example.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 53232
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1280
; COOKIE: 9d5c2e0ce868f1bcf488632166ec4323ba925c048528f8f2 (good)
;; QUESTION SECTION:
;example.com.                   IN      A

;; ANSWER SECTION:
example.com.            595     IN      A       93.184.215.14

;; Query time: 16 msec
;; SERVER: 192.168.43.1#53(192.168.43.1) (UDP)
;; WHEN: Thu Sep 19 18:28:35 MSK 2024
;; MSG SIZE  rcvd: 84
```

## Observation 

- traceroute

    - Shows that the request goes through 17 hops before reaching the end node (93.184.215.14)
    - Asterisks (* * *) are observed on the 5th, 6th and 7th hops, indicating packet loss
    - The response time increases significantly after 8 hops inclusive
    - From 8 to 13 hops, the request passes through the network 'twelve99.net'

- dig

    - The status of the NOERROR request indicates the successful execution of the request
    - The response time for dig is 16ms, which is significantly faster than the time specified in traceroute