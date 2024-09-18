## Task 1

1. `systemd-analyze`
1min 14.784s dev-loop10.device
     34.627s plocate-updatedb.service
     34.610s apt-daily.service
     34.529s plymouth-quit-wait.service
     21.477s apt-daily-upgrade.service
     11.061s e2scrub_reap.service
     10.140s networkd-dispatcher.service
      8.258s man-db.service
      7.772s udisks2.service
      6.895s docker.service
      6.566s containerd.service
      6.369s fwupd-refresh.service
      5.622s fwupd.service
      5.485s logrotate.service
      5.008s NetworkManager.service
      4.459s NetworkManager-wait-online.service
      4.364s polkit.service
      4.351s power-profiles-daemon.service
      4.305s dev-sda3.device
      3.626s switcheroo-control.service
      3.581s systemd-logind.service
      3.374s dev-loop8.device
      3.302s dev-loop4.device
      3.299s dev-loop5.device
      3.151s gdm.service
      3.106s gpu-manager.service
      3.018s dev-loop6.device
      2.858s dev-loop3.device
      2.735s dev-loop7.device
      2.594s apparmor.service
      2.536s dev-loop0.device
      2.435s dpkg-db-backup.service
      2.331s systemd-journal-flush.service
      2.315s grub-common.service
      2.068s rsyslog.service
      2.062s dev-loop2.device
      1.850s dev-loop9.device
      1.477s update-notifier-download.service
      1.469s dev-loop1.device
      1.366s systemd-modules-load.service
      1.355s systemd-resolved.service
      1.327s systemd-tmpfiles-setup.service
      1.095s cups.service
2. `uptime`

22:27:10 up 11:44,  1 user,  load average: 2,36, 2,35, 1,92

`w`

22:28:11 up 11:45,  1 user,  load average: 1,45, 2,10, 1,86

USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT

admin    tty2     tty2             Вт14   31:53m  0.11s  0.09s /usr/libexec/gn

3. Wow, fantastic!

## Task 2

1. `traceroute example.com`
   
1   10.0.2.2  0,004ms  0,003ms  0,011ms 

2   *  *  * 

3   *  * ^C


2. `dig example.com`

; <<>> DiG 9.18.28-0ubuntu0.22.04.1-Ubuntu <<>> example.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 65348
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;example.com.			IN	A

;; ANSWER SECTION:
example.com.		2382	IN	A	93.184.215.14

;; Query time: 0 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Wed Sep 18 22:44:04 MSK 2024
;; MSG SIZE  rcvd: 56

3. `dig example.com +short` give us: 93.184.215.14
   usefull
