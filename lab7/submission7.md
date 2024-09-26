# Task 1. VM Deployment

I did this lab tasks on my Windows 11.

1. **Virtual Box installation.**

I installed the VB platform (7.1.0) and extension pack (7.1.0) from their [official site](https://www.virtualbox.org/wiki/Downloads). Then I installed ISO image for Ubuntu Desktop [from here](https://releases.ubuntu.com/focal/) (version: Ubuntu 20.04.6 LTS (Focal Fossa)). 

2. **Virtual machine deploy.**

- First look at Virtual Box:

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/first_look.jpg" alt="CPU" width="500"/>


I dropped the extension file into the Virtual Box window.

- VM creating: I created a virtual machine and chose Ubuntu OS (20.04.6 LTS (Focal Fossa)(64-bit)):

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/os_name.jpg" alt="CPU" width="500"/>

- Custom: I'm not going to use this virtual machine as one of the main one, so I decided not to allocate too much memory and CPU resources for this. I set 4 cores, 2GB of base memory, and 10GB from the hard disk:

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/custom1.jpg" alt="CPU" width="500"/>


<img src="https://raw.githubusercontent.com/caxapb/New/main/data/custom2.jpg" alt="CPU" width="500"/>


Also, I have change the settings: set shared clipboard and drag'n'drop to be bidirectional and allocated 32 MB video memory 

- Opening:

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/opening.jpg" alt="CPU" width="500"/>


"Install Ubuntu" instead of "Try Ubuntu" to complete full installation: language choosing, minimal installation without office, games, etc., "Erase disk and install Ubuntu", location choosing, "who am i" setting (name, username, and password).

- The installation is done

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/complete_installation.jpg" alt="CPU" width="500"/>



# Task 2. System Information Tools
The following packages were installed: htop, bmon, net-tools

1. Processor, RAM, and Network Information:

    1.1 CPU details: 4 cores, 13.8% are taken by root processes, the information about hardware is listed after the 'lscpu'

    - ``htop``

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/htop_cpu.jpg" alt="CPU" width="500"/>

    - ``lscpu``

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/lscpu.jpg" alt="CPU" width="500"/>


    1.2 RAM details: top 3 the most RAM consuming processes belong to Firefox, about half of RAM is taken

    - ``htop``

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/htop_ram.jpg" alt="CPU" width="500"/>

    - ``free -h``

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/freeh.jpg" alt="CPU" width="500"/>

    
    1.3 Network details: real-time bandwidth shows, I receive more than transfer; 'ifconfig' and 'ip addr' display status of network interfaces, IP addressing information, IP version, broadcast address, etc. 
    
    - ``bmon``

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/bmon.jpg" alt="CPU" width="500"/>

    - ``ifconfig``

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/ifconfig.jpg" alt="CPU" width="500"/>

    - ``ip addr``

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/ipaddr.jpg" alt="CPU" width="500"/>



    1.4 total usage in percents: 
```    
``echo "CPU LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'% RAM free -m | awk '/Mem:/ { printf("%3.1f%%", $3/$2*100) }' HDD df -h / | awk '/\// {print $(NF-1)}'"
```
Output:
```
CPU 39% RAM 50,3% HDD 86%
```

2. Operating System Specifications:
    - ``lsb_release -a``: common info about OS (distributor, description, release)

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/lsb_release.jpg" alt="CPU" width="500"/>


    - ``cat /etc/os-release``: more info about OS (name, base (Debian), version, support url, etc.)
    
    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/os_release.jpg" alt="CPU" width="500"/>


    - ``cat /proc/version``: kernel version and the version of Linux, type of GCC compiler, linker, date and time the kernel was built, etc.

    <img src="https://raw.githubusercontent.com/caxapb/New/main/data/proc_version.jpg" alt="CPU" width="500"/>
