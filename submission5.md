# Task 1: Key Metrics for SRE and SLAs

## Top 3 CPU Consuming Applications
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
ubuntu      3074 16.2  9.5 4068224 167176 ?      Ssl  14:28   5:55 /usr/bin/gnome-shell
ubuntu      3653  6.2 18.4 11771628 322452 ?     Sl   14:28   2:15 /snap/firefox/4848/usr/lib/firefox/firefox
ubuntu      4256  4.2 10.4 2614616 183144 ?      Sl   14:28   1:31 /snap/firefox/4848/usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 33495 -prefMapSize 254722 -jsInitLen 234840 -parentBuildID 20240829143845 -greomni /snap/firefox/4848/usr/lib/firefox/omni.ja -appomni /snap/firefox/4848/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/4848/usr/lib/firefox/browser {5dcbc21d-107f-46ea-8bf8-37e67c61eeb8} 3653 true tab

## Top 3 Memory Consuming Applications
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
ubuntu      3653  6.2 18.5 11771580 323908 ?     Sl   14:28   2:15 /snap/firefox/4848/usr/lib/firefox/firefox
ubuntu      4256  4.1 10.4 2614596 183144 ?      Sl   14:28   1:31 /snap/firefox/4848/usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 33495 -prefMapSize 254722 -jsInitLen 234840 -parentBuildID 20240829143845 -greomni /snap/firefox/4848/usr/lib/firefox/omni.ja -appomni /snap/firefox/4848/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/4848/usr/lib/firefox/browser {5dcbc21d-107f-46ea-8bf8-37e67c61eeb8} 3653 true tab
ubuntu      3074 16.1 10.1 4068672 177704 ?      Rsl  14:28   6:00 /usr/bin/gnome-shell

## Top 3 I/O Consuming Applications
Total DISK READ:         0.00 B/s | Total DISK WRITE:         0.00 B/s
Current DISK READ:       0.00 B/s | Current DISK WRITE:       0.00 B/s
    TID  PRIO  USER     DISK READ  DISK WRITE  SWAPIN      IO    COMMAND
      1 be/4 root        0.00 B/s    0.00 B/s  ?unavailable?  init splash

## Top 3 Largest Files in /var
4,5G	/var
3,6G	/var/lib
2,9G	/var/lib/snapd
