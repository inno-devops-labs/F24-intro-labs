# Operating system analysis

### System boot time
```sh
> systemd-analyze
```
```markdown
Startup finished in 8.264s (firmware) + 4.946s (loader) + 1.671s (kernel) + 9.391s (userspace) = 24.273s 
graphical.target reached after 9.366s in userspace.
```
```sh
> systemd-analyze blame
```
```markdown
5.055s plymouth-quit-wait.service
3.242s systemd-suspend.service
2.796s NetworkManager-wait-online.service
1.547s asusd.service
1.309s NetworkManager.service
1.238s boot-efi.mount
1.235s docker.service
686ms fwupd.service
...
```

As we can see, the whole system boot took 24.273 seconds.

The slowest services are:
- plumouth-quit-wait.service
- systemd-suspend.service
- NetworkManager-wait-online.service

### System load and uptime

```sh
> uptime
```

```markdown
18:57:09 up  6:24,  1 user,  load average: 0.66, 0.72, 0.58
```

```sh
> w
```
```markdown
18:57:47 up  6:24,  1 user,  load average: 0.66, 0.71, 0.58
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
udmurtps tty2     -                12:33    6:24m 10:38   0.03s /usr/libexec/gnome-session-binary --session=ubuntu
```

Based on the output, it appears that the system boot time is relatively slow, with the top three slowest services being plymouth-quit-wait.service, systemd-suspend.service, and NetworkManager-wait-online.service, contributing to a total boot time of 24.273 seconds. Additionally, the system load averages are relatively stable and moderate, indicating that the system is handling its current workload without excessive strain, with an uptime of 6 hours and 24 minutes.

# Network analysis

```sh
> sudo apt-get install traceroute
```

```sh
> traceroute wikipedia.org
```

```markdown
traceroute to wikipedia.org (185.15.59.224), 30 hops max, 60 byte packets
1  XiaoQiang (192.168.31.1)  1.623 ms  1.409 ms  1.340 ms
2  10.241.1.1 (10.241.1.1)  1.752 ms  1.656 ms  1.607 ms
3  10.250.0.2 (10.250.0.2)  2.066 ms  2.020 ms  1.972 ms
4  10.252.6.1 (10.252.6.1)  2.333 ms  10.877 ms  2.240 ms
5  188.170.164.34 (188.170.164.34)  5.565 ms  5.918 ms  5.474 ms
6  * * *
7  * * *
8  * * *
9  * * 83.169.204.124 (83.169.204.124)  74.941 ms
10  83.169.204.188 (83.169.204.188)  98.473 ms  98.338 ms  98.279 ms
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
```sh
dig wikipedia.org
```

```markdown

; <<>> DiG 9.18.28-0ubuntu0.24.04.1-Ubuntu <<>> wikipedia.org
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 63567
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;wikipedia.org.                 IN      A

;; ANSWER SECTION:
wikipedia.org.          95      IN      A       185.15.59.224

;; Query time: 1 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Thu Sep 19 19:10:19 MSK 2024
;; MSG SIZE  rcvd: 58

```
### Traceroute analysis:

- The traceroute to wikipedia.org shows a significant number of hops (up to 30) with many timeouts (*) indicating packet loss or routing issues.
- The first few hops are within the local network (192.168.31.1, 10.241.1.1, etc.) and show relatively low latency.
- The latency increases significantly after hop 5 (188.170.164.34) with a jump to around 5-6 ms.
- The traceroute appears to be incomplete, with no clear indication of reaching the final destination (wikipedia.org).

### Dig analysis:

- The DNS query for wikipedia.org resolves to an IP address of 185.15.59.224.
- The query time is very fast, at only 1 msec, indicating a responsive DNS server.
- The DNS server used is a local resolver (127.0.0.53), which is likely a caching DNS server.

Insights:

The traceroute output suggests potential network issues or packet loss between hops 5-30, which may be affecting connectivity to wikipedia.org.
The DNS resolution for wikipedia.org appears to be working correctly, with a fast query time and a valid IP address returned.