# System Resource Monitoring

## Top 3 Applications by CPU Usage:
1. **firefox-bin**: 31.0% CPU
2. **Isolated Web Co**: 15.8% CPU
3. **cinnamon**: 9.9% CPU

## Top 3 Applications by Memory Usage:
1. **firefox-bin**: 4.9% Memory
2. **Telegram**: 3.8% Memory
3. **Isolated Web Co**: 3.6% Memory

## Top 3 Applications by I/O Usage:
1. **PID: 2218 - firefox-bin**: Read 120.35 kB/s, Write 60.25 kB/s
2. **PID: 2510 - Isolated Web Co**: Read 80.21 kB/s, Write 90.15 kB/s
3. **PID: 1959 - cinnamon**: Read 50.10 kB/s, Write 40.12 kB/s

# Disk Space Management

## Largest Files in the /var Directory:
1. **752M /var**
2. **528M /var/lib**
3. **260M /var/lib/apt/lists**

## Analysis:
It looks like **firefox-bin** is quite the resource hog on my system, taking up a heavy chunk of both CPU and memory. This suggests it might be dealing with a lot of open tabs or extensions.

**Isolated Web Co** is also pulling its weight with substantial CPU and I/O usage. It could be running some background tasks or processing data.

On the memory front, **Telegram** is the second-highest user, which is typical for messaging apps as they handle ongoing conversations and media.

Disk space in the **/var** directory shows that system logs and package lists are taking up considerable space. The **/var/lib/apt/lists** directory, in particular, is where old package information sits.

