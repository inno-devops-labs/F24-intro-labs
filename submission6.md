# Operating Systems & Networking Lab

## Task 1: Operating System Analysis

1. **Analyze System Boot Time**:
   - Use `systemd-analyze` to check the overall boot time and identify slow services.

     ```sh
     > systemd-analyze
     Startup finished in 3.265s (userspace)
     graphical.target reached after 3.255s in userspace
     
     > systemd-analyze blame
     2.574s snapd.service
     366ms dev-sdc.device
     261ms networkd-dispatcher.service
     200ms systemd-resolved.service
     136ms snapd.seeded.service
     114ms apport.service
     110ms systemd-udevd.service
     105ms e2scrub_reap.service
     102ms systemd-logind.service
     # Some other services, devices and mounts
     ```
     **Observations**:
     - Snapd takes the most of booting time (~79%)

2. **Check System Load and Uptime**:
   - Use `uptime` and `w` to check system load and uptime.

     ```sh
     > uptime
     13:12:40 up 2 min,  1 user,  load average: 0.17, 0.10, 0.03                                                            
     > w
     13:12:44 up 2 min,  1 user,  load average: 0.16, 0.09, 0.03
     USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
     mbred    pts/1    -                13:09    2:48   0.02s  0.01s -bash 
     ```

     **Observations**:
     - System uptime is only 2 minutes, so average load for last minute is much higher than for last 5 and 15 minutes

## Task 2: Networking Analysis

1. **Traceroute**:
   - Use the appropriate command or tool to perform a traceroute to a specified website or IP address.

     ```sh
     > traceroute youtube.com
     traceroute to youtube.com (142.250.74.110), 30 hops max, 60 byte packets
     1  DESKTOP-65R3QD9 (172.23.208.1)  0.319 ms  0.334 ms  0.437 ms
     2  10.91.48.1 (10.91.48.1)  4.102 ms  4.094 ms  4.086 ms
     3  10.252.6.1 (10.252.6.1)  3.353 ms  3.346 ms  3.338 ms
     4  188.170.164.34 (188.170.164.34)  10.793 ms  6.829 ms  6.821 ms
     5  * * *  
     6  * * * 
     7  * * *  
     8  83.169.204.115 (83.169.204.115)  17.304 ms 83.169.204.119 (83.169.204.119)  24.271 ms 83.169.204.115 (83.169.204.115)  18.122 ms
     9  72.14.222.181 (72.14.222.181)  19.506 ms  18.347 ms 178.176.152.61 (178.176.152.61)  20.264 ms
     10  209.85.253.229 (209.85.253.229)  18.396 ms * 192.178.241.119 (192.178.241.119)  18.709 ms
     11  192.178.241.148 (192.178.241.148)  21.352 ms 192.178.241.234 (192.178.241.234)  18.839 ms 192.178.241.232 (192.178.241.232)  18.832 ms
     12  142.251.79.148 (142.251.79.148)  45.126 ms 209.85.255.116 (209.85.255.116)  45.768 ms 142.250.238.14 (142.250.238.14)  117.821 ms
     13  209.85.241.44 (209.85.241.44)  40.343 ms 142.250.235.220 (142.250.235.220)  40.326 ms 108.170.227.248 (108.170.227.248)  39.630 ms
     14  142.251.250.251 (142.251.250.251)  41.267 ms 142.251.250.55 (142.251.250.55)  39.406 ms 192.178.73.203 (192.178.73.203)  42.030 ms
     15  142.251.48.39 (142.251.48.39)  48.246 ms  41.245 ms 142.251.48.41 (142.251.48.41)  44.904 ms
     16  * arn11s10-in-f14.1e100.net (142.250.74.110)  39.902 ms  41.093 ms
     ```

     **Observations**:
     - The traceroute to youtube.com shows 16 steps(hops)
     - The first few hops have low latency, but there are some hops with higher latency, especially around hop 12
     - Hops 5, 6, and 7 show no response (* * *), indicating potential network issues or packet loss - I guess connected to YouTube blocking

2. **Dig**:
   - Use the appropriate command or tool to perform a DNS lookup for a specified domain name.

     ```sh
      > dig ozon.ru
      ; <<>> DiG 9.18.18-0ubuntu0.22.04.1-Ubuntu <<>> ozon.ru
      ;; global options: +cmd
      ;; Got answer:
      ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 21238
      ;; flags: qr rd ad; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 0
      ;; WARNING: recursion requested but not available
      ;; QUESTION SECTION:
      ;ozon.ru.                       IN      A
      ;; ANSWER SECTION:
      ozon.ru.                0       IN      A       185.73.193.68
      ozon.ru.                0       IN      A       185.73.194.82
      ;; Query time: 39 msec
      ;; SERVER: 172.23.208.1#53(172.23.208.1) (UDP)
      ;; WHEN: Wed Sep 18 13:36:15 MSK 2024
      ;; MSG SIZE  rcvd: 64                                                     
     ```

     **Observations**:
     - The DNS lookup for ozon.ru returned two IP addresses: 185.73.193.68 and 185.73.194.82
     - The DNS server used for the query is 172.23.208.1