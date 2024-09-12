# Task 1: Configure and Use a Local Package Repository

1) I have created a local repository with the vim package
```
mkdir -p ~/local-apt-repo
cp Downloads/vim_9.0.1378-2_amd64.deb ~/local-apt-repo/
```
2) I have generated the package index
```
dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
```
3) I have added the local repository to the source list.

`sudo apt update` did not work for me, telling that it could not find the package. So I have had to change the command
```
echo "deb [trusted=yes] file:/home/user/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list
sudo apt -o APT::Sandbox::User=root update
```

4) I have verified the contents of the Packages.gz File
```
~$ zcat local-apt-repo/Packages.gz
Package: vim
Version: 2:9.0.1378-2
Architecture: amd64
...
```

```
~$ apt policy vim
vim:
  Installed: (none)
  Candidate: 2:9.1.0016-1ubuntu7.2
  Version table:
     
     ...
     
     2:9.0.1378-2 500
        500 file:/home/john/local-apt-repo ./ Packages
```
5) Finally, I have installed the package
```
sudo apt install vim
```

# Task 2: Simulate Package Installation and Identify Dependencies

For this task I have selected ranger. The simulation of installation gave me the following output:

```
~$ sudo apt-get install -s ranger
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libgc1 libhwy1t64 libid3tag0 libimlib2t64 libjxl0.7 w3m w3m-img
Suggested packages:
  atool caca-utils mediainfo | exiftool unoconv brotli cmigemo compface dict
  dict-wn dictd libsixel-bin mailcap w3m-el xsel
The following NEW packages will be installed:
  libgc1 libhwy1t64 libid3tag0 libimlib2t64 libjxl0.7 ranger w3m w3m-img
0 upgraded, 8 newly installed, 0 to remove and 8 not upgraded.
Inst libgc1 (1:8.2.6-1build1 Ubuntu:24.04/noble [amd64])
Inst libhwy1t64 (1.0.7-8.1build1 Ubuntu:24.04/noble [amd64])
Inst libid3tag0 (0.15.1b-14build1 Ubuntu:24.04/noble [amd64])
Inst libjxl0.7 (0.7.0-10.2ubuntu6 Ubuntu:24.04/noble [amd64])
Inst libimlib2t64 (1.12.1-1.1build2 Ubuntu:24.04/noble [amd64])
Inst w3m (0.5.3+git20230121-2ubuntu5 Ubuntu:24.04/noble [amd64])
Inst w3m-img (0.5.3+git20230121-2ubuntu5 Ubuntu:24.04/noble [amd64])
Inst ranger (1.9.3-5 Ubuntu:24.04/noble [all])
Conf libgc1 (1:8.2.6-1build1 Ubuntu:24.04/noble [amd64])
Conf libhwy1t64 (1.0.7-8.1build1 Ubuntu:24.04/noble [amd64])
Conf libid3tag0 (0.15.1b-14build1 Ubuntu:24.04/noble [amd64])
Conf libjxl0.7 (0.7.0-10.2ubuntu6 Ubuntu:24.04/noble [amd64])
Conf libimlib2t64 (1.12.1-1.1build2 Ubuntu:24.04/noble [amd64])
Conf w3m (0.5.3+git20230121-2ubuntu5 Ubuntu:24.04/noble [amd64])
Conf w3m-img (0.5.3+git20230121-2ubuntu5 Ubuntu:24.04/noble [amd64])
Conf ranger (1.9.3-5 Ubuntu:24.04/noble [all])
```

Here we can see that before the installation of ranger itself, several dependencies will be installed. They are:
```
libgc1
libhwy1t64
libid3tag0
libjxl0.7
libimlib2t64
w3m
w3m-img
ranger
```

# Task 3: Hold and Unhold Package Versions

1) I have installed the ranger package
2) I have hold the version of ranger by `sudo apt-mark hold ranger`
3) Check gave the following output:
```
~$ apt-mark showhold
ranger
```

4) I have unhold the version of ranger by `sudo apt-mark unhold ranger`
```
~$ sudo apt-mark unhold ranger
Canceled hold on ranger.
~$ apt-mark showhold

```