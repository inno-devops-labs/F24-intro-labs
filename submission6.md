# Task 1:  Operating System Analysis

## System Boot Time Analysis
```
Startup finished in 2.338s (kernel) + 34.229s (userspace) = 36.567s 
graphical.target reached after 34.156s in userspace
```

### Slow Services
```
30.848s plymouth-quit-wait.service
25.694s vboxadd.service
11.578s fwupd-refresh.service
 6.860s mysql.service
 4.708s snapd.seeded.service
 4.342s snapd.service
 3.710s docker.service
 2.524s networkd-dispatcher.service
 2.226s containerd.service
 2.084s NetworkManager-wait-online.service
```

## System Load and Uptime
```
 06:05:09 up  2:08,  1 user,  load average: 0,69, 0,81, 0,68
```

## Current User Sessions
```
 06:05:09 up  2:08,  1 user,  load average: 0,69, 0,81, 0,68
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
ubuntu   tty2     tty2             Сб14   15:38m  0.06s  0.06s /usr/libexec/gnome-session-binary --session=ubuntu
```

## Observations

1. The overall boot time of the system is 36.6 seconds.
2. The slowest service during boot is plymouth-quit-wait.service.
3. The current system load is relatively low, with load averages of 0.69, 0.81, and 0.68 for the last 1, 5, and 15 minutes respectively. This suggests that the system is not under significant stress and has available processing capacity.
4. The system has been up for 2 hours and 8 minutes at the time of this analysis.
5. There is currently 1 user session active, belonging to the 'ubuntu' user, who is logged in via tty2.

# Task 2:  Networking Analysis

### Traceroute of www.google.com
```
traceroute to www.google.com (64.233.165.147), 30 hops max, 60 byte packets
 1  _gateway (10.0.2.2)  0.515 ms  0.478 ms  0.466 ms
 2  * * *
 3  * * *
 4  * * *
 5  * * *
 6  * * *
 7  * * *
 8  * * *
 9  * * *
10  * * *
11  * * *
12  * * *
13  * * *
14  * * *
15  * * *
16  * * *
17  * * *
18  * * *
19  * * *
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

### DNS Lookup
```

; <<>> DiG 9.18.28-0ubuntu0.22.04.1-Ubuntu <<>> www.google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 43595
;; flags: qr rd ra; QUERY: 1, ANSWER: 6, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;www.google.com.			IN	A

;; ANSWER SECTION:
www.google.com.		167	IN	A	64.233.165.105
www.google.com.		167	IN	A	64.233.165.147
www.google.com.		167	IN	A	64.233.165.106
www.google.com.		167	IN	A	64.233.165.103
www.google.com.		167	IN	A	64.233.165.104
www.google.com.		167	IN	A	64.233.165.99

;; Query time: 0 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Sun Sep 15 06:19:25 MSK 2024
;; MSG SIZE  rcvd: 139

```

## Networking Observations

### Traceroute Analysis
1. The traceroute to www.google.com was unable to complete successfully, reaching only the first hop.
2. Only the first hop (_gateway at 10.0.2.2) responded, with a very low latency of about 0.5 ms.
3. All subsequent hops (2-30) timed out, showing asterisks (*) instead of IP addresses or latencies.
4. This result suggests that there might be a firewall or other network security measure blocking ICMP packets beyond the local gateway.

### DNS Resolution Analysis
1. The DNS lookup for www.google.com resolved to multiple IP addresses, which is typical for large websites using load balancing.
2. Six different IP addresses were returned, all in the 64.233.165.x range.
3. The query time was extremely fast at 0 msec, indicating that the result was likely cached locally.
4. The DNS server used was 127.0.0.53#53, which is typically the systemd-resolved service on Ubuntu systems.
5. The TTL (Time To Live) for these DNS records is 167 seconds, which is relatively short and allows for quick updates to Google's IP addresses.

### General Networking Insights
1. The traceroute results are unusual and may indicate network restrictions or configurations that prevent traceroute from working properly beyond the local network.
2. Despite the traceroute issues, DNS resolution is functioning correctly and efficiently.
3. Google's use of multiple IP addresses for www.google.com demonstrates their use of DNS round-robin for load balancing.
4. The local DNS resolution appears to be working very efficiently, likely due to caching.
5. Further investigation might be needed to understand why traceroute is not functioning as expected, possibly involving checking firewall settings or discussing with the network administrator.
