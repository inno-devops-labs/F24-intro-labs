# Introduction to DevOps Lab 6
## Ruslan Izmailov B22-DS-01 

### Task 1: Operating System Analysis

#### 1. Analyzing System Boot Time:
```sh 
> systemd-analyze  
Startup finished in 4.129s (firmware) + 3.206s (loader) + 1.120s (kernel) 
+ 3.469s (initrd) + 7.085s (userspace) = 19.011s 
graphical.target reached after 7.084s in userspace.
```

As _systemd-analyse blame_   produces lots of output, I have decided to put only 10 slowest and 10 fastest services
```sh
> systemd-analyze blame 
3.816s sys-devices-LNXSYSTM:00-LNXSYBUS:00-INTC6001:00-tpmrm-tpmrm0.device
3.816s dev-tpmrm0.device
3.813s dev-ttyS0.device
3.813s sys-devices-platform-serial8250-serial8250:0-serial8250:0.0-tty-ttyS0.device
3.813s dev-ttyS1.device
3.813s sys-devices-platform-serial8250-serial8250:0-serial8250:0.1-tty-ttyS1.device
3.808s sys-devices-platform-serial8250-serial8250:0-serial8250:0.2-tty-ttyS2.device
3.808s dev-ttyS2.device
3.802s sys-devices-platform-serial8250-serial8250:0-serial8250:0.3-tty-ttyS3.device
3.802s dev-ttyS3.device
.....
7ms dracut-shutdown.service
7ms docker.socket
5ms systemd-update-utmp.service
5ms systemd-sysctl.service
4ms systemd-sysusers.service
4ms systemd-user-sessions.service
3ms sys-fs-fuse-connections.mount
3ms systemd-backlight@backlight:intel_backlight.service
3ms modprobe@dm_mod.service
2ms modprobe@loop.service
```

#### 2. Check System Load and Uptime:   
```sh 
> uptime 
18:59:20 up  7:59,  2 users,  load average: 0,08, 0,33, 0,70
```

```sh
> w
 18:59:52 up  8:00,  2 users,  load average: 0,05, 0,30, 0,68
USER     TTY       LOGIN@   IDLE   JCPU   PCPU  WHAT
pc       tty1      10:59    8:00m  0.08s  0.08s /usr/bin/startplasma-wayland
pc                 10:59   10:05   0.00s  0.60s /usr/lib/systemd/systemd --users
```

It is observable that ___w___ is an extended version of uptime, as it provides more information about users. 

### Task 2: Networking Analysis

#### 1. Traceroute:

```sh
> traceroute github.com
traceroute to github.com (140.82.121.4), 30 hops max, 60 byte packets
 1  _gateway (192.168.68.1)  1.809 ms  1.787 ms  1.781 ms
 2  10.241.1.1 (10.241.1.1)  2.863 ms  2.857 ms  2.851 ms
 3  10.250.0.2 (10.250.0.2)  4.133 ms  2.828 ms  4.124 ms
 4  10.252.6.1 (10.252.6.1)  4.125 ms  4.121 ms  4.116 ms
 5  188.170.164.34 (188.170.164.34)  14.094 ms  27.406 ms  14.084 ms
 6  * * *
 7  * * *
 8  * * *
 9  * * *
10  83.169.204.82 (83.169.204.82)  47.390 ms  45.812 ms 83.169.204.78 (83.169.204.78)  42.848 ms
11  netnod-ix-ge-a-sth-1500.inter.link (194.68.123.180)  42.839 ms netnod-ix-ge-b-sth-1500.inter.link (194.68.128.180)  47.084 ms netnod-ix-ge-a-sth-1500.inter.link (194.68.123.180)  47.055 ms
12  r1-cph1-dk.as5405.net (94.103.180.38)  72.819 ms  73.359 ms  72.123 ms
13  r4-ber1-de.as5405.net (94.103.180.3)  70.332 ms  70.276 ms  70.614 ms
14  r3-ber1-de.as5405.net (94.103.180.2)  67.786 ms  69.458 ms  79.379 ms
15  r4-fra1-de.as5405.net (94.103.180.7)  76.997 ms  69.779 ms  71.741 ms
16  r3-fra1-de.as5405.net (94.103.180.6)  115.715 ms  115.709 ms  128.711 ms
17  r3-fra3-de.as5405.net (94.103.180.54)  3491.178 ms  3457.822 ms  3457.803 ms
18  r1-fra3-de.as5405.net (94.103.180.24)  60.946 ms  59.847 ms  68.840 ms
19  cust-sid435.r1-fra3-de.as5405.net (45.153.82.39)  63.245 ms  68.711 ms  66.628 ms
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

As we can see the basic variant of this command that uses ICMP protocol did not achieved the target (github.com 140.82.121.4), it may happen due to firewalls. 

But if we use flag ___-U___, it will send the UDP packet that will achieve the required server. 

```sh 
> traceroute github.com -U  
traceroute to github.com (140.82.121.3), 30 hops max, 60 byte packets
 1  _gateway (192.168.68.1)  1.683 ms  1.653 ms  1.646 ms
 2  10.241.1.1 (10.241.1.1)  3.680 ms  3.673 ms  3.667 ms
 3  lb-140-82-121-3-fra.github.com (140.82.121.3)  3.662 ms  3.655 ms  3.648 ms
 4  lb-140-82-121-3-fra.github.com (140.82.121.3)  3.643 ms  3.637 ms  6.584 ms
 5  lb-140-82-121-3-fra.github.com (140.82.121.3)  8.773 ms  10.134 ms  8.761 ms
 6  * * *
 7  * * *
 8  lb-140-82-121-3-fra.github.com (140.82.121.3)  24.059 ms  22.500 ms  24.046 ms
 9  * * lb-140-82-121-3-fra.github.com (140.82.121.3)  24.028 ms
10  * * lb-140-82-121-3-fra.github.com (140.82.121.3)  23.722 ms
11  * * *
12  * * *
13  * * *
14  * * *
15  * * *
16  * * *
17  * * *
18  * lb-140-82-121-3-fra.github.com (140.82.121.3)  33.378 ms  23.502 ms
```

#### 2. Dig:

```sh 
> dig github.com    
; <<>> DiG 9.20.1 <<>> github.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 53703
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;github.com.                    IN      A

;; ANSWER SECTION:
github.com.             45      IN      A       140.82.121.4

;; Query time: 36 msec
;; SERVER: 1.1.1.1#53(1.1.1.1) (UDP)
;; WHEN: Wed Sep 18 19:04:39 MSK 2024
;; MSG SIZE  rcvd: 55
```

```sh
> dig github.com    
; <<>> DiG 9.20.1 <<>> github.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18717
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;github.com.                    IN      A

;; ANSWER SECTION:
github.com.             33      IN      A       140.82.121.3

;; Query time: 23 msec
;; SERVER: 1.1.1.1#53(1.1.1.1) (UDP)
;; WHEN: Wed Sep 18 19:05:13 MSK 2024
;; MSG SIZE  rcvd: 55
```

After I run this command 2 times we see that it returns 2 different ip addresses: 140.82.121.4 and 140.82.121.3. What is reasonable for such a big platform as a github. This approach is used for distributing the load to many machines. (We can also see that in task 2.1 _traceroot_ sometimes use 140.82.121.3 for github.com and sometimes 140.82.121.4, due to the same reasons).