# Lab 6: Operating Systems & Networking Lab

## Task 1

1. **Analyze System Boot Time**:

    ```sh
    root@1kkiren:/home/ikkiren/F24-DevOps-intro-labs# systemd-analyze
    Startup finished in 335ms (userspace) 
    graphical.target reached after 331ms in userspace
    ```

    Top 3 slow services

    ```shell
    root@1kkiren:/home/ikkiren/F24-DevOps-intro-labs# systemd-analyze blame | head -n 3
    5.337s motd-news.service
    1.156s man-db.service
    1.037s apt-daily-upgrade.service
    ```

2. **Check System Load and Uptime**:

    ```shell
    root@1kkiren:/home/ikkiren/F24-DevOps-intro-labs# uptime
    04:42:36 up  6:43,  1 user,  load average: 0.00, 0.02, 0.00
    ```

    ```shell
    root@1kkiren:/home/ikkiren/F24-DevOps-intro-labs# w
    04:43:39 up  6:44,  1 user,  load average: 0.12, 0.05, 0.01
    USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
    root     pts/1    -                21:59    6:44m  0.00s  0.00s -bash
    ```

3. **Observations**:

    * **Boot Time**: The system boots quickly, but the `motd-news.service` significantly impacts the boot time. Optimizing or disabling this service could improve performance.

    * **System Load**: The system load is minimal, indicating that the system is not under heavy usage and has sufficient resources available.

    * **Uptime**: The system has been running for 5 hours approximately, with stable performance and low load averages.

## Task 2

1. **Traceroute**:

     ```shell
    root@1kkiren:/home/ikkiren/F24-DevOps-intro-labs# traceroute 1kkiren.ru
    traceroute to 1kkiren.ru (76.76.21.21), 30 hops max, 60 byte packets
    1  172.27.80.1 (172.27.80.1)  0.243 ms  0.232 ms  0.251 ms
    2  192.168.0.1 (192.168.0.1)  2.059 ms  2.740 ms  0.940 ms
    3  10.242.1.1 (10.242.1.1)  2.989 ms  3.041 ms  3.362 ms
    4  10.250.0.2 (10.250.0.2)  3.159 ms  3.253 ms  3.052 ms
    5  10.252.6.1 (10.252.6.1)  3.116 ms  3.219 ms  3.376 ms
    6  188.170.164.34 (188.170.164.34)  7.373 ms  4.463 ms  4.453 ms
    7  * * *
    8  * * *
    9  * * *
    10  83.169.204.70 (83.169.204.70)  40.844 ms 83.169.204.74 (83.169.204.74)  36.117 ms 83.169.204.70 (83.169.204.70)  37.213 ms
    11  99.83.92.124 (99.83.92.124)  37.275 ms  37.581 ms  36.476 ms
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

2. **Dig**:

    ```shell
    root@1kkiren:/home/ikkiren/F24-DevOps-intro-labs# dig 1kkiren.ru

    ; <<>> DiG 9.18.28-0ubuntu0.22.04.1-Ubuntu <<>> 1kkiren.ru
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 40061
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 4096
    ;; QUESTION SECTION:
    ;1kkiren.ru.                    IN      A

    ;; ANSWER SECTION:
    1kkiren.ru.             34      IN      A       76.76.21.21

    ;; Query time: 10 msec
    ;; SERVER: 10.255.255.254#53(10.255.255.254) (UDP)
    ;; WHEN: Thu Sep 19 04:50:09 MSK 2024
    ;; MSG SIZE  rcvd: 55
    ```

3. **Observations**:

    * **Network Path**: The network path to 1kkiren.ru includes several hops that do not respond, likely due to firewall settings or router configurations.

    * **Latency**: The initial hops show low latency, while the latency increases significantly at hop 10 and remains consistent through hop 11.

    * **DNS Resolution**: The domain 1kkiren.ru was successfully resolved, indicating that the DNS server is functioning correctly.
