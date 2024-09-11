# Task 1

## Setup and installation process

1. Created a local repository:
   
   ```sh
   mkdir -p ~/local-apt-repo
   cp /home/vboxuser/Downloads/google-chrome-stable_current_amd64.deb ~/local-apt-repo/
   ```

2. Generated the package index:
   
   ```sh
   dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
   ```

3. Added the local repository to my sources List:
   
   ```sh
   echo "deb [trusted=yes] file:/home/vboxuser/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list
   sudo apt update
   ```
      
   Output:
   
   deb [trusted=yes] file:/home/vboxuser/local-apt-repo ./
   
   Get:1 file:/home/vboxuser/local-apt-repo ./ InRelease
   Ign:1 file:/home/vboxuser/local-apt-repo ./ InRelease
   Get:2 file:/home/vboxuser/local-apt-repo ./ Release
   Ign:2 file:/home/vboxuser/local-apt-repo ./ Release
   Get:3 file:/home/vboxuser/local-apt-repo ./ Packages
   Ign:3 file:/home/vboxuser/local-apt-repo ./ Packages
   Get:4 file:/home/vboxuser/local-apt-repo ./ Translation-en
   Ign:4 file:/home/vboxuser/local-apt-repo ./ Translation-en
   ....
   Reading package lists... Done

5. Verified the contents of the packages.gz file:
   
   ```sh
   zcat Packages.gz
   ```
   
   Output:
   ```
   Package: google-chrome-stable
   Version: 118.0.5993.117-1
   Architecture: amd64
   Maintainer: Chrome Linux Team <chromium-dev@chromium.org>
   Installed-Size: 327426
   Pre-Depends: dpkg (>= 1.14.0)
   Depends: ca-certificates, fonts-liberation, libasound2 (>= 1.0.17), libatk-bridge2.0-0 (>= 2.5.3), libatk1.0-0 (>= 2.2.0), libatspi2.0-0 (>= 2.9.90), libc6 (>= 2.17), libcairo2 (>= 1.6.0), libcups2 (>= 1.6.0), libcurl3-gnutls | libcurl3-nss | libcurl4 | libcurl3, libdbus-1-3 (>= 1.9.14), libdrm2 (>= 2.4.75), libexpat1 (>= 2.1~beta3), libgbm1 (>= 17.1.0~rc2), libglib2.0-0 (>= 2.39.4), libgtk-3-0 (>= 3.9.10) | libgtk-4-1, libnspr4 (>= 2:4.9-2~), libnss3 (>= 2:3.35), libpango-1.0-0 (>= 1.14.0), libu2f-udev, libvulkan1, libx11-6 (>= 2:1.4.99.1), libxcb1 (>= 1.9.2), libxcomposite1 (>= 1:0.4.4-1), libxdamage1 (>= 1:1.1), libxext6, libxfixes3, libxkbcommon0 (>= 0.5.0), libxrandr2, wget, xdg-utils (>= 1.0.2)
   Provides: www-browser
   Filename: /home/vboxuser/local-apt-repo/google-chrome-stable_current_amd64.deb
   Size: 104057764
   MD5sum: 0cc37c06852e848260f3496af13c3b7b
   SHA1: 78b9ef2c3592e4e0569543085675cf9798380f43
   SHA256: 449732200d1375759193e2b61957074afe0e4aae5ce98ec89d46e56a8deebac7
   Section: web
   Priority: optional
   Description: The web browser from Google
   Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier.
   ```
   
6. Checked the repository of my package:
   
   ```sh
   apt policy google-chrome-stable
   ```
   
   Output:
   ```
   google-chrome-stable:
  Installed: 118.0.5993.117-1
  Candidate: 128.0.6613.119-1
  Version table:
     128.0.6613.119-1 500
        500 https://dl.google.com/linux/chrome/deb stable/main amd64 Packages
 *** 118.0.5993.117-1 100
        100 /var/lib/dpkg/status
   ```

8. Installed a package from the local repository:
    
   ```sh
   sudo apt install google-chrome-stable
   ```

# Task 2
- I selected the package `git` for the simulation

1. ```sh
   apt-cache showpkg git
   ```

   1 of outputs example:
   ```
   Package: git
   Versions:
   1:2.34.1-1ubuntu1.11 (/var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages) (/var/lib/apt/lists/security.ubuntu.com_ubuntu_dists_jammy-security_main_binary-amd64_Packages)
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_binary-amd64_Packages
                  MD5: c1f968556452a190fe359bffd151c012
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_binary-i386_Packages
                  MD5: c1f968556452a190fe359bffd151c012
 Description Language: en_GB
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_i18n_Translation-en%5fGB
                  MD5: c1f968556452a190fe359bffd151c012
 Description Language: en
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy_main_i18n_Translation-en
                  MD5: c1f968556452a190fe359bffd151c012
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-amd64_Packages
                  MD5: c1f968556452a190fe359bffd151c012
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_jammy-updates_main_binary-i386_Packages
                  MD5: c1f968556452a190fe359bffd151c012
 Description Language: 
                 File: /var/lib/dpkg/status
                  MD5: c1f968556452a190fe359bffd151c012

   Reverse Depends: 
  repo,git 1:2.28.0
  libdpkg-perl,git
  docker.io,git
  libdpkg-perl,git
  hugo,git
  hub,git
  golang-1.22-go,git
  golang-1.21-go,git
  golang-1.20-go,git
  golang-1.17-go,git
  ....
  ```

2. ```sh
   sudo apt-get install -s git
   ```

   Output: 
   ```
   Reading package lists... Done
   Building dependency tree... Done
   Reading state information... Done
   The following packages were automatically installed and are no longer required:
   libwpe-1.0-1 libwpebackend-fdo-1.0-1 linux-headers-6.2.0-36-generic
   linux-hwe-6.2-headers-6.2.0-36 linux-image-6.2.0-36-generic
   linux-modules-6.2.0-36-generic linux-modules-extra-6.2.0-36-generic
   Use 'sudo apt autoremove' to remove them.
   Suggested packages:
   git-daemon-run | git-daemon-sysvinit git-doc git-email git-gui gitk gitweb
   git-cvs git-mediawiki git-svn
   The following packages will be upgraded:
   git
   1 to upgrade, 0 to newly install, 0 to remove and 200 not to upgrade.
   Inst git [1:2.34.1-1ubuntu1.10] (1:2.34.1-1ubuntu1.11 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf git (1:2.34.1-1ubuntu1.11 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   ```

- ## The following packages were automatically installed and are no longer required:
- 
  libwpe-1.0-1 libwpebackend-fdo-1.0-1 linux-headers-6.2.0-36-generic
  linux-hwe-6.2-headers-6.2.0-36 linux-image-6.2.0-36-generic
  linux-modules-6.2.0-36-generic linux-modules-extra-6.2.0-36-generic

- ## The following packages will be upgraded:
  git

- ## Suggested packages:
  git-daemon-run | git-daemon-sysvinit git-doc git-email git-gui gitk gitweb
  git-cvs git-mediawiki git-svn
