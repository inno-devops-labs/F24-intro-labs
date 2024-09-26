# Task 1

## VirtualBox Version

Version: 7.1.0
![alt text](image.png)

## Steps to deploy

- Download and install VirtualBox
- Create a new Virtual Machine with the following configurations
    - ISO: Ubuntu 64-bit, 24.04.1 LTS version
    - Memory: 8192 MB
    - CPU Cores: 4
    - Hard Disk: 20 GB(VirtualBox Disk Image type)
    - Network: NAT

![alt text](image-1.png)

# Task 2

## Processor, RAM, and Network Information

- lscpu

    Display cpu information: cores number, architecture and etc

    ```sh
    #command
    lscpu

    #output
    Architecture: x86_64
    CPU op-mode(s): 32-bit, 64-bit
    Address sizes: 48 bits physical, 48 bits virtual
    Byte Order: Little Endian
    CPU(s): 4
    On-line CPU(s) list: 0-3
    Vendor ID: AuthenticAMD
    Model name: AMD Ryzen 3 5300U with Radeon Graphics
    CPU family: 23
    Model: 104
    Thread(s) per core: 1
    Core(s) per socket: 4
    Socket(s): 1
    Stepping: 1
    BogoMIPS: 5190.08
    Flags: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge m
    ca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall
    nx mmxext fxsr_opt rdtscp lm constant_tsc rep_good no
    pl nonstop_tsc cpuid extd_apicid tsc_known_freq pni pc
    lmulqdq ssse3 cx16 sse4_1 sse4_2 movbe popcnt aes rdra
    nd hypervisor lahf_lm cmp_legacy cr8_legacy abm sse4a
    misalignsse 3dnowprefetch ssbd vmmcall fsgsbase bmi1 b
    mi2 rdseed adx clflushopt sha_ni xsaveerptr arat
    Virtualization features:
    Hypervisor vendor: KVM
    Virtualization type: full
    Caches (sum of all):
    L1d: 128 KiB (4 instances)
    L1i: 128 KiB (4 instances)
    L2: 2 MiB (4 instances)
    L3: 16 MiB (4 instances)
    NUMA:
    NUMA node(s): 1
    NUMA node0 CPU(s): 0-3
    Vulnerabilities:
    Gather data sampling: Not affected
    Itlb multihit: Not affected
    L1tf: Not affected
    Mds: Not affected
    Meltdown: Not affected
    Mmio stale data: Not affected
    Reg file data sampling: Not affected
    Retbleed: Mitigation; untrained return thunk; SMT disabled
    Spec rstack overflow: Vulnerable: Safe RET, no microcode
    Spec store bypass: Not affected
    Spectre v1: Mitigation; usercopy/swapgs barriers and __user pointe
    r sanitization
    Spectre v2: Mitigation; Retpolines; STIBP disabled; RSB filling; P
    BRSB-eIBRS Not affected; BHI Not affected
    Srbds: Not affected
    Tsx async abort: Not affected
    ```

- free

    Display the amout of free and used RAM

    ```sh
    #command
    free -h
    ```

    ![alt text](image-2.png)

- ip

    Help to manage network interface and also display information about current network connection

    ```sh
    #command
    ip a

    #output
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
            valid_lft forever preferred_lft forever
        inet6 ::1/128 scope host noprefixroute
            valid_lft forever preferred_lft forever
    2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
        link/ether 08:00:27:3b:ba:f5 brd ff:ff:ff:ff:ff:ff
        inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s3
            valid_lft 85205sec preferred_lft 85205sec
    ```

- lshw

    Display detailed information about the system hardware(CPU, RAM, Network interface and etc)

    ```sh
    #install
    sudo apt install lshw
    ```

    ```sh
    #command
    sudo lshw -sort
    ```

    ![alt text](image-3.png)

## Operating System Specifications

- uname

    Display common the system information

    ```sh
    #commnad 
    uname -a

    #output
    Linux DevOps 6.8.0-41-generic #41-Ubuntu SMP PREEMPT_DYNAMIC Fri Aug 2 20:41:06 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
    ```

- lsb_release 

    Display the system version

    ```sh
    #install
    sudo apt install lsb-release
    ```

    ```sh
    #command
    lsb_release -a

    #output
    No LSB modules are available.
    Distributor ID: Ubuntu
    Description:    Ubuntu 24.04.1 LTS
    Release:        24.04
    Codename:       noble
    ```