systemd-analyze
Startup finished in 1.853s (userspace) 
graphical.target reached after 1.838s in userspace

systemd-analyze blame
907ms dev-sdc.device
893ms snapd.seeded.service
747ms networkd-dispatcher.service
734ms systemd-resolved.service
658ms snapd.service
422ms systemd-logind.service
374ms apport.service
372ms e2scrub_reap.service
170ms user@0.service
162ms rsyslog.service
149ms keyboard-setup.service
143ms systemd-udevd.service
127ms systemd-udev-trigger.service
108ms systemd-journald.service

uptime
 16:51:09 up 5 min,  1 user,  load average: 0.24, 0.37, 0.22

  w
 16:51:19 up 6 min,  1 user,  load average: 0.28, 0.38, 0.23
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/1    -                16:45    5:31   0.04s  0.03s -bash

apt install inetutils-traceroute
traceroute youtube.com
traceroute to youtube.com (173.194.220.190), 64 hops max
  1   172.30.112.1  0.498ms  0.274ms  0.324ms 
  2   192.168.31.1  1.409ms  1.334ms  1.215ms 
  3   10.248.1.1  12.476ms  4.580ms  2.197ms 
  4   10.250.0.2  2.028ms  1.769ms  1.760ms 
  5   10.252.6.1  2.324ms  1.997ms  2.216ms 
  6   188.170.164.34  9.085ms  4.952ms  4.981ms 
  7   *  *  * 

dig youtube.com

; <<>> DiG 9.18.28-0ubuntu0.22.04.1-Ubuntu <<>> youtube.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 48240
;; flags: qr rd ad; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 0
;; WARNING: recursion requested but not available

;; QUESTION SECTION:
;youtube.com.                   IN      A

;; ANSWER SECTION:
youtube.com.            0       IN      A       173.194.220.190
youtube.com.            0       IN      A       173.194.220.91
youtube.com.            0       IN      A       173.194.220.136
youtube.com.            0       IN      A       173.194.220.93

;; Query time: 10 msec
;; SERVER: 172.30.112.1#53(172.30.112.1) (UDP)
;; WHEN: Thu Sep 19 16:53:45 MSK 2024
;; MSG SIZE  rcvd: 104

