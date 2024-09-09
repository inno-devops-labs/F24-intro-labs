# Task 1: Configure and Use a Local Package Repository


I created local apt directory, downloaded VIM deb file and moved it to newely created directory.

```
$ wget http://ftp.us.debian.org/debian/pool/main/v/vim/vim_9.0.1378-2_amd64.deb
$ mkdir -p ~/local-apt-repo
$ mv vim_9.0.1404-1_amd64.deb ~/local-apt-repo/
```

Used `dpkg-scanpackages` to create a Packages file and compress it.

```
$ dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
```

Added local repository to `/etc/apt/sources.list.d`.

```
$ echo "deb [trusted=yes] file:/home/zaurall/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list
$ sudo apt update
```

After that I verified content of Packeges.gz file with it's metadata, everything was good.

```
$ zcat Packages.gz
$ apt policy vim
```

And finally I installed my package

```
$ sudo apt install vim
```


# Task 2: Simulate Package Installation and Identify Dependencies



```
$ apt-cache showpkg vim
Package: vim
Versions:
2:8.2.3995-1ubuntu2.18 (/var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages) (/var/lib/apt/lists/security.ubuntu.com_ubuntu_dists_jammy-security_main_binary-amd64_Packages)
 Description Language:
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_main_binary-amd64_Packages
                  MD5: 59e8b8f7757db8b53566d5d119872de8
 Description Language: en
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_main_i18n_Translation-en
                  MD5: 59e8b8f7757db8b53566d5d119872de8
 Description Language:
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages
                  MD5: 59e8b8f7757db8b53566d5d119872de8
 Description Language:
                 File: /var/lib/dpkg/status
                  MD5: 59e8b8f7757db8b53566d5d119872de8

2:8.2.3995-1ubuntu2.16 (/var/lib/dpkg/status)
 Description Language:
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_main_binary-amd64_Packages
                  MD5: 59e8b8f7757db8b53566d5d119872de8
 Description Language: en
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_main_i18n_Translation-en
                  MD5: 59e8b8f7757db8b53566d5d119872de8
 Description Language:
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages
                  MD5: 59e8b8f7757db8b53566d5d119872de8
 Description Language:
                 File: /var/lib/dpkg/status
                  MD5: 59e8b8f7757db8b53566d5d119872de8

2:8.2.3995-1ubuntu2 (/var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_main_binary-amd64_Packages)
 Description Language:
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_main_binary-amd64_Packages
                  MD5: 59e8b8f7757db8b53566d5d119872de8
 Description Language: en
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy_main_i18n_Translation-en
                  MD5: 59e8b8f7757db8b53566d5d119872de8
 Description Language:
                 File: /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages
                  MD5: 59e8b8f7757db8b53566d5d119872de8
 Description Language:
                 File: /var/lib/dpkg/status
                  MD5: 59e8b8f7757db8b53566d5d119872de8


Reverse Depends:
  vim-ale,vim 2:8.1.0693-2~
  vim-runtime,vim
  vim-common,vim
  ubuntu-wsl,vim
  vim-syntax-docker,vim
  vim-syntax-docker,vim
  vim-runtime,vim
  vim-common,vim
  ubuntu-wsl,vim
  ubuntu-server,vim
  exuberant-ctags,vim
  x2gothinclient-chroot,vim
  vim-voom,vim 2:8.1.0693-2~
  vim-vader,vim 2:8.1.0693-2~
  vim-tlib,vim
  vim-textobj-user,vim
  vim-tabular,vim
  vim-syntax-docker,vim
  vim-syntastic,vim
  vim-subtitles,vim 2:8.1.0693-2~
  vim-solarized,vim 2:8.1.0693-2~
  vim-snippets,vim
  vim-snipmate,vim
  vim-scripts,vim 2:8.1.0693-2~
  vim-redact-pass,vim 2:8.1.0693-2~
  vim-rails,vim
  vim-python-jedi,vim 2:8.1.0693-2~
  vim-puppet,vim 2:8.1.0693-2~
  vim-poke,vim 2:8.1.0693-2~
  vim-migemo,vim
  vim-ledger,vim 2:8.1.0693-2~
  vim-latexsuite,vim
  vim-latexsuite,vim
  vim-lastplace,vim
  vim-khuno,vim
  vim-julia,vim
  vim-icinga2,vim 2:8.1.0693-2~
  vim-gitgutter,vim 2:8.1.0693-2~
  vim-git-hub,vim 2:8.1.0693-2~
  vim-fugitive,vim
  vim-ctrlp,vim 2:8.1.0693-2~
  vim-bitbake,vim
  vim-autopep8,vim
  byobu,vim
  vim-airline-themes,vim
  vim-airline,vim
  vim-addon-mw-utils,vim
  vim-addon-manager,vim
  universal-ctags,vim
  tpp,vim
  supercollider-vim,vim
  ocaml-tools,vim
  lubuntu-desktop,vim
  libvi-quickfix-perl,vim
  imediff,vim
  halibut,vim
  gworkspace-apps-wrappers,vim
  games-python3-dev,vim
  games-c++-dev,vim
  dnsvi,vim
  debian-reference-common,vim
  cif-tools,vim
  biosyntax-vim,vim
  bikeshed,vim
  vim-runtime,vim
  vim-common,vim
  ubuntu-wsl,vim
  ubuntu-server,vim
  exuberant-ctags,vim
Dependencies:
2:8.2.3995-1ubuntu2.18 - vim-common (5 2:8.2.3995-1ubuntu2.18) vim-runtime (5 2:8.2.3995-1ubuntu2.18) libacl1 (2 2.2.23) libc6 (2 2.34) libgpm2 (2 1.20.7) libpython3.10 (2 3.10.0) libselinux1 (2 3.1~) libsodium23 (2 1.0.14) libtinfo6 (2 6) ctags (0 (null)) vim-doc (0 (null)) vim-scripts (0 (null))
2:8.2.3995-1ubuntu2.16 - vim-common (5 2:8.2.3995-1ubuntu2.16) vim-runtime (5 2:8.2.3995-1ubuntu2.16) libacl1 (2 2.2.23) libc6 (2 2.34) libgpm2 (2 1.20.7) libpython3.10 (2 3.10.0) libselinux1 (2 3.1~) libsodium23 (2 1.0.14) libtinfo6 (2 6) ctags (0 (null)) vim-doc (0 (null)) vim-scripts (0 (null))
2:8.2.3995-1ubuntu2 - vim-common (5 2:8.2.3995-1ubuntu2) vim-runtime (5 2:8.2.3995-1ubuntu2) libacl1 (2 2.2.23) libc6 (2 2.34) libgpm2 (2 1.20.7) libpython3.10 (2 3.10.0) libselinux1 (2 3.1~) libsodium23 (2 1.0.14) libtinfo6 (2 6) ctags (0 (null)) vim-doc (0 (null)) vim-scripts (0 (null))
Provides:
2:8.2.3995-1ubuntu2.18 - editor (= )
2:8.2.3995-1ubuntu2.16 - editor (= )
2:8.2.3995-1ubuntu2 - editor (= )
Reverse Provides:
vim-nox 2:8.2.3995-1ubuntu2.18 (= 2:8.2.3995-1ubuntu2.18)
vim-gtk3 2:8.2.3995-1ubuntu2.18 (= 2:8.2.3995-1ubuntu2.18)
vim-athena 2:8.2.3995-1ubuntu2.18 (= 2:8.2.3995-1ubuntu2.18)
vim-nox 2:8.2.3995-1ubuntu2 (= 2:8.2.3995-1ubuntu2)
vim-gtk3 2:8.2.3995-1ubuntu2 (= 2:8.2.3995-1ubuntu2)
vim-athena 2:8.2.3995-1ubuntu2 (= 2:8.2.3995-1ubuntu2)
```

```
$ sudo apt-get install -s vim
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  vim-common vim-runtime vim-tiny
Suggested packages:
  ctags vim-doc vim-scripts indent
The following packages will be upgraded:
  vim vim-common vim-runtime vim-tiny
4 upgraded, 0 newly installed, 0 to remove and 83 not upgraded.
Inst vim [2:8.2.3995-1ubuntu2.16] (2:8.2.3995-1ubuntu2.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64]) []
Inst vim-tiny [2:8.2.3995-1ubuntu2.16] (2:8.2.3995-1ubuntu2.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64]) []
Inst vim-runtime [2:8.2.3995-1ubuntu2.16] (2:8.2.3995-1ubuntu2.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [all]) []
Inst vim-common [2:8.2.3995-1ubuntu2.16] (2:8.2.3995-1ubuntu2.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [all])
Conf vim (2:8.2.3995-1ubuntu2.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
Conf vim-tiny (2:8.2.3995-1ubuntu2.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
Conf vim-runtime (2:8.2.3995-1ubuntu2.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [all])
Conf vim-common (2:8.2.3995-1ubuntu2.18 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [all])
```

To install **vim** package following packages are requiered:

- vim-common [2:8.2.3995-1ubuntu2.18]
- vim-runtime [2:8.2.3995-1ubuntu2.18] 
- vim-tiny [2:8.2.3995-1ubuntu2.18]

Suggested Packages (optional):

- ctags
- vim-doc
- vim-scripts
- indent

The following packages will be upgraded:

- vim [2:8.2.3995-1ubuntu2.18] 
- vim-common [2:8.2.3995-1ubuntu2.18]
- vim-runtime [2:8.2.3995-1ubuntu2.18] 
- vim-tiny [2:8.2.3995-1ubuntu2.18] 

Since I already have following packages, they will be only upgraded


# Task 3: Hold and Unhold Package Versions


1. Installing vim using `sudo apt install vim`

2. Hold the package:

```
$ sudo apt-mark hold vim
vim set on hold.
```

3. Verify the Hold Status:

```
$ apt-mark showhold
vim
```

4. Unhold the Package and verify it:

```
$ sudo apt-mark unhold vim
Canceled hold on vim.
$ apt-mark showhold
```
