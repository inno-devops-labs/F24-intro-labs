## Task 1
With VertualBox version 7.1.0 r164728 (Qt6.5.3)

I've created a VM with ubuntu. For it I've allocated 25GB virtual disk; 2048MB RAM; 2cores.

![1727344278355](image/submission7/1727344278355.png)

## Task 2
**Processor information**:
```bash
lscpu
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          39 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   2
  On-line CPU(s) list:    0,1
Vendor ID:                GenuineIntel
  Model name:             Intel(R) Core(TM) i5-10210U CPU @ 1.60GHz
    CPU family:           6
    Model:                142
    Thread(s) per core:   1
    Core(s) per socket:   2
    Socket(s):            1
    Stepping:             12
    BogoMIPS:             4223.99
    Flags:                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge m
                          ca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall
                           nx rdtscp lm constant_tsc rep_good nopl xtopology non
                          stop_tsc cpuid tsc_known_freq pni pclmulqdq ssse3 cx16
                           pcid sse4_1 sse4_2 movbe popcnt aes rdrand hypervisor
                           lahf_lm abm 3dnowprefetch ibrs_enhanced fsgsbase bmi1
                           bmi2 invpcid rdseed adx clflushopt arat md_clear flus
                          h_l1d arch_capabilities
Virtualization features:
  Hypervisor vendor:      KVM
  Virtualization type:    full
Caches (sum of all):
  L1d:                    64 KiB (2 instances)
  L1i:                    64 KiB (2 instances)
  L2:                     512 KiB (2 instances)
  L3:                     12 MiB (2 instances)
NUMA:
  NUMA node(s):           1
  NUMA node0 CPU(s):      0,1
Vulnerabilities:
  Gather data sampling:   Not affected
  Itlb multihit:          KVM: Mitigation: VMX unsupported
  L1tf:                   Not affected
  Mds:                    Not affected
  Meltdown:               Not affected
  Mmio stale data:        Vulnerable: Clear CPU buffers attempted, no microcode;
                           SMT Host state unknown
  Reg file data sampling: Not affected
  Retbleed:               Mitigation; Enhanced IBRS
  Spec rstack overflow:   Not affected
  Spec store bypass:      Vulnerable
  Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointe
                          r sanitization
  Spectre v2:             Mitigation; Enhanced / Automatic IBRS; RSB filling; PB
                          RSB-eIBRS SW sequence; BHI SW loop, KVM SW loop
  Srbds:                  Unknown: Dependent on hypervisor status
  Tsx async abort:        Not affected
```

**RAM information**
```bash
free -h
               total        used        free      shared  buff/cache   available
Mem:           1,9Gi       1,1Gi       129Mi        53Mi       711Mi       642Mi
Swap:          2,6Gi       225Mi       2,4Gi
```

**Network information**

```bash
ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:16:9b:12 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s3
       valid_lft 85464sec preferred_lft 85464sec
    inet6 fd00::5f91:c1cf:9b14:c606/64 scope global temporary dynamic 
       valid_lft 86222sec preferred_lft 14222sec
    inet6 fd00::664:10a9:9b34:1fad/64 scope global dynamic mngtmpaddr noprefixroute 
       valid_lft 86222sec preferred_lft 14222sec
    inet6 fe80::fb53:451d:49f7:bbe6/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```

**Operating System Specification**
```bash
neofetch
            .-/+oossssoo+/-.               yura@yura
        :+ssssssssssssssssss+:             ---------
      -+ssssssssssssssssssyyssss+-         OS: Ubuntu 22.04.3 LTS x86_64
    .ossssssssssssssssssdMMMNysssso.       Host: VirtualBox 1.2
   /ssssssssssshdmmNNmmyNMMMMhssssss/      Kernel: 6.8.0-45-generic
  +ssssssssshmydMMMMMMMNddddyssssssss+     Uptime: 20 mins
 /sssssssshNMMMyhhyyyyhmNMMMNhssssssss/    Packages: 1682 (dpkg), 11 (snap)
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Shell: bash 5.1.16
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   Resolution: 1280x800
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   DE: GNOME 42.9
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   WM: Mutter
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   WM Theme: Adwaita
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Theme: Yaru [GTK2/3]
 /sssssssshNMMMyhhyyyyhdNMMMNhssssssss/    Icons: Yaru [GTK2/3]
  +sssssssssdmydMMMMMMMMddddyssssssss+     Terminal: gnome-terminal
   /ssssssssssshdmNNNNmyNMMMMhssssss/      CPU: Intel i5-10210U (2) @ 2.111GHz
    .ossssssssssssssssssdMMMNysssso.       GPU: 00:02.0 VMware SVGA II Adapter
      -+sssssssssssssssssyyyssss+-         Memory: 1008MiB / 1968MiB
        :+ssssssssssssssssss+:
            .-/+oossssoo+/-.
```
