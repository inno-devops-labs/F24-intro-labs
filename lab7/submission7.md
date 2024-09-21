# Lab 7

## Task 1: VM Deployment

**VirtualBox Version**: `6.1.38`

**VM Settings**:
     -  **Memory**: 4096 MB
     - **CPU**: 4 Cores
     - **Storage**: 175 GB dynamically allocated disk.


VM version:
![image](https://github.com/user-attachments/assets/03c6c422-19f2-41d1-bcb6-800bc2e4e339)

VM settings:
![image](https://github.com/user-attachments/assets/1a17c5c9-39b6-4f47-af5d-55f0f4e6861f)
Running VM:
![image](https://github.com/user-attachments/assets/b986554a-c268-4a87-99c5-8b7cf4ec1b3b)


## Task 2: System Information Tools

### Processor Information
- **Tool**: `lscpu`
- **Command**: 
  ```bash
  lscpu
  ```
- **Output**:
  ```bash
  Architecture:             x86_64
  CPU op-mode(s):           32-bit, 64-bit
  CPU(s):                   4
  Model name:               Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
  Virtualization features:  KVM
  ```

### RAM Information
- **Tool**: `free`
- **Command**: 
  ```bash
  free -h
  ```
- **Output**:
  ```bash
               total        used        free      shared  buff/cache   available
  Mem:           3.8Gi       1.2Gi       1.2Gi        53Mi       1.5Gi       2.4Gi
  Swap:          3.8Gi          0B       3.8Gi
  ```

### Network Information
- **Tool**: `ifconfig`
- **Command**: 
  ```bash
  ifconfig
  ```
- **Output**:
  ```bash
  enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
  inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
  ```

### Operating System Specifications
- **Tool**: `lsb_release`
- **Command**: 
  ```bash
  lsb_release -a
  ```
- **Output**:
  ```bash
  Distributor ID: Ubuntu
  Description:    Ubuntu 22.04.5 LTS
  Release:        22.04
  Codename:       jammy
  ```

