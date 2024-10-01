# TASK 1

Version of the vm box: Version 7.1.0 r164728 (Qt6.5.3)
But the UTM was used because of problems with the MacOS: Version 4.5.4 (100)
![VM Running](vm_running.png)

# TASK 2

## Processor Information
- **Tool Used:** `sysctl`
- **Command:** `sysctl -n machdep.cpu.brand_string`
- **Output:** `Apple M2 Pro`


## RAM Information
- **Tool Used:** `vm_stat` and `sysctl`
- **Command 1:** `vm_stat`
- **Output:**`Mach Virtual Memory Statistics: (page size of 16384 bytes) Pages free: 212857. Pages active: 240569. Pages inactive: 323215. Pages speculative: 45272. Pages throttled: 0. Pages wired down: 112946. Pages purgeable: 31499. "Translation faults": 670069897. Pages copy-on-write: 6787287. Pages zero filled: 374632986. Pages reactivated: 14417335. Pages purged: 9158200. File-backed pages: 392631. Anonymous pages: 216425. Pages stored in compressor: 372621. Pages occupied by compressor: 73250. Decompressions: 17749927. Compressions: 26883426. Pageins: 12206601. Pageouts: 95995. Swapins: 133049. Swapouts: 257185.`

- **Command 2:** `sysctl hw.memsize`
- **Output:** `hw.memsize: 17179869184`

This corresponds to 16 GB of RAM.

## Network Information
- **Tool Used:** `ifconfig`
- **Command:** `ifconfig`
- **Output:** `lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384 inet 127.0.0.1 netmask 0xff000000 inet6 ::1 prefixlen 128 ... en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500 ether 6c:7e:67:d1:bb:22 inet6 fe80::84f:272:33b3:4d70%en0 prefixlen 64 secured scopeid 0xf inet 10.91.49.154 netmask 0xfffff000 broadcast 10.91.63.255 ...`

- **Command for filtering inet addresses:** `ifconfig -a | grep inet`
- **Output:** `inet 127.0.0.1 netmask 0xff000000 inet6 ::1 prefixlen 128 inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 inet6 fe80::6c7e:67ff:fed1 %ap1 prefixlen 64 scopeid 0xe inet6 fe80::84f:272:33b3:4d70%en0 prefixlen 64 secured scopeid 0xf inet 10.91.49.154 netmask 0xfffff000 broadcast 10.91.63.255`


## Operating System Specifications
- **Tool Used:** `sw_vers`
- **Command:** `sw_vers`
- **Output:** `ProductName: macOS ProductVersion: 14.5 BuildVersion: 23F79`
