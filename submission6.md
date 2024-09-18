# Introduction to DevOps Lab 1
## Ruslan Izmailov B22-DS-01 

### Task 1: Operating System Analysis

#### 1. Analyzing System Boot Time:
```sh 
> systemd-analyze  
Startup finished in 4.129s (firmware) + 3.206s (loader) + 1.120s (kernel) 
+ 3.469s (initrd) + 7.085s (userspace) = 19.011s 
graphical.target reached after 7.084s in userspace.
```

As _systemd-analyse blame_   produces lots of output, I have decided to put only 10 slowest and 10 fastest services
```sh
> systemd-analyze blame 
3.816s sys-devices-LNXSYSTM:00-LNXSYBUS:00-INTC6001:00-tpmrm-tpmrm0.device
3.816s dev-tpmrm0.device
3.813s dev-ttyS0.device
3.813s sys-devices-platform-serial8250-serial8250:0-serial8250:0.0-tty-ttyS0.device
3.813s dev-ttyS1.device
3.813s sys-devices-platform-serial8250-serial8250:0-serial8250:0.1-tty-ttyS1.device
3.808s sys-devices-platform-serial8250-serial8250:0-serial8250:0.2-tty-ttyS2.device
3.808s dev-ttyS2.device
3.802s sys-devices-platform-serial8250-serial8250:0-serial8250:0.3-tty-ttyS3.device
3.802s dev-ttyS3.device
.....
7ms dracut-shutdown.service
7ms docker.socket
5ms systemd-update-utmp.service
5ms systemd-sysctl.service
4ms systemd-sysusers.service
4ms systemd-user-sessions.service
3ms sys-fs-fuse-connections.mount
3ms systemd-backlight@backlight:intel_backlight.service
3ms modprobe@dm_mod.service
2ms modprobe@loop.service
```

#### 2. Check System Load and Uptime:   
```sh 
> uptime 
18:59:20 up  7:59,  2 users,  load average: 0,08, 0,33, 0,70
```

```sh
> w
 18:59:52 up  8:00,  2 users,  load average: 0,05, 0,30, 0,68
USER     TTY       LOGIN@   IDLE   JCPU   PCPU  WHAT
pc       tty1      10:59    8:00m  0.08s  0.08s /usr/bin/startplasma-wayland
pc                 10:59   10:05   0.00s  0.60s /usr/lib/systemd/systemd --users
```

It is observable that ___w___ is an extended version of uptime, as it provides more information about users. 