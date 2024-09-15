# Task 1: Key Metrics for SRE and SLAs

## Top 3 CPU Consuming Applications
```
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
ubuntu      3074 16.2  9.5 4068224 167176 ?      Ssl  14:28   5:55 /usr/bin/gnome-shell
ubuntu      3653  6.2 18.4 11771628 322452 ?     Sl   14:28   2:15 /snap/firefox/4848/usr/lib/firefox/firefox
ubuntu      4256  4.2 10.4 2614616 183144 ?      Sl   14:28   1:31 /snap/firefox/4848/usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 33495 -prefMapSize 254722 -jsInitLen 234840 -parentBuildID 20240829143845 -greomni /snap/firefox/4848/usr/lib/firefox/omni.ja -appomni /snap/firefox/4848/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/4848/usr/lib/firefox/browser {5dcbc21d-107f-46ea-8bf8-37e67c61eeb8} 3653 true tab
```

### Analysis:
1. **GNOME Shell** is the highest CPU consumer at 16.2%. This is typical for a graphical desktop environment, especially if there are active animations or extensions.
2. **Firefox** appears twice in the top 3, with the main process using 6.2% CPU and a content process using 4.2%. This suggests heavy browser usage with multiple tabs or resource-intensive web applications.
3. The combined CPU usage of these top 3 processes is 26.6%, indicating moderate system load.

## Top 3 Memory Consuming Applications
```
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
ubuntu      3653  6.2 18.5 11771580 323908 ?     Sl   14:28   2:15 /snap/firefox/4848/usr/lib/firefox/firefox
ubuntu      4256  4.1 10.4 2614596 183144 ?      Sl   14:28   1:31 /snap/firefox/4848/usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 33495 -prefMapSize 254722 -jsInitLen 234840 -parentBuildID 20240829143845 -greomni /snap/firefox/4848/usr/lib/firefox/omni.ja -appomni /snap/firefox/4848/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/4848/usr/lib/firefox/browser {5dcbc21d-107f-46ea-8bf8-37e67c61eeb8} 3653 true tab
ubuntu      3074 16.1 10.1 4068672 177704 ?      Rsl  14:28   6:00 /usr/bin/gnome-shell
```

### Analysis:
1. **Firefox** is the top memory consumer, with its main process using 18.5% of system memory and a content process using 10.4%. This high memory usage is common for modern browsers, especially with multiple tabs open.
2. **GNOME Shell** is using 10.1% of memory, which is expected for a graphical environment.
3. The total memory consumption of these top 3 processes is 39%, which is significant and could impact system performance if memory is limited.

## Top 3 I/O Consuming Applications
```
Total DISK READ:         0.00 B/s | Total DISK WRITE:         0.00 B/s
Current DISK READ:       0.00 B/s | Current DISK WRITE:       0.00 B/s
    TID  PRIO  USER     DISK READ  DISK WRITE  SWAPIN      IO    COMMAND
      1 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  init splash
```

### Analysis:
1. At the moment of capture, there was no significant disk I/O activity.
2. The output shows zero disk read and write operations across all processes.
3. Only the init process (TID 1) is shown, but it's not performing any I/O operations.
4. This lack of I/O activity could indicate:
   - The system is in an idle state.
   - Most applications are working with data already loaded in memory.
   - The snapshot was taken during a momentary lull in I/O activity.

## Top 3 Largest Files in /var
```
4,5G	/var
3,6G	/var/lib
2,9G	/var/lib/snapd
```

### Analysis:
1. The entire `/var` directory occupies 4.5GB of disk space.
2. The `/var/lib` subdirectory is the largest, using 3.6GB. This directory typically contains variable state information for applications.
3. Within `/var/lib`, the `snapd` directory is consuming 2.9GB. This is related to the Snap package management system, which is common in Ubuntu systems.
4. Observations:
   - The `snapd` directory is taking up a significant portion of the `/var` space (about 64%).
   - This could indicate extensive use of Snap packages on the system.
   - If disk space becomes a concern, reviewing and potentially cleaning up unused Snap packages could free up space.

## Overall System Health Insights

1. **CPU Usage**: The system shows moderate CPU usage, with graphical interfaces and web browsing being the primary consumers. This is typical for a desktop environment.

2. **Memory Usage**: Memory consumption is significant, with browser processes using a large portion. This could potentially lead to performance issues if the system is under memory pressure.

3. **I/O Activity**: The lack of I/O activity at the time of measurement suggests the system was in an idle state or working primarily with in-memory data.

4. **Disk Usage**: The `/var` directory, particularly the Snap-related storage, is consuming a notable amount of disk space. This might require attention if disk space becomes limited.
