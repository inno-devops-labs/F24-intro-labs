# Task 1: Key Metrics for SRE and SLAs

### System Resources
Let's first install htop

```markdown
> sudo apt-get install htop
```
```markdown
> htop
```
Top-3 most resource intensive applications are:
- telegram(4.5%): Probably has to keep lot's of media preloaded.
- ollama (3.7%): It has a docker container with an llm running in background, so that is pretty obvious.
- chrome(3.5): Common for that specific browser, also lot's of tabs open at the moment of capture.
```markdown
iostat
```
```markdown
avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           2.86    0.03    1.43    0.16    0.00   95.52

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
loop0             0.01         0.01         0.00         0.00         17          0          0
loop1             0.04         0.88         0.00         0.00       1086          0          0
loop10            0.04         0.88         0.00         0.00       1085          0          0
loop11            0.05         0.91         0.00         0.00       1119          0          0
loop12            0.04         0.88         0.00         0.00       1084          0          0
loop13            0.05         0.89         0.00         0.00       1092          0          0
loop14            0.04         0.31         0.00         0.00        381          0          0
loop15            2.20        44.68         0.00         0.00      54872          0          0
loop16            0.04         0.87         0.00         0.00       1073          0          0
loop17            0.05         0.88         0.00         0.00       1079          0          0
loop18            0.04         0.29         0.00         0.00        358          0          0
loop19            2.39         6.65         0.00         0.00       8167          0          0
loop2             2.79       107.28         0.00         0.00     131755          0          0
loop20            0.05         0.89         0.00         0.00       1099          0          0
loop21            0.04         0.88         0.00         0.00       1085          0          0
loop22            0.05         0.89         0.00         0.00       1088          0          0
loop23            0.05         0.88         0.00         0.00       1082          0          0
loop24            0.04         0.28         0.00         0.00        347          0          0
loop25            0.04         0.31         0.00         0.00        378          0          0
loop26            0.04         0.28         0.00         0.00        348          0          0
loop27            0.08         1.60         0.00         0.00       1961          0          0
loop28            0.02         0.04         0.00         0.00         55          0          0
loop29            0.03         0.25         0.00         0.00        312          0          0
loop3             0.13         1.14         0.00         0.00       1394          0          0
loop30            0.10         1.76         0.00         0.00       2165          0          0
loop31            0.05         0.94         0.00         0.00       1160          0          0
loop32            0.05         0.87         0.00         0.00       1069          0          0
loop33            0.05         0.89         0.00         0.00       1087          0          0
loop34            3.35       120.76         0.00         0.00     148306          0          0
loop4             0.04         0.29         0.00         0.00        351          0          0
loop5             0.25         7.75         0.00         0.00       9523          0          0
loop6             0.05         0.87         0.00         0.00       1068          0          0
loop7             0.27         3.79         0.00         0.00       4655          0          0
loop8             0.05         0.88         0.00         0.00       1083          0          0
loop9             0.49         7.56         0.00         0.00       9290          0          0
nvme0n1         188.93      5796.51      4939.64         0.00    7118929    6066573          0
```

### Disk Space

```markdown
sudo du -ah /var | sort -rh | head -n 3
```
This command prints top 3 largest directories/files in /var in human readable format

```markdown
21G     /var
17G     /var/lib
6.8G    /var/lib/snapd
```
Entire /var directory occupies 21Gb of data.

/var/lib/snapd is attributed to snap: one of Ubuntu's package managers.

