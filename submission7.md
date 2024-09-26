# Virtualization Lab

## Task 1: VM Deployment

1. **Install VirtualBox**:
   - Download and install VirtualBox from the official [VirtualBox website](https://www.virtualbox.org/).
   - Provide the version number of VirtualBox in your report.
   
       I've downloaded Virtual Box 7.1.0

2. **Deploy a Virtual Machine**:
   - Create a new Virtual Machine (VM) using VirtualBox and choose the Ubuntu operating system.

       I've downloaded Ubuntu 24.04.1 ISO and created a VM

   - Customize the VM settings, such as the allocated memory, number of CPU cores, and network configuration.

       I've allocated 8GB RAM, 128 MB of videomemory and 4 CPU cores

       Also, I've changed hraphic controller to VBoxVGA, because the default one was showing an error while booting
   
   - Take a screenshot of the VM running and include it in your report.

       ![alt text](image.png)

## Task 2: System Information Tools

1. **Processor, RAM, and Network Information**:
   - Research and discover a suitable command-line tool for displaying processor, RAM, and network information separately.
       
       I found information about 'lshw' tool - it could be useful for this task.
   - Install the tool on your VM if needed.

       ```sh
       sudo apt-get update
       sudo apt-get install lshw
       ```
   - Use the tool to display the processor, RAM, and network information of the VM.
       ```sh
       > sudo lshw -class processor
       *-cpu                     
          product: 11th Gen Intel(R) Core(TM) i5-11400H @ 2.70GHz
          vendor: Intel Corp.
          physical id: 2
          bus info: cpu@0
          version: 6.141.1
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx rdtscp x86-64 constant_tsc rep_good nopl xtopology nonstop_tsc cpuid pni pclmulqdq ssse3 cx16 pcid sse4_1 sse4_2 movbe popcnt aes rdrand lahf_lm abm 3dnowprefetch ibrs_enhanced fsgsbase bmi1 bmi2 invpcid rdseed adx clflushopt sha_ni arat md_clear flush_l1d arch_capabilities
          configuration: microcode=4294967295

       > sudo lshw -class memory
       *-firmware                
          description: BIOS
          vendor: innotek GmbH
          physical id: 0
          version: VirtualBox
          date: 12/01/2006
          size: 128KiB
          capacity: 128KiB
          capabilities: isa pci cdboot bootselect int9keyboard int10video acpi
       *-memory
          description: System memory
          physical id: 1
          size: 8GiB
       > sudo lshw -class network
       *-network                 
          description: Ethernet interface
          product: 82540EM Gigabit Ethernet Controller
          vendor: Intel Corporation
          physical id: 3
          bus info: pci@0000:00:03.0
          logical name: enp0s3
          version: 02
          serial: 08:00:27:b1:90:45
          size: 1Gbit/s
          capacity: 1Gbit/s
          width: 32 bits
          clock: 66MHz
          capabilities: pm pcix bus_master cap_list ethernet physical tp 10bt 10bt-fd 100bt 100bt-fd 1000bt-fd autonegotiation
          configuration: autonegotiation=on broadcast=yes driver=e1000 driverversion=6.8.0-45-generic duplex=full ip=10.0.2.15 latency=64 link=yes mingnt=255 multicast=yes port=twisted pair speed=1Gbit/s
          resources: irq:19 memory:f0000000-f001ffff ioport:d010(size=8)
       ```

2. **Operating System Specifications**:
   - Research and discover a suitable command-line tool for displaying the operating system specifications.

       I found 'lsb-release' tool.
   - Install the tool on your VM if needed.

       ```sh
       sudo apt-get update
       sudo apt-get install lsb-release
       ```
   - Use the tool to display the operating system specifications of the VM.
       ```sh
       lsb_release -a
       No LSB modules are available.
       Distributor ID:	Ubuntu
       Description:	Ubuntu 24.04.1 LTS
       Release:	24.04
       Codename:	noble
       ```