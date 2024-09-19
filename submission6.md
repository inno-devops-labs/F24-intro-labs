# Operating Systems & Networking Lab

## Task 1: Operating System Analysis

### 1. Analyze System Boot Time

### Command: 
```bash
`systemd-analyze
```
### Output:
```bash
Startup finished in 8.538s (firmware) + 6.931s (loader) + 4.378s (kernel) + 9.730s (userspace) = 29.578s 
graphical.target reached after 9.715s in userspace
```
### Command:
```bash
systemd-analyze blame
```
### Output:
```bash
5.258s NetworkManager-wait-online.service
1.843s systemd-udev-settle.service
1.289s networkd-dispatcher.service
1.275s blueman-mechanism.service
1.212s docker.service
 976ms containerd.service
 970ms dev-sda4.device
 811ms ModemManager.service
 561ms setvtrgb.service
 418ms accounts-daemon.service
 403ms udisks2.service
 370ms ubuntu-system-adjustments.service
 315ms systemd-logind.service
 275ms networking.service
 268ms bluetooth.service
 238ms e2scrub_reap.service
 227ms systemd-rfkill.service
 223ms zfs-load-module.service
 221ms avahi-daemon.service
 220ms NetworkManager.service
 210ms systemd-udev-trigger.service
 205ms polkit.service
 203ms apparmor.service
 196ms keyboard-setup.service
```
### 2. Check System Load and Uptime

### Command:
```bash
uptime
```
### Output:
```bash
22:21:10 up 46 min,  1 user,  load average: 2.34, 1.11, 1.07
```
### Command:
```bash
w
```
### Output:
```bash
22:21:17 up 46 min,  1 user,  load average: 2.15, 1.09, 1.06
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
nayal    tty7     :0               21:35   46:22   2:38   0.34s cinnamon-sessio
```
### Observations:

#### 1. System Boot Time:
- The total boot time is **29.578 seconds**, with the largest time spent in **userspace (9.730 seconds)**.
- The slowest service is `NetworkManager-wait-online.service`, taking **5.258 seconds**. This service could be optimized or set to start later if network services are not immediately needed after boot.
- Other notable delays include:
  - `systemd-udev-settle.service` (**1.843 seconds**)
  - `networkd-dispatcher.service` (**1.289 seconds**)

#### 2. System Load and Uptime:
- The system has been running for **46 minutes**.
- The load averages are:
  - **2.34** (1 minute)
  - **1.11** (5 minutes)
  - **1.07** (15 minutes)
- The higher **1-minute load average** suggests recent activity, but overall, the load seems moderate and manageable.
- There is only **1 user** currently logged in.
## Task 2: Networking Analysis

### 1. Traceroute

### Command:
```bash
traceroute innopolis.university
```
### Output:
```bash
traceroute to innopolis.university (213.159.212.4), 30 hops max, 60 byte packets
 1  _gateway (10.92.4.1)  0.619 ms  0.793 ms  0.679 ms
 2  10.252.6.1 (10.252.6.1)  1.104 ms  1.027 ms  0.960 ms
 3  188.170.164.34 (188.170.164.34)  4.480 ms  9.860 ms  10.175 ms
 4  * * *
 5  * * *
 6  * * *
 7  83.169.204.64 (83.169.204.64)  16.742 ms 83.169.204.66 (83.169.204.66)  15.909 ms  16.210 ms
 8  178.178.110.29 (178.178.110.29)  15.670 ms  15.598 ms *
 9  100.105.107.26 (100.105.107.26)  15.890 ms  17.831 ms  17.732 ms
10  * * *
11  * * *
12  213.159.212.4 (213.159.212.4)  22.576 ms !X *  22.565 ms !X
```
### 2.DNS Lookup
### Command:
```bash
dig innopolis.university
```
### Output:
```bash
; <<>> DiG 9.18.18-0ubuntu0.22.04.1-Ubuntu <<>> innopolis.university
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 46004
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;innopolis.university.		IN	A

;; ANSWER SECTION:
innopolis.university.	643	IN	A	213.159.212.4

;; Query time: 0 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Thu Sep 19 22:41:37 MSK 2024
;; MSG SIZE  rcvd: 65

```
### Observations:

#### 1. Traceroute Analysis:
- **Network Route**: The traceroute to `innopolis.university` shows a total of 12 hops. Notably, hops 4 to 6 did not return any response.
- **Latency**: The overall latency is quite low, with all hops reporting under 23 milliseconds. The final hop, however, includes an `!X` flag, signaling that some traffic is being blocked.
- **Hop**: Despite a few missing responses, the path taken is direct, showing no significant delays or bottlenecks between the source and the destination.

#### 2. DNS Lookup (Dig) Analysis:
- **Domain Resolution**: The domain `innopolis.university` was successfully resolved to its corresponding IP address, `213.159.212.4`, without issues.
- **Query Speed**: The DNS lookup was completed with a query time of 0 milliseconds, indicating a fast resolution.
- **Response Integrity**: The DNS server provided a valid and error-free response, returning the correct IP address in a single query.
