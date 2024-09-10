# Task 1

## Setup and installation process

1. Created a local repository:
   'mkdir -p ~/local-apt-repo'
   'cp /home/vboxuser/Downloads/google-chrome-stable_current_amd64.deb ~/local-apt-repo/'

2. Generated the package index:
   'dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz'

3. Added the local repository to my sources List:
   'echo "deb [trusted=yes] file:/home/vboxuser/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list'
   'sudo apt update'
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

4. Verified the contents of the packages.gz file:
   'zcat Packages.gz'
   Output:
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

6. Checked the repository of my package:
   'apt policy google-chrome-stable'
   Output:
   google-chrome-stable:
  Installed: 118.0.5993.117-1
  Candidate: 128.0.6613.119-1
  Version table:
     128.0.6613.119-1 500
        500 https://dl.google.com/linux/chrome/deb stable/main amd64 Packages
 *** 118.0.5993.117-1 100
        100 /var/lib/dpkg/status

7. Installed a package from the local repository:
   'sudo apt install google-chrome-stable'
   
