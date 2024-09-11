# Lab 4: Software Distribution

## Task 1

### Step 1
Create the repo's folder using `mkdir` command

### Step 2
Add `.deb` files to this folder

### Step 3
Use `dpkg-scanpackages` to create a `Packages`:

```shell
dpkg-scanpackages -m . > Packages
``` 
(from repo's folder)

Zip this file into a `Packages.gz` archive:
```shell
dpkg-scanpackages -m . | gzip > Packages.gz
```

### Step 4
Add the repo to source list:
```shell
echo "deb [trusted=yes] file:/home/yourusername/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list
```

### Step 5
Update the packages:
```shell
sudo apt update
```

### Step 6
Check the metadata:
```shell
zcat Packages.gz
apt policy your-package-name
```

### Step 7
Install the package:
```shell
sudo apt install your-package-name
```

## Task 2

```shell 
> apt-cache showpkg neofetch
Package: neofetch
Versions: 
7.1.0-4 (/var/lib/apt/lists/_home_ikkiren_local-apt-repo_._Packages) (/var/lib/dpkg/status)
 Description Language: 
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_universe_binary-amd64_Packages
                  MD5: 6b1e2c70a1a84519fc736defbe5a1220
 Description Language: en
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_universe_i18n_Translation-en
                  MD5: 6b1e2c70a1a84519fc736defbe5a1220
 Description Language: 
                 File: /var/lib/apt/lists/_home_ikkiren_local-apt-repo_._Packages
                  MD5: 6b1e2c70a1a84519fc736defbe5a1220

7.1.0-3 (/var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_universe_binary-amd64_Packages)
 Description Language: 
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_universe_binary-amd64_Packages
                  MD5: 6b1e2c70a1a84519fc736defbe5a1220
 Description Language: en
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_universe_i18n_Translation-en
                  MD5: 6b1e2c70a1a84519fc736defbe5a1220
 Description Language: 
                 File: /var/lib/apt/lists/_home_ikkiren_local-apt-repo_._Packages
                  MD5: 6b1e2c70a1a84519fc736defbe5a1220


Reverse Depends: 
  lubuntu-desktop,neofetch
  ubuntu-mate-desktop,neofetch
  ubuntu-mate-core,neofetch
Dependencies: 
7.1.0-4 - chafa (0 (null)) caca-utils (0 (null)) imagemagick (0 (null)) jp2a (0 (null)) libsixel-bin (0 (null)) w3m-img (0 (null)) pciutils (0 (null)) 
7.1.0-3 - chafa (0 (null)) caca-utils (0 (null)) imagemagick (0 (null)) jp2a (0 (null)) libsixel-bin (0 (null)) w3m-img (0 (null)) pciutils (0 (null)) 
Provides: 
7.1.0-4 - 
7.1.0-3 - 
Reverse Provides: 
```

```shell 
sudo apt-get install -s neofetch
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
neofetch is already the newest version (7.1.0-4).
The following packages were automatically installed and are no longer required:
  javascript-common libjs-jquery libjs-sphinxdoc libjs-underscore libpython3-dev libpython3.10-dev python3-dev python3-wheel python3.10-dev
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 4 not upgraded.
```

## Task 3

### Step 1
```shell 
> sudo apt install neofetch
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  javascript-common libjs-jquery libjs-sphinxdoc libjs-underscore libpython3-dev libpython3.10-dev python3-dev python3-wheel python3.10-dev
Use 'sudo apt autoremove' to remove them.
The following NEW packages will be installed:
  neofetch
0 upgraded, 1 newly installed, 0 to remove and 4 not upgraded.
Need to get 0 B/81.8 kB of archives.
After this operation, 360 kB of additional disk space will be used.
Get:1 file:/home/ikkiren/local-apt-repo ./ neofetch 7.1.0-4 [81.8 kB]
Selecting previously unselected package neofetch.
(Reading database ... 88603 files and directories currently installed.)
Preparing to unpack ..././neofetch_7.1.0-4_all.deb ...
Unpacking neofetch (7.1.0-4) ...
Setting up neofetch (7.1.0-4) ...
Processing triggers for man-db (2.10.2-1) ...
N: Download is performed unsandboxed as root as file '/home/ikkiren/local-apt-repo/./neofetch_7.1.0-4_all.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
```

### Step 2

```shell
> sudo apt-mark hold neofetch
[sudo] password for ikkiren: 
neofetch set on hold.
```

### Step 3

```shell 
> apt-mark showhold
neofetch
```

### Step 4
```shell
> sudo apt-mark unhold neofetch
Canceled hold on neofetch.
```

### Step 5

```shell 
> apt-mark showhold

```