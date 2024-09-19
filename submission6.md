## Task 1

### System Boot Time Analysis

```
systemd-analyze
```

**Output**

```
Startup finished in 2.746s (kernel) + 3.939s (userspace) = 6.685s
graphical.target reached after 3.537s in userspace
```

**Explanation**

Kernel takes 2.746 seconds to initialize.

Userspace includes processes that run outside of the kernel and it takes 3.939 seconds to start them.

The total boot time is 6.685 seconds.

Also, 3.537 seconds after userspace started running, the GUI was ready to use.

2. The following command gives the processes that started during the boot time sorted by the time they require to initialize.

```
systemd-analyze blame
```

**Output**

```
2min 11.861s apt-daily-upgrade.service
     41.470s apt-daily.service
      3.839s fstrim.service
      1.674s systemd-networkd-wait-online.service
      1.164s fwupd-refresh.service
       796ms fwupd.service
       761ms docker.service
       752ms dev-mapper-ubuntu\x2d\x2dvg\x2dubuntu\x2d\x2dlv.device
       698ms cloud-init-local.service
       623ms dpkg-db-backup.service
       609ms snapd.seeded.service
       555ms snapd.service
       553ms man-db.service
       538ms dev-loop8.device
       506ms dev-loop4.device
       502ms dev-loop6.device
       502ms dev-loop3.device
       497ms dev-loop5.device
       475ms dev-loop0.device
       474ms dev-loop2.device
       468ms dev-loop7.device
       437ms dev-loop1.device
       270ms networkd-dispatcher.service
       254ms update-notifier-motd.service
       240ms udisks2.service
       232ms cloud-config.service
       232ms accounts-daemon.service
       229ms cloud-init.service
       218ms apparmor.service
       184ms NetworkManager.service
       183ms ModemManager.service
       171ms polkit.service
       171ms avahi-daemon.service
       170ms power-profiles-daemon.service
       167ms cloud-final.service
       144ms systemd-udevd.service
       139ms NetworkManager-wait-online.service
       131ms switcheroo-control.service
       121ms wpa_supplicant.service
       120ms systemd-journal-flush.service
       120ms systemd-logind.service
       109ms cups.service
       102ms secureboot-db.service
       100ms snapd.apparmor.service
        87ms multipathd.service
        87ms update-notifier-download.service
        85ms packagekit.service
        83ms user@1000.service
        83ms grub-common.service
        81ms containerd.service
        72ms systemd-udev-trigger.service
        63ms teamviewerd.service
        58ms systemd-resolved.service
        58ms kerneloops.service
        57ms systemd-tmpfiles-clean.service
        56ms systemd-binfmt.service
        55ms systemd-sysctl.service
        53ms gdm.service
        52ms keyboard-setup.service
        50ms systemd-timesyncd.service
lines 38-60
       131ms switcheroo-control.service
       121ms wpa_supplicant.service
       120ms systemd-journal-flush.service
       120ms systemd-logind.service
       109ms cups.service
       102ms secureboot-db.service
       100ms snapd.apparmor.service
        87ms multipathd.service
        87ms update-notifier-download.service
        85ms packagekit.service
        83ms user@1000.service
        83ms grub-common.service
        81ms containerd.service
        72ms systemd-udev-trigger.service
        63ms teamviewerd.service
        58ms systemd-resolved.service
        58ms kerneloops.service
        57ms systemd-tmpfiles-clean.service
        56ms systemd-binfmt.service
        55ms systemd-sysctl.service
        53ms gdm.service
        52ms keyboard-setup.service
        50ms systemd-timesyncd.service
        48ms dev-hugepages.mount
        48ms dev-mqueue.mount
        47ms sys-kernel-debug.mount
        47ms sys-kernel-tracing.mount
        46ms e2scrub_reap.service
        46ms apport.service
        43ms lvm2-monitor.service
        43ms systemd-journald.service
        43ms systemd-oomd.service
        43ms modprobe@configfs.service
        43ms console-setup.service
        42ms modprobe@drm.service
        41ms kmod-static-nodes.service
        41ms ssh.service
        40ms lvm2-pvscan@252:3.service
        40ms user-runtime-dir@1000.service
        38ms upower.service
        37ms modprobe@fuse.service
        35ms snap-bare-5.mount
        35ms snap-core22-1383.mount
        33ms systemd-fsck@dev-disk-by\x2duuid-4F5C\x2d0BA7.service
        33ms systemd-fsck@dev-disk-by\x2duuid-836c93f9\x2d5916\x2d48a3\x2d9c12\x2d54eecc0c1858.service
lines 38-82
       131ms switcheroo-control.service
       121ms wpa_supplicant.service
       120ms systemd-journal-flush.service
       120ms systemd-logind.service
       109ms cups.service
       102ms secureboot-db.service
       100ms snapd.apparmor.service
        87ms multipathd.service
        87ms update-notifier-download.service
        85ms packagekit.service
        83ms user@1000.service
        83ms grub-common.service
        81ms containerd.service
        72ms systemd-udev-trigger.service
        63ms teamviewerd.service
        58ms systemd-resolved.service
        58ms kerneloops.service
        57ms systemd-tmpfiles-clean.service
        56ms systemd-binfmt.service
        55ms systemd-sysctl.service
        53ms gdm.service
        52ms keyboard-setup.service
        50ms systemd-timesyncd.service
        48ms dev-hugepages.mount
        48ms dev-mqueue.mount
        47ms sys-kernel-debug.mount
        47ms sys-kernel-tracing.mount
        46ms e2scrub_reap.service
        46ms apport.service
        43ms lvm2-monitor.service
        43ms systemd-journald.service
        43ms systemd-oomd.service
        43ms modprobe@configfs.service
        43ms console-setup.service
        42ms modprobe@drm.service
        41ms kmod-static-nodes.service
        41ms ssh.service
        40ms lvm2-pvscan@252:3.service
        40ms user-runtime-dir@1000.service
        38ms upower.service
        37ms modprobe@fuse.service
        35ms snap-bare-5.mount
lines 38-79
```

### System Loadtime and Uptime

```
uptime
```

**Output**

```
21:12:43 up 14:17,  1 user,  load average: 0.39, 0.33, 0.33
```

**Explanation**

The system is used by 1 user. It is running for 14 hours 17 minutes. The time at which the command was executed is 21:12:43. And the system has 0.39 load average (average number of processes that are waiting for CPU or I/O access) for the last 1 minute and 0.33 for both 5 minutes and 15 minutes.

Check the users of the computer and what each of them is doing.

```
w
```

**Output**

```
21:13:31 up 14:18,  1 user,  load average: 0.61, 0.39, 0.35
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
ubuntu   tty2     tty2             Sun16    3days  0.10s  0.05s /usr/libexec/gdm-wayland-session env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-s
```

**Explanation**

We can see that there is only 1 user with name `ubuntu` that runs the process `/usr/libexec/gdm-wayland-session`. Moreover, we can notice that load average values have slightly changed.

## Task 2

```
sudo apt install traceroute
```

**Output**

```
[sudo] password for ubuntu:
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  traceroute
0 upgraded, 1 newly installed, 0 to remove and 17 not upgraded.
Need to get 41.9 kB of archives.
After this operation, 150 kB of additional disk space will be used.
Get:1 http://ports.ubuntu.com/ubuntu-ports jammy/universe arm64 traceroute arm64 1:2.1.0-2 [41.9 kB]
Fetched 41.9 kB in 1s (46.6 kB/s)
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package traceroute.
(Reading database ... 209097 files and directories currently installed.)
Preparing to unpack .../traceroute_1%3a2.1.0-2_arm64.deb ...
Unpacking traceroute (1:2.1.0-2) ...
Setting up traceroute (1:2.1.0-2) ...
update-alternatives: using /usr/bin/traceroute.db to provide /usr/bin/traceroute (traceroute) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man1/traceroute.1.gz because associated file /usr/share/man/man1/traceroute.db.1.gz (of
link group traceroute) doesn't exist
update-alternatives: using /usr/bin/traceroute6.db to provide /usr/bin/traceroute6 (traceroute6) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man1/traceroute6.1.gz because associated file /usr/share/man/man1/traceroute6.db.1.gz (o
f link group traceroute6) doesn't exist
update-alternatives: using /usr/bin/lft.db to provide /usr/bin/lft (lft) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man1/lft.1.gz because associated file /usr/share/man/man1/lft.db.1.gz (of link group lft
) doesn't exist
update-alternatives: using /usr/bin/traceproto.db to provide /usr/bin/traceproto (traceproto) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man1/traceproto.1.gz because associated file /usr/share/man/man1/traceproto.db.1.gz (of
link group traceproto) doesn't exist
update-alternatives: using /usr/sbin/tcptraceroute.db to provide /usr/sbin/tcptraceroute (tcptraceroute) in auto mode
update-alternatives: warning: skip creation of /usr/share/man/man8/tcptraceroute.8.gz because associated file /usr/share/man/man8/tcptraceroute.db.8.g
z (of link group tcptraceroute) doesn't exist
Processing triggers for man-db (2.10.2-1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline
Scanning processes...
Scanning candidates...
Scanning linux images...
Pending kernel upgrade
----------------------

Newer kernel available

The currently running kernel version is 5.15.0-121-generic which is not the expected kernel version 5.15.0-122-generic.

Restarting the system to load the new kernel will not be handled automatically, so you should consider rebooting.


Restarting services...
Daemons using outdated libraries
--------------------------------

  1. avahi-daemon.service  3. gdm3                         5. NetworkManager.service  7. polkit.service               9. user@1000.service
  2. dbus.service          4. networkd-dispatcher.service  6. packagekit.service      8. unattended-upgrades.service  10. none of the above

(Enter the items or ranges you want to select, separated by spaces.)

Which services should be restarted?

Service restarts being deferred:
 systemctl restart NetworkManager.service
 systemctl restart avahi-daemon.service
 /etc/needrestart/restart.d/dbus.service
 systemctl restart gdm3.service
 systemctl restart networkd-dispatcher.service
 systemctl restart packagekit.service
 systemctl restart polkit.service
 systemctl restart unattended-upgrades.service
 systemctl restart user@1000.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
```

Traceroute shows the path that packets follow from the source point to the destination.

```
traceroute http.cat
```

**Output**

```
traceroute to http.cat (104.21.77.53), 30 hops max, 60 byte packets
 1  * _gateway (192.168.64.1)  0.328 ms  2.050 ms
 2  10.91.48.1 (10.91.48.1)  5.527 ms  3.571 ms  3.521 ms
 3  10.252.6.1 (10.252.6.1)  4.095 ms  5.135 ms  5.553 ms
 4  188.170.164.34 (188.170.164.34)  16.890 ms  16.845 ms  16.813 ms
 5  * * *
 6  * * *
 7  * * *
 8  83.169.204.124 (83.169.204.124)  54.209 ms 83.169.204.126 (83.169.204.126)  50.540 ms *
 9  * de-cix-frankfurt.as13335.net (80.81.194.180)  62.926 ms  62.840 ms
10  162.158.84.149 (162.158.84.149)  56.066 ms 162.158.84.127 (162.158.84.127)  87.863 ms  84.276 ms
11  104.21.77.53 (104.21.77.53)  57.489 ms  57.524 ms  57.504 ms
```

**Explanation**

From the output we can see that http.cat has IP address 104.21.77.53.
The packets passed through 11 hops.
Hops 5 - 7 did not respond.
Hops 1-3 belong to local network. Starting with the 4th hop IP addresses became public and latency increased compared to 1-3 hops.

```
sudo apt-get install dnsutils
```

**Output**

```
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  bind9-dnsutils
The following NEW packages will be installed:
  bind9-dnsutils dnsutils
0 upgraded, 2 newly installed, 0 to remove and 17 not upgraded.
Need to get 163 kB of archives.
After this operation, 569 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://ports.ubuntu.com/ubuntu-ports jammy-updates/main arm64 bind9-dnsutils arm64 1:9.18.28-0ubuntu0.22.04.1 [159 kB]
Get:2 http://ports.ubuntu.com/ubuntu-ports jammy-updates/universe arm64 dnsutils all 1:9.18.28-0ubuntu0.22.04.1 [3924 B]
Fetched 163 kB in 1s (169 kB/s)
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package bind9-dnsutils.
(Reading database ... 209117 files and directories currently installed.)
Preparing to unpack .../bind9-dnsutils_1%3a9.18.28-0ubuntu0.22.04.1_arm64.deb ...
Unpacking bind9-dnsutils (1:9.18.28-0ubuntu0.22.04.1) ...
Selecting previously unselected package dnsutils.
Preparing to unpack .../dnsutils_1%3a9.18.28-0ubuntu0.22.04.1_all.deb ...
Unpacking dnsutils (1:9.18.28-0ubuntu0.22.04.1) ...
Setting up bind9-dnsutils (1:9.18.28-0ubuntu0.22.04.1) ...
Setting up dnsutils (1:9.18.28-0ubuntu0.22.04.1) ...
Processing triggers for man-db (2.10.2-1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline
Scanning processes...
Scanning candidates...
Scanning linux images...
Pending kernel upgrade
----------------------

Newer kernel available

The currently running kernel version is 5.15.0-121-generic which is not the expected kernel version 5.15.0-122-generic.

Restarting the system to load the new kernel will not be handled automatically, so you should consider rebooting.


Restarting services...
Daemons using outdated libraries
--------------------------------

  1. avahi-daemon.service  3. gdm3                         5. NetworkManager.service  7. polkit.service               9. user@1000.service
  2. dbus.service          4. networkd-dispatcher.service  6. packagekit.service      8. unattended-upgrades.service  10. none of the above

(Enter the items or ranges you want to select, separated by spaces.)

Which services should be restarted?

Service restarts being deferred:
 systemctl restart NetworkManager.service
 systemctl restart avahi-daemon.service
 /etc/needrestart/restart.d/dbus.service
 systemctl restart gdm3.service
 systemctl restart networkd-dispatcher.service
 systemctl restart packagekit.service
 systemctl restart polkit.service
 systemctl restart unattended-upgrades.service
 systemctl restart user@1000.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
```

The following command is used to get the information about DNS name servers.

```
dig http.cat
```

**Output**

```
; <<>> DiG 9.18.28-0ubuntu0.22.04.1-Ubuntu <<>> http.cat
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 62748
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;http.cat.			IN	A

;; ANSWER SECTION:
http.cat.		210	IN	A	104.21.77.53
http.cat.		210	IN	A	172.67.204.170

;; Query time: 231 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Wed Sep 18 21:20:21 UTC 2024
;; MSG SIZE  rcvd: 69
```

**Explanation**

The http.cat has 2 IP addresses: 104.21.77.53 and 172.67.204.170. Both of them have 210 seconds of time-to-live.
