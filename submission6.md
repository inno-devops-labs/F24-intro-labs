# Operating Systems & Networking Lab

## Task 1: Operating System Analysis

### System Boot Time Analysis:
- **systemd-analyze** output:
  - Command not available on macOS.

- **systemd-analyze blame** output:
  - Command not available on macOS.

- **dmesg | grep 'boot'** output:
  - No output provided by `dmesg` on this system.

### Uptime and Load Analysis:
- **uptime** output: 18:03 up 2 days, 3:33, 2 users, load averages: 1.61 1.49 1.42
- **w** output: 18:03 up 2 days, 3:33, 2 users, load averages: 1.61 1.49 1.42 USER TTY FROM LOGIN@ IDLE WHAT arseny0304 console - Tue14 2days - arseny0304 s000 - 17:59 - w


### Observations:
- **Boot Time**: Unable to determine using `systemd-analyze` as it's unavailable on macOS.
- **System Load**: The system has been up for over 2 days, with an average load of around 1.5, indicating moderate usage.
- **Uptime**: The system has been running for more than 2 days with 2 active users.

## Task 2: Networking Analysis

### Traceroute:
- **traceroute example.com** output: traceroute to example.com (93.184.215.14), 64 hops max, 40 byte packets 1 * * * 2 * * * ... 64 * * *

- All hops timed out (`*`), indicating that the network path could not be traced successfully.

### DNS Lookup:
- **dig example.com** output: <<>> DiG 9.10.6 <<>> example.com ;; global options: +cmd ;; Got answer: ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 47767 ;; flags: qr rd ra ad; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION: ; EDNS: version: 0, flags:; udp: 1232 ;; QUESTION SECTION: ;example.com. IN A

;; ANSWER SECTION: example.com. 1904 IN A 93.184.215.14

;; Query time: 77 msec ;; SERVER: 1.1.1.1#53(1.1.1.1) ;; WHEN: Thu Sep 19 18:09:42 MSK 2024 ;; MSG SIZE rcvd: 56


### Observations:
- **Traceroute**: All hops timed out, which may indicate that the network path to `example.com` is blocked or not traceable.
- **DNS Resolution**: The DNS lookup for `example.com` was successful, resolving to IP `93.184.215.14` with a query time of 77 milliseconds.
