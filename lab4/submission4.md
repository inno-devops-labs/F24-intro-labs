


# Local Package Repository Setup and Installation Process

## Step 1: Create a Local Repository Directory

I created a directory to hold my local repository and copied the `discord-0.0.68.deb` file into it:

```bash
mkdir -p ~/local-apt-repo
cp /home/mikhail/discord-0.0.68.deb ~/local-apt-repo/
```

## Step 2: Generate the Package Index

To create the `Packages.gz` file, I used the `dpkg-scanpackages` command to scan the directory and generate the package index:

```bash
dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
```

I also generated the unarchived `Packages` file using the same command without the gzip compression:

```bash
dpkg-scanpackages ~/local-apt-repo /dev/null > ~/local-apt-repo/Packages
```
```bash
dpkg-scanpackages: warning: Packages in archive but missing from override file:
dpkg-scanpackages: warning:   discord
dpkg-scanpackages: info: Wrote 1 entries to output Packages file.

```

## Step 3: Add the Local Repository to Sources List

To use the local repository, I added it to the sources list using the following command:

```bash
echo "deb [trusted=yes] file:/home/mikhail/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list
```

Then, I updated the package list:

```bash
sudo apt update
```

## Step 4: Verify the `Packages.gz` File

I verified the contents of the `Packages.gz` file to ensure the paths and metadata were correct:

```bash
zcat Packages.gz
```
```bash
Package: discord
Version: 0.0.68
Architecture: amd64
Maintainer: Discord Maintainer Team <native-team@discord.com>
Installed-Size: 254060
Depends: libc6, libasound2, libatomic1, libnotify4, libnspr4, libnss3, libstdc++6, libxss1, libxtst6
Recommends: libappindicator1 | libayatana-appindicator1
Filename: /home/mikhail/local-apt-repo/discord-0.0.68.deb
Size: 103057576
MD5sum: 699faa18659208f67b17976bc4e5d8a1
SHA1: ce8d693cac0407518fcab3e79ba61c75916dd25b
SHA256: 1e9cfe24913b8e8a52cc8bb6d3ef3af5f29d88ceec242ec0c256b1045665dddd
Section: net
Priority: optional
Homepage: https://discord.com
Description: Chat for Communities and Friends
 Discord is the easiest way to communicate over voice, video, and text. Chat,
 hang out, and stay close with your friends and communities.

```

The file contained the correct package name and the relative path to the `.deb` file (`./discord-0.0.68.deb`).

I also verified the repository was recognized by running:

```bash
apt policy discord
discord:
  Installed: (none)
  Candidate: 0.0.68
  Version table:
     0.0.68 500
        500 file:/home/mikhail/local-apt-repo ./ Packages

```

## Step 5: Install the Package

I attempted to install the package from the local repository:

```bash
sudo apt install discord
```

### Installation Issue

During the installation, I encountered the following error:

```
Download is performed unsandboxed as root as file '/home/mikhail/local-apt-repo//home/mikhail/local-apt-repo/discord-0.0.68.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
```

However, despite the error, the application installed successfully, and Discord worked as expected.

## Task 2: Simulate Package Installation and Identify Dependencies

### Step 1: Choose a Package

I selected the `curl` package to simulate its installation and review the dependencies. First, I ran the following command to gather information about the package:

```bash
apt-cache showpkg curl
```
```bash

Package: curl
Versions: 
7.81.0-1ubuntu1.18 (/var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages) (/var/lib/apt/lists/security.ubuntu.com_ubuntu_dists_jammy-security_main_binary-amd64_Packages)
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_binary-amd64_Packages
                  MD5: f83293d10df083ae6f7bb7d01642913c
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_binary-i386_Packages
                  MD5: f83293d10df083ae6f7bb7d01642913c
 Description Language: en
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_i18n_Translation-en
                  MD5: f83293d10df083ae6f7bb7d01642913c
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages
                  MD5: f83293d10df083ae6f7bb7d01642913c
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-i386_Packages
                  MD5: f83293d10df083ae6f7bb7d01642913c

7.81.0-1 (/var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_binary-amd64_Packages)
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_binary-amd64_Packages
                  MD5: f83293d10df083ae6f7bb7d01642913c
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_binary-i386_Packages
                  MD5: f83293d10df083ae6f7bb7d01642913c
 Description Language: en
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_i18n_Translation-en
                  MD5: f83293d10df083ae6f7bb7d01642913c
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages
                  MD5: f83293d10df083ae6f7bb7d01642913c
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-i386_Packages
                  MD5: f83293d10df083ae6f7bb7d01642913c


Reverse Depends: 
  plowshare,curl 7.24
  yt-dlp,curl
  tang-xinetd,curl
  tang,curl
  surf,curl
  stenographer-client,curl
  ncbi-entrez-direct,curl
  ncbi-entrez-direct,curl
  libsoup-3.0-tests,curl
  imagemagick-6.q16hdri,curl
  imagemagick-6.q16,curl
  curl:i386,curl
  w3m,curl
  ubuntu-wsl,curl
  ubuntu-server,curl
  spamassassin,curl
  smartmontools,curl
  ec2-instance-connect,curl
  debian-goodies,curl
  translate-shell,curl
  playonlinux,curl
  oysttyer,curl
  lutris,curl
  ec2-ami-tools,curl
  bgoffice-dict-downloader,curl
  astrometry-data-2mass-08-19,curl
  astrometry-data-2mass-07,curl
  astrometry-data-2mass-06,curl
  astrometry-data-2mass-05,curl
  astrometry-data-2mass-04,curl
  astrometry-data-2mass-03,curl
  astrometry-data-2mass-02,curl
  astrometry-data-2mass-01,curl
  astrometry-data-2mass-00,curl
  ytcc,curl
  yt-dlp,curl
  youtube-dl,curl
  yorick,curl
  wsl,curl
  wsl,curl
  wmget,curl
  winetricks,curl
  vagrant,curl
  urlextractor,curl
  umegaya,curl
  uhd-host,curl
  ubuntu-budgie-desktop,curl
  twittering-mode,curl
  trinityrnaseq,curl
  tdiary-contrib,curl
  tang-xinetd,curl
  tang,curl
  sylpheed,curl
  surfraw,curl
  surf,curl
  stenographer-client,curl
  smokeping,curl
  scamp,curl
  s3curl,curl
  ruby-build,curl
  rpki-trust-anchors,curl
  rkhunter,curl
  python3-sage,curl
  put-dns,curl
  debian-goodies,curl
  pkg-perl-tools,curl
  perlbrew,curl
  origami,curl
  openstack-debian-images-updater,curl
  openssh-known-hosts,curl
  openrefine,curl
  open-infrastructure-container-tools,curl
  opam,curl
  nix-bin,curl
  netdata-core,curl
  ncbi-entrez-direct,curl
  ncbi-entrez-direct,curl
  myrepos,curl
  monitoring-plugins-contrib,curl
  megadown,curl
  liquidsoap,curl
  libsoup2.4-tests,curl
  libsoup-3.0-tests,curl
  libhttp-tinyish-perl,curl
  libguestfs0,curl
  libbigwig0,curl
  kino,curl
  jhbuild,curl
  jenkins-debian-glue-buildenv,curl
  isenkram-cli,curl
  inxi,curl
  imagemagick-6.q16hdri,curl
  imagemagick-6.q16,curl
  ifupdown-extra,curl
  hydra,curl
  hw-probe,curl
  html2text,curl
  gwhois,curl
  guestfs-tools,curl
  groonga-httpd,curl
  google-perftools,curl
  gnupod-tools,curl
  git-remote-gcrypt,curl
  git-ftp,curl
  git-annex,curl
  ftpsync,curl
  freeipa-client,curl
  freedombox,curl
  forensics-extra,curl
  foomatic-db-engine,curl
  fnt,curl
  firehol-tools,curl
  eye,curl
  elpa-elfeed,curl
  elastichosts-utils,curl
  due,curl
  dracut-network,curl
  dracut-live,curl
  dpatch,curl
  djvulibre-bin,curl
  di-netboot-assistant,curl
  dgit,curl
  dehydrated,curl
  debmake,curl
  debian-cd,curl
  debci,curl
  dbab,curl
  cpanminus,curl
  cod-tools,curl
  clevis,curl
  clamav-unofficial-sigs,curl
  checksec,curl
  check-pgactivity,curl
  cdebootstrap-static,curl
  cairo-dock-core,curl
  cabal-install,curl
  bosixnet-webui,curl
  bosixnet-daemon,curl
  ben,curl
  bashtop,curl
  backdoor-factory,curl
  awesome-extra,curl
  astrometry.net,curl
  arno-iptables-firewall,curl
  approx,curl
  ansiweather,curl
  anc-api-tools,curl
  amazon-ec2-utils,curl
  abi-monitor,curl
  curl:i386,curl
  w3m,curl
  ubuntu-wsl,curl
  ubuntu-server,curl
  spamassassin,curl
  smartmontools,curl
  pollinate,curl
  pciutils,curl
  ieee-data,curl
  gettext,curl
  ec2-instance-connect,curl
  devscripts,curl
Dependencies: 
7.81.0-1ubuntu1.18 - libc6 (2 2.34) libcurl4 (5 7.81.0-1ubuntu1.18) zlib1g (2 1:1.1.4) curl:i386 (32 (null)) 
7.81.0-1 - libc6 (2 2.34) libcurl4 (5 7.81.0-1) zlib1g (2 1:1.1.4) curl:i386 (32 (null)) 
Provides: 
7.81.0-1ubuntu1.18 - curl:i386 (= 7.81.0-1ubuntu1.18) 
7.81.0-1 - curl:i386 (= 7.81.0-1) 
Reverse Provides: 
curl:i386 7.81.0-1ubuntu1.18 (= 7.81.0-1ubuntu1.18)
curl:i386 7.81.0-1 (= 7.81.0-1)

```

### Step 2: Simulate the Installation

To simulate the installation of `curl`, I used the `-s` flag with the `apt-get` command:

```bash
sudo apt-get install -s curl
```

### Step 3: Analyze the Output

The simulation output revealed that the installation would also include an upgrade for the `libcurl4` package. The following dependencies were identified:

- **libcurl4**: version 7.81.0-1ubuntu1.18
- **libc6**: version 2.34 or higher
- **zlib1g**: version 1:1.1.4 or higher

Here is the relevant output:

```
sudo apt-get install -s curl

Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libwpe-1.0-1 libwpebackend-fdo-1.0-1
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  libcurl4
The following NEW packages will be installed:
  curl
The following packages will be upgraded:
  libcurl4
1 upgraded, 1 newly installed, 0 to remove and 22 not upgraded.
Inst libcurl4 [7.81.0-1ubuntu1.17] (7.81.0-1ubuntu1.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
Inst curl (7.81.0-1ubuntu1.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
Conf libcurl4 (7.81.0-1ubuntu1.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
Conf curl (7.81.0-1ubuntu1.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])

```

## Task 3: Hold and Unhold Package Versions

### Step 1: Install a Package

For this task, I chose the `vim` package, which is commonly updated. To install `vim`, I used the following command:

```shell
sudo apt install vim
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libwpe-1.0-1 libwpebackend-fdo-1.0-1
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  vim-runtime
Suggested packages:
  ctags vim-doc vim-scripts
The following NEW packages will be installed:
  vim vim-runtime
0 upgraded, 2 newly installed, 0 to remove and 23 not upgraded.
Need to get 8 556 kB of archives.
After this operation, 37,6 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 vim-runtime all 2:8.2.3995-1ubuntu2.18 [6 827 kB]
Get:2 http://ru.archive.ubuntu.com/ubuntu jammy-updates/main amd64 vim amd64 2:8.2.3995-1ubuntu2.18 [1 730 kB]
Fetched 8 556 kB in 6s (1 441 kB/s)  
Selecting previously unselected package vim-runtime.
(Reading database ... 198542 files and directories currently installed.)
Preparing to unpack .../vim-runtime_2%3a8.2.3995-1ubuntu2.18_all.deb ...
Adding 'diversion of /usr/share/vim/vim82/doc/help.txt to /usr/share/vim/vim82/d
oc/help.txt.vim-tiny by vim-runtime'
Adding 'diversion of /usr/share/vim/vim82/doc/tags to /usr/share/vim/vim82/doc/t
ags.vim-tiny by vim-runtime'
Unpacking vim-runtime (2:8.2.3995-1ubuntu2.18) ...
Selecting previously unselected package vim.
Preparing to unpack .../vim_2%3a8.2.3995-1ubuntu2.18_amd64.deb ...
Unpacking vim (2:8.2.3995-1ubuntu2.18) ...
Setting up vim-runtime (2:8.2.3995-1ubuntu2.18) ...
Setting up vim (2:8.2.3995-1ubuntu2.18) ...
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/vim (vim) in a
uto mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/vimdiff (vimdi
ff) in auto mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/rvim (rvim) in
 auto mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/rview (rview) 
in auto mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/vi (vi) in aut
o mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/view (view) in
 auto mode
update-alternatives: using /usr/bin/vim.basic to provide /usr/bin/ex (ex) in aut
o mode
Processing triggers for man-db (2.10.2-1) ...
```


### Step 2: Hold the Package

To prevent the `vim` package from being upgraded in the future, I placed it on hold using `apt-mark`:

```bash
sudo apt-mark hold vim
```

The output confirmed that `vim` was set on hold:

```
vim set on hold.
```

### Step 3: Verify the Hold Status

To check the current status of held packages, I ran the following command:

```bash
apt-mark showhold
```

The output showed that `vim` was held:

```
vim
```

### Step 4: Unhold the Package

To allow the `vim` package to be upgraded again, I used the `apt-mark` command to unhold it:

```bash
sudo apt-mark unhold vim
```

The hold on `vim` was successfully canceled:

```
Canceled hold on vim.
```




