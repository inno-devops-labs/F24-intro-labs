## Task 1.1

Before I was able to use htop I had to 

Update my Ubuntu system, run: `sudo apt update && sudo apt upgrade`


Install htop on Ubuntu using apt: `sudo apt install htop`


To install the latest version of htop on Ubuntu Linux: `snap install htop`


I took an hour T.T


After all I finaly use `htop` command and get this
![Screenshot from 2024-09-17 15-14-04](https://github.com/user-attachments/assets/cce5aea9-2007-4695-8d99-2791c6335b83)
Before I was able to use `iostat` I had to 


`sudo apt-get install sysstat`


and get this
![Screenshot from 2024-09-17 15-17-03](https://github.com/user-attachments/assets/98a12586-5a8b-4b0f-baa4-ef23c8fd18b3)

So, because I have a new virtual machine I can identify and document only top 2 most consuming applications for CPU, memory, and I/O usage: firefox and terminal

### 1.2 
I used `du -h /var | sort -rh | head -n 3` command and get this output: 
```
4,2G	/var

3,5G	/var/lib

3,2G	/var/lib/snapd
```
Input `df -h  /var` give me this output:
```
Filesystem      Size  Used Avail Use% Mounted on

/dev/sda3        24G   14G  9,2G  60% /

```

