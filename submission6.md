## Task 1: Operating System Analysis

1. **Analyze System Boot Time**:

`$ systemd-analyze`

```
Startup finished in 2.009s (kernel) + 6.311s (userspace) = 8.321s 
graphical.target reached after 6.293s in userspace
```


**Explanation:** the total boot time of my system was 8.321 seconds, which is the sum of the kernel time (2.009s) and the time spent in userspace (6.311s).

The graphical interface (graphical.target) was available after 6.293 seconds of userspace initialization.


`$ systemd-analyze blame`

```
4.136s NetworkManager-wait-online.service
3.241s plymouth-quit-wait.service
1.139s docker.service
 797ms dev-loop12.device
 773ms dev-loop10.device
 773ms dev-loop9.device
 772ms dev-loop8.device
 769ms dev-loop7.device
 769ms dev-loop5.device
 768ms dev-loop6.device
 768ms dev-loop4.device
 766ms dev-loop11.device
 766ms dev-loop3.device
 763ms dev-loop0.device
 758ms dev-loop2.device
 752ms dev-loop1.device
 615ms snapd.seeded.service
 504ms snapd.service
 455ms fwupd.service
 260ms containerd.service
 216ms networkd-dispatcher.service
 163ms dev-nvme0n1p2.device
 131ms ModemManager.service
```

**Explanation:** The `systemd-analyze blame` command shows how long each service took to start.
NetworkManager-wait-online.service took the most time (4.136s), followed by plymouth-quit-wait.service (3.241s), and docker.service (1.139s).

This data helps identify services that could be optimized for faster startup.


2. **Check System Load and Uptime**:

`$ uptime`

```
19:42:41 up  1:11,  1 user,  load average: 0,74, 0,91, 0,92
```

**Explanation:**
- The system has been running for 1 hour and 11 minutes (up 1:11).

- The system load averages for the last 1, 5, and 15 minutes are 0.74, 0.91, and 0.92 respectively.


`$ w`
 
```
19:42:43 up  1:11,  1 user,  load average: 0,68, 0,90, 0,92
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
kate     tty2     tty2             18:31    1:11m  0.00s  0.00s /usr/libexec/gd
```

**Explanation:**

- I am the only user logged in on this system (kate), logged in at 18:31.

- The load averages show that the system is under light load.


## Task 2: Networking Analysis


1. **Traceroute**:

`$ traceroute github.com`

```
traceroute to github.com (140.82.121.3), 30 hops max, 60 byte packets
 1  _gateway (192.168.0.1)  1.076 ms  0.994 ms  1.150 ms
 2  10.242.1.1 (10.242.1.1)  2.812 ms  2.841 ms  2.992 ms
 3  10.250.0.2 (10.250.0.2)  3.140 ms  3.127 ms  3.139 ms
 4  10.252.6.1 (10.252.6.1)  3.370 ms  3.395 ms  3.489 ms
 5  188.170.164.34 (188.170.164.34)  13.470 ms  6.521 ms  6.449 ms
 6  * * *
 7  * * *
 8  * * *
 9  * * *
10  83.169.204.82 (83.169.204.82)  41.718 ms  46.184 ms 83.169.204.78 (83.169.204.78)  41.948 ms
11  netnod-ix-ge-a-sth-1500.inter.link (194.68.123.180)  43.348 ms  44.787 ms  41.981 ms
12  r1-cph1-dk.as5405.net (94.103.180.38)  99.347 ms  97.913 ms  95.084 ms
13  r4-ber1-de.as5405.net (94.103.180.3)  61.566 ms  61.759 ms  68.024 ms
14  r3-ber1-de.as5405.net (94.103.180.2)  67.976 ms  67.955 ms  63.786 ms
15  r4-fra1-de.as5405.net (94.103.180.7)  63.221 ms  64.983 ms  59.119 ms
16  r3-fra1-de.as5405.net (94.103.180.6)  60.059 ms  60.175 ms  60.809 ms
17  r3-fra3-de.as5405.net (94.103.180.54)  64.872 ms  59.915 ms  62.378 ms
18  r1-fra3-de.as5405.net (94.103.180.24)  63.089 ms  62.423 ms  61.249 ms
19  cust-sid435.r1-fra3-de.as5405.net (45.153.82.39)  68.059 ms cust-sid436.fra3-de.as5405.net (45.153.82.37)  66.329 ms  63.298 ms
20  * * *
21  * * *
22  * * *
23  * * *
24  * * *
25  * * *
26  * * *
27  * * *
28  * * *
29  * * *
30  * * *
```

**Explanation:**

- Traceroute helps to visualize the path that packets take from one's computer to the target website (in this example, github.com). Each hop in the traceroute corresponds to a router or gateway along the path.
In my exmaple, there are 30 hopes to reach the destination.

- The average latency gradually increases as packets move further away from the local network.

- Several routers (particularly after hop 5 and 19) don’t respond to the traceroute request, which is common due to network security or configuration.

2. **Dig**:

`$ dig github.com`

```
; <<>> DiG 9.18.24-0ubuntu0.23.10.1-Ubuntu <<>> github.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 58914
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;github.com.			IN	A

;; ANSWER SECTION:
github.com.		28	IN	A	140.82.121.3

;; Query time: 15 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Sat Sep 14 11:58:41 MSK 2024
;; MSG SIZE  rcvd: 55
```

**Explanation:** 
- DiG (Domain Information Groper) is a tool used to query DNS servers. I used `dig` to find the IP address for github.com.

- The ANSWER SECTION shows that github.com resolves to the IP address 140.82.121.3.

- The Query time of 15 ms indicates the time it took for the DNS lookup to complete.

- The DNS server used for this lookup is 127.0.0.53, which suggests that a local DNS cache (typically managed by systemd-resolved on Ubuntu) handled the request.

- The result indicates a successful resolution, as shown by the status: NOERROR.