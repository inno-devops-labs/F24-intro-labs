# VM Deployment

## VirtualBox Version
- Version: 7.0.20

## Steps for VM Deployment
1. Installed VirtualBox verYou said:sion 7.0.20 on Linux Mint 21.3.
2. Downloaded Ubuntu 22.04 ISO file from the official Ubuntu website.
3. Created a new virtual machine in VirtualBox with the following settings:
   - Name: Ubuntu VM
   - Type: Linux
   - Version: Ubuntu (64-bit)
   - Memory: 4096 MB
   - Hard Disk: 25 GB dynamically allocated
4. Configured VM settings:
   - Processor: 2 cores
   - Network: NAT
   - Storage: Ubuntu ISO attached as a virtual CD/DVD drive
5. Installed Ubuntu 22.04 on the VM.
6. Screenshot of the VM running Ubuntu:
   
   ![VM Screenshot](screen_shot.png)
# System Information Tools
## Tool/Command :
```bash
lscpu
```
## Output:
```bash
Architecture:            x86_64
CPU op-mode(s):        32-bit, 64-bit
Address sizes:         39 bits physical, 48 bits virtual
Byte Order:            Little Endian
CPU(s):                  4
On-line CPU(s) list:   0-3
Vendor ID:               GenuineIntel
Model name:            Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz
  CPU family:          6
  Model:               78
  Thread(s) per core:  2
  Core(s) per socket:  2
  Socket(s):           1
  Stepping:            3
  CPU max MHz:         3000.0000
  CPU min MHz:         400.0000
  BogoMIPS:            4999.90
  Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc
                       a cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss 
                       ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art
                       arch_perfmon pebs bts rep_good nopl xtopology nonstop_
                       tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cp
                       l vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid ss
                       e4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes 
                       xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_f
                       ault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_sh
                       adow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adj
                       ust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx sma
                       p clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dt
                       herm ida arat pln pts hwp hwp_notify hwp_act_window hwp
                       _epp md_clear flush_l1d arch_capabilities
```
## Tool/Command:
```bash
free -h
```
## Output:
```bash
               total        used        free      shared  buff/cache   available
Mem:            4,0Gi       2,1Gi       1,9Gi       781Mi       1,0Gi       3,0Gi
Swap:          2,0Gi       490Mi       1,5Gi
```
