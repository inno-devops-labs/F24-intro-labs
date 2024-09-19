# Task 1: Key Metrics for SRE and SLAs

1) Monitor System Resources

I have used `htop` to monitor the system resources. As for the cpu usage, top 3 processes are as follows:
- Hyprland (graphic environment) ~40%
- htop (resources monitoring tool) ~3.3%
- Dataspell (ide) ~0.6%

It was a surprise to see that the cpu usage by Hyprland is high. However, I can explain it by a lot of animations on the screen.

Other processes, except of htop, take less than a percent of cpu usage. This shows that the system is idle.

As for the memory usage, top 3 processes are as follows:
- Dataspell (ide) ~18.4%
- firefox (web browser) ~4.9%
- Hyprland (graphic environment) ~1.8%

It is not surprising that dataspell is the most memory consuming app. It has to load all the graphics, projects, and spelling tools.
Firefox takes some memory for opened tabs. However, based on cpu usage, I thought that memory usage of hyprland would be higher.

As for I/O usage, there were no I/O processes. The only way I could see any changes is when I type the text in the ide.
My ide uses autosave, so it writes the changes to the disk if any.

2) Disk Space Management

For this task I have used `ncdu` instead of suggested tools because it has a better overview of the disk space usage. 
Top 3 largest directories inside /var are:
- cache
- lib
- log

While the overall the larges files inside /var are:
- /var/cache/pacman/pkg/cuda-12.6.1-1-x86_64.pkg.tar.zst
- /var/cache/pacman/pkg/cuda-12.6.0-1-x86_64.pkg.tar.zst
- /var/log/journal/1796...e/system@...00.journal (shortened)

The directory /var/cache has such a great size because of a package manager (pacman) which stores some backups of installed packages.
The /var/log directory contains the systemd jornals, they are logs from the linux system. Finally, the lib directory contains the data that programs modify as they run. In my case, there was a database from postgresql.

