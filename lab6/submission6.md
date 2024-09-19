# Lab 6

### Task 1: Operating System Analysis

**System Boot Time:**

- **Command:**
  ```bash
  systemd-analyze
  ```
- **Output:**
  ```
  Startup finished in 19.829s (kernel) + 1min 12.315s (userspace) = 1min 32.145s
  graphical.target reached after 1min 12.217s in userspace
  ```

- **Command:**
  ```bash
  systemd-analyze blame
  ```
- **Output:**
  ```
  1min 38.986s apt-daily-upgrade.service
       35.847s plymouth-quit-wait.service
       23.679s e2scrub_reap.service
       ...
  ```

**Observations:**
- The total boot time was approximately 1 minute 32 seconds, with the kernel taking around 19 seconds and userspace processes around 1 minute 12 seconds.
- The services taking the most time to start were `apt-daily-upgrade.service` (1 minute 38 seconds) and `plymouth-quit-wait.service` (35 seconds).

**System Load and Uptime:**

- **Command:**
  ```bash
  uptime
  ```
- **Output:**
  ```
  21:04:45 up 19 min, 1 user, load average: 0.82, 0.87, 1.02
  ```

- **Command:**
  ```bash
  w
  ```
- **Output:**
  ```
  21:04:48 up 19 min, 1 user, load average: 0.82, 0.87, 1.02
  USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
  mikhail  tty2     tty2             20:46   18:55   0.20s  0.19s /usr/libexec/gn
  ```

**Observations:**
- The system has been up for 19 minutes with one user logged in. The load average for the last 1, 5, and 15 minutes is relatively low, indicating minimal system load.

---

### Task 2: Networking Analysis

**Traceroute:**

- **Command:**
  ```bash
  traceroute github.com
  ```
- **Output:**
  ```
  traceroute to github.com (140.82.121.3), 64 hops max
    1   10.0.2.2  0,642ms  0,703ms  0,399ms
  ```

**Dig:**

- **Command:**
  ```bash
  dig github.com
  ```
- **Output:**
  ```
  ; <<>> DiG 9.18.28-0ubuntu0.22.04.1-Ubuntu <<>> github.com
  ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 4363
  ;; ANSWER SECTION:
  github.com.    30  IN  A  140.82.121.4
  ```

**Observations:**
- The traceroute shows a quick response with minimal latency to the first hop (10.0.2.2), likely a local gateway or router.
- The `dig` command resolves `github.com` to the IP address `140.82.121.4`, with a query time of 3 ms, indicating a fast DNS resolution.
