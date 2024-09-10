I have Manjaro distribution, and Manjaro is Arch-based system and not Debian-based like Ubuntu. Thus, I had to apply different commands to finish the tasks. Here I tried to document each step and outputs.

## Task 1

1. **Local repository:** mkdip -p ~/local-pacman-repo

2. **Binary file:** Manjaro's binary files are .pkg.tar.zst (not .deb). I downloaded file with 'htop' package through wget: `wget 'https://ftp5.gwdg.de/pub/linux/archlinux/extra/os/x86_64/htop-3.3.0-3-x86_64.pkg.tar.zst'`. I got a file: htop-3.3.0-3-x86_64.pkg.tar.zst.

3. **Package Index:** `repo-add ~/local-pacman-repo/custom.db.tar.gz ~/local-pacman-repo/*.pkg.tar.zst`. I got the following files: custom.db@, custom.db.tar.gz,  custom.files@,  custom.files.tar.gz, and htop-3.3.0-3-x86_64.pkg.tar.zst. **custom.db.tar.gz** file will allow pacman to find packages in my local repository.

4. **Local Repository addition to my sources list (pacman.conf file):** in the `/etc/pacman.conf` I added the following rows and then updated the package database:
```
[custom] 
SigLevel = Optional TrustAll
Server = file:///home/anastasia/local-pacman-repo
```
Updating:
```
sudo pacman -Syy

The output:  
 core                                                   140.5 KiB   272 KiB/s 00:01 [################################################] 100%
 extra                                                    7.9 MiB   424 KiB/s 00:19 [################################################] 100%
 community                                               29.0   B   517   B/s 00:00 [################################################] 100%
 multilib                                               142.0 KiB   367 KiB/s 00:00 [################################################] 100%
 custom                                                 730.0   B   713 KiB/s 00:00 [################################################] 100%
```

5. **Package installation:** `sudo pacman -S custom/htop`. The output demonstrated the process of installation: resolving dependencies... looking for conflicting packages... Retrieving packages... etc.

6. **Verifying:** 
    - `grep 'htop' /var/log/pacman.log` - htop is installed successfully from the custom repository:
    ```
      [2024-09-09T22:54:22+0300] [PACMAN] Running 'pacman -S custom/htop'
      [2024-09-09T22:54:24+0300] [ALPM] installed htop (3.3.0-3)
    ```
    - `pacman -Sl custom` - confirms that htop is listed as installed from the **custom** repository:

      ```custom htop 3.3.0-3 [installed]```
      
    - checking the package's metadata:
```
cat ~/local-pacman-repo/custom.db.tar.gz
_s8̧
m(t']WOTe?Y.jf[ׯaVT*$\GBJp,I4ѵ>y%уz:Tw (©H5dGD@sqyܔ#O3,C&X@yl\l-x\tW]^?7
                                                                        rƊ-Ǜ]AcqPׇ͚ 8u(YBֻ«a./K|w(wq3"r6>VIyצı7&QڈFl\Cmzh2U{~0N,Q o
:4ވSܾK[5sal["IteRZ{F
yOtO$E)FW'PcM{{b/$jQ
                     w 1cTz9HJxTCYɣçʻBnY_`0
                                           `0
                                             `0
                                               `0
                                                 _(⏎  
```


## Task 2

1. **Package choosing.** I chose git package and got information about it through pacman -Sii. According to [this wiki](https://wiki.archlinux.org/title/Pacman/Rosetta), `pacman -Sii` is an analogue to the `apt-cache showpkg`. It provides reverse dependencies, conflicting packages, required packages, etc ('Depends On', 'Optional Deps', 'Required By', 'Optional For' rows). Also, there is an option `pactree` to visualize all dependencies (-r for reversed). I cut the most of it, because the size is large (the tree is continued till independent packages), but left some to demonstrate the logic.
```pacman -Sii git```
```
Repository      : extra
Name            : git
Version         : 2.46.0-1
Description     : the fast distributed version control system
Architecture    : x86_64
URL             : https://git-scm.com/
Licenses        : GPL-2.0-only
Groups          : None
Provides        : None
Depends On      : curl  expat  perl  perl-error  perl-mailtools  openssl  pcre2  grep  shadow  zlib
Optional Deps   : tk: gitk and git gui
                  openssh: ssh transport and crypto
                  perl-libwww: git svn
                  perl-term-readkey: git svn and interactive.singlekey setting
                  perl-io-socket-ssl: git send-email TLS support
                  perl-authen-sasl: git send-email TLS support
                  perl-mediawiki-api: git mediawiki support
                  perl-datetime-format-iso8601: git mediawiki support
                  perl-lwp-protocol-https: git mediawiki https support
                  perl-cgi: gitweb (web interface) support
                  python: git svn & git p4
                  subversion: git svn
                  org.freedesktop.secrets: keyring credential helper
                  libsecret: libsecret credential helper
Required By     : ansible-lint  archlinux-repro  aurpublish  auth-tarball-from-git  bashbrew  bat-extras  cocogitto  cozy-stack
                  crosstool-ng  espup  etckeeper  flatpak-builder  forgejo  giggle  git-annex  git-branchless  git-bug  git-crypt
                  git-evtag  git-filter-repo  git-grab  git-lfs  git-repair  git-revise  git-sizer  git-smash  gitea  gitlab
                  gitlab-runner  gitlab-shell  gitolite  gitprompt-rs  gpgit  haskell-githash  hound  hub
                  kde-development-environment-meta  lazygit  libpamac  lxqt-build-tools  lxqt-build-tools-qt5  manjaro-architect
                  manjaro-architect-launcher  manjaro-arm-installer  manjaro-arm-tools  manjaro-tools-iso-git  mesonlsp  metasploit
                  profile-validate  python-gitdb  python-gitpython  python-setuptools-git  qgit  qmk  repo  shards  soft-serve  tig
                  tty-solitaire  vcsh  vim-fugitive  vim-gitgutter  vim-vital  yadm  yay
Optional For    : gettext  github-cli  goverlay  kakoune  kate  kdevelop  ktexteditor  ktexteditor5  luarocks  mediawiki  myrepos  npm
                  nvchecker  opam  pass  protonup-qt  pyenv  python-libvcs  qtcreator  reuse  zim
Conflicts With  : None
Replaces        : None
Download Size   : 6.47 MiB
Installed Size  : 28.04 MiB
Packager        : Christian Hesse <eworm@archlinux.org>
Build Date      : Mon Jul 29 23:39:15 2024
MD5 Sum         : df86c3a3b2e9ad6aade429522da6fa0e
SHA-256 Sum     : 8d0eb7ac766b19491b3dfb96e43a8a1d00d75c8e23b99194c52190da727defa8
Signatures      : 6D42BDD116E0068F
```

``pactree git``
```
git
├─curl
  ... curl's dependencies
├─expat
│ └─glibc
├─perl
│ ├─gdbm>=1.17
│ ├─db5.3
│ │ ├─gcc-libs
│ │ └─bash provides sh
│ ├─glibc
│ ├─libxcrypt
│ └─libxcrypt provides libcrypt.so=2-64
├─perl-error
│ └─perl
... etc ...
```

2. **Simulation.** Arch's pacman doesn't have a single command that exactly matches 'apt-get install -s ...', but using a combination of pactree, pacman -Si, and pacman -S can provide all required dependencies. To demonstrate simulating, I deleted some packages from yay dependencies (git), so that they could be displayed as "to be installed for yay package" (Packages row):

```
sudo pacman -S yay
resolving dependencies...
looking for conflicting packages...

Packages (4) git-2.46.0-1  perl-error-0.17029-6  perl-mailtools-2.21-8  yay-12.3.5-1

Total Download Size:    7.85 MiB
Total Installed Size:  37.49 MiB

:: Proceed with installation? [Y/n]
```

Here, for yay package, the requirement packages are:
- git-2.46.0-1
- perl-error-0.17029-6  
- perl-mailtools-2.21-8

Thus, Dependencies can be checked through "pacman -Si 'package-name'", "pacman -Sii 'package-name'", "pactree 'package-name'". Before installing a package "sudo pacman -S 'package-name'" will providee a list with all packages to be installed, and during the installation we can see 'Opptional dependencies'.


## Task 3

Manjaro doesn't have a command similar to 'sudo apt-mark hold your-package-name', but the pacman.conf can make a package keep its current state and not be changed.

1. Install the package: `sudo pacman -S nano`
2. Hold the package (through configuration file): add the package to the IgnorePkg list in /etc/pacman.conf.

```
# Pacman won't upgrade packages listed in IgnorePkg and members of IgnoreGroup
IgnorePkg   = nano
```

Now, the nano package will not be upgraded untill it is in the list. System update (`sudo pacman -Syu`) also doesn't have rights to update nano. Manual update (`sudo pacman -Sy nano`) has a warning:
```
sudo pacman -Sy nano
:: Synchronizing package databases...
 custom is up to date
 core is up to date
 extra is up to date
 community is up to date
 multilib is up to date
:: nano is in IgnorePkg/IgnoreGroup. Install anyway? [Y/n] y
resolving dependencies...
looking for conflicting packages...

Packages (1) nano-8.1-1

Total Installed Size:  2.56 MiB
Net Upgrade Size:      0.00 MiB

:: Proceed with installation? [Y/n] n
```
3. Unhold the package: Remove nano from IgnorePkg list: `# IgnorePkg   = `. The system is able to update nano during packages updating and manual update doesn't ask twice:
```
sudo pacman -Sy nano
:: Synchronizing package databases...
 custom is up to date
 core is up to date
 extra is up to date
 community is up to date
 multilib is up to date
resolving dependencies...
looking for conflicting packages...

Packages (1) nano-8.1-1

Total Installed Size:  2.56 MiB
Net Upgrade Size:      0.00 MiB

:: Proceed with installation? [Y/n]
```
