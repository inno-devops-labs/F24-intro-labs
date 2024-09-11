# Introduction to DevOps Lab 1
## Ruslan Izmailov B22-DS-01 

### Task 1: Configure and Use a Local Package Repository        

Suddenly, I had a lot of issues while doing this task on my host os (endeavouros), that is why I decided to try to do it on ubuntu (spoiler: worked).

#### Ubuntu setup
1) Dockerfile: 
```Dockerfile
FROM ubuntu:latest

# setup ssh server, to have more convenient access
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# set root password to connect to the container
RUN echo 'root:toor' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
``` 
2) Build image and run 
```sh
> docker build -t ubuntu-ssh .
> docker run -d -p 2222:22 --name ubuntu-ssh-container ubuntu-ssh
```
Here I am forwarding 22nd port to be able to connect to ubuntu container. 

3) Connect to the container
```sh 
> ssh root@localhost -p 2222
```

4) Prepare needed dirs
```sh
> mkdir -p Downloads     
> mkdir -p ~/local-apt-repo
```
#### Task steps          
1) Download package.
```sh
> wget http://archive.ubuntu.com/ubuntu/pool/main/v/valgrind/valgrind-dbg_3.10.1-1ubuntu3~14.5_amd64.deb -P ~/Downloads/

> mv ~/Downloads/valgrind-dbg_3.10.1-1ubuntu3\~14.5_amd64.deb ~/local-apt-repo
``` 

2) Install dpkg  (note: I do not use ___sudo___ as I am a root in the container).
```sh
> apt install dpkg
> apt-get install dpkg-dev
```

3)  Creating Packages.gz    
```sh
> dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
```

4) Add the repository to your sources.list.
```sh
> echo "deb [trusted=yes] file:/home/root/local-apt-repo ./" | tee /etc/apt/sources.list.d/local-apt-repo.list
> apt update
```
5) Verifying.
```sh
> zcat Packages.gz

Package: valgrind-dbg
Source: valgrind
Version: 1:3.10.1-1ubuntu3~14.5
Architecture: amd64
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Installed-Size: 312454
Depends: valgrind (= 1:3.10.1-1ubuntu3~14.5)
Filename: /root/local-apt-repo/valgrind-dbg_3.10.1-1ubuntu3~14.5_amd64.deb
Size: 72522130
MD5sum: 3492c8b3b8653e48d2a4d71fc8dd130c
SHA1: 0f8d3ae523564eb924edafd20974b8c34b154da4
SHA256: 48cd8c33d4e5081754c545b8b818e634d441ab8675c357b48aff2e69b6c3bbee
Section: debug
Priority: extra
Homepage: http://www.valgrind.org/
Description: instrumentation framework for building dynamic analysis tools (debug)
 Valgrind is a system for debugging and profiling Linux programs. With its tool
 suite you can automatically detect many memory management and threading bugs,
 avoiding hours of frustrating bug-hunting and making your programs more stable.
 You can also perform detailed profiling to help speed up your programs and use
 Valgrind to build new tools.
 .
 This package provides the debug symbols for valgrind's tools and libraries.
Original-Maintainer: Alessandro Ghedini <ghedo@debian.org>

```
```sh
> apt policy valgrind

valgrind:
  Installed: (none)
  Candidate: 1:3.22.0-0ubuntu3
  Version table:
     1:3.22.0-0ubuntu3 500
        500 http://archive.ubuntu.com/ubuntu noble/main amd64 Packages
```

6) Package installation & check that installed.
```sh
> apt install valgrind

> valgrind
valgrind: no program specified
valgrind: Use --help for more information.
```
### Task 2: Simulate Package Installation and Identify Dependencies
Package to test: __htop__

```sh
> apt-cache showpkg htop                
Package: htop
Versions: 
3.3.0-4build1 (/var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_noble_main_binary-amd64_Packages.lz4)
 Description Language: 
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_noble_main_binary-amd64_Packages.lz4
                  MD5: 8eb5aa19b3c92a975dc78e2165f6688d


Reverse Depends: 
  ubuntu-server,htop
  far2l,htop
  ubuntu-server,htop
  ubuntu-mate-desktop,htop
  ubuntu-mate-core,htop
  ubuntu-budgie-desktop-minimal,htop
  ubuntu-budgie-desktop,htop
  lubuntu-desktop,htop
  hollywood,htop
  freedombox,htop
  far2l,htop
Dependencies: 
3.3.0-4build1 - libc6 (2 2.38) libncursesw6 (2 6) libnl-3-200 (2 3.2.7) libnl-genl-3-200 (2 3.2.7) libtinfo6 (2 6) lm-sensors (0 (null)) lsof (0 (null)) strace (0 (null)) 
Provides: 
3.3.0-4build1 - 
Reverse Provides:       
```

```sh
> apt-get install -s htop

Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libnl-3-200 libnl-genl-3-200
Suggested packages:
  lm-sensors lsof strace
The following NEW packages will be installed:
  htop libnl-3-200 libnl-genl-3-200
0 upgraded, 3 newly installed, 0 to remove and 14 not upgraded.
Inst libnl-3-200 (3.7.0-0.3build1 Ubuntu:24.04/noble [amd64])
Inst libnl-genl-3-200 (3.7.0-0.3build1 Ubuntu:24.04/noble [amd64])
Inst htop (3.3.0-4build1 Ubuntu:24.04/noble [amd64])
Conf libnl-3-200 (3.7.0-0.3build1 Ubuntu:24.04/noble [amd64])
Conf libnl-genl-3-200 (3.7.0-0.3build1 Ubuntu:24.04/noble [amd64])
Conf htop (3.3.0-4build1 Ubuntu:24.04/noble [amd64])
```

##### Dependencies: 
* libnl-3-200 (3.7.0-0.3build1 Ubuntu:24.04/noble [amd64])
* libnl-genl-3-200 (3.7.0-0.3build1 Ubuntu:24.04/noble [amd64])
