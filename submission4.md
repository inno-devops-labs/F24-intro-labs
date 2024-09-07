# Task 1: Configure and Use a Local Package Repository

1. **Create a Local Repository:**

```
mkdir -p ~/local-apt-repo
```

Place some `.deb` packages there:

```

cp Downloads/nekoray-3.26-2023-12-09-debian-x64.deb ~/local-apt-repo/

cp google-chrome-stable_current_amd64.deb ~/local-apt-repo/
```

2. **Generate the Package Index**
   
```
dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
```

Output:
```
dpkg-scanpackages: warning: Packages in archive but missing from override file:
dpkg-scanpackages: warning:   google-chrome-stable nekoray
dpkg-scanpackages: info: Wrote 2 entries to output Packages file.
```

3. **Add the Local Repository to Your Sources List:**

```
echo "deb [trusted=yes] file:/home/kate/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list
sudo apt update
```
4. **Verify the Contents of the Packages.gz File:**

```
zcat Packages.gz
apt policy nekoray
```

Output: 

```
$ zcat Packages.gz
Package: google-chrome-stable
Version: 126.0.6478.182-1
Architecture: amd64
Maintainer: Chrome Linux Team <chromium-dev@chromium.org>
Installed-Size: 340324
Pre-Depends: dpkg (>= 1.14.0)
Depends: ca-certificates, fonts-liberation, libasound2 (>= 1.0.17), libatk-bridge2.0-0 (>= 2.5.3), libatk1.0-0 (>= 2.2.0), libatspi2.0-0 (>= 2.9.90), libc6 (>= 2.17), libcairo2 (>= 1.6.0), libcups2 (>= 1.6.0), libcurl3-gnutls | libcurl3-nss | libcurl4 | libcurl3, libdbus-1-3 (>= 1.9.14), libdrm2 (>= 2.4.75), libexpat1 (>= 2.1~beta3), libgbm1 (>= 17.1.0~rc2), libglib2.0-0 (>= 2.39.4), libgtk-3-0 (>= 3.9.10) | libgtk-4-1, libnspr4 (>= 2:4.9-2~), libnss3 (>= 2:3.35), libpango-1.0-0 (>= 1.14.0), libu2f-udev, libvulkan1, libx11-6 (>= 2:1.4.99.1), libxcb1 (>= 1.9.2), libxcomposite1 (>= 1:0.4.4-1), libxdamage1 (>= 1:1.1), libxext6, libxfixes3, libxkbcommon0 (>= 0.5.0), libxrandr2, wget, xdg-utils (>= 1.0.2)
Provides: www-browser
Filename: /home/kate/local-apt-repo/google-chrome-stable_current_amd64.deb
Size: 108772160
MD5sum: 3b12b10383a78055815a721bd7393880
SHA1: dcef157ba69dc19c0d751ccbc00319dc52d87cf6
SHA256: 8b3cf7a0424049c235315de90472f3c3108ab3a33ead33917ab9ef2efdec0580
Section: web
Priority: optional
Description: The web browser from Google
 Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier.

Package: nekoray
Version: 3.26
Architecture: amd64
Maintainer: MatsuriDayo nekoha_matsuri@protonmail.com
Depends: libxcb-xinerama0, libqt5core5a, libqt5gui5, libqt5network5, libqt5widgets5, libqt5svg5, libqt5x11extras5, desktop-file-utils
Filename: /home/kate/local-apt-repo/nekoray-3.26-2023-12-09-debian-x64.deb
Size: 20079648
MD5sum: e12d2b1d4aa842b2079bc78e8c87f6ad
SHA1: 21eaa73986996684b146a423e63a5ee1af476119
SHA256: f61dcfd3fc270e18113d7130f971b4384299478fa4fa264681cffca006eb18e0
Description: Qt based cross-platform GUI proxy configuration manager (backend: v2ray / sing-box)
```

```
$ apt policy nekoray
nekoray:
  Installed: 3.24
  Candidate: 3.24
  Version table:
 *** 3.24 100
        100 /var/lib/dpkg/status

```


5. **Install a Package from the Local Repository:**

```
sudo apt install nekoray
```


# Task 2: Simulate Package Installation and Identify Dependencies

2. **Simulate the installation:**

Select a package to simulate its installation: 

```
apt-cache showpkg nekoray
```

Output:
```
$ apt-cache showpkg nekoray
Package: nekoray
Versions: 
3.24 (/var/lib/dpkg/status)
 Description Language: 
                 File: /var/lib/dpkg/status
                  MD5: 48c1b65a2a74abbe47b6e75759b6fdf8


Reverse Depends: 
Dependencies: 
3.24 - libxcb-xinerama0 (0 (null)) libqt5core5a (0 (null)) libqt5gui5 (0 (null)) libqt5network5 (0 (null)) libqt5widgets5 (0 (null)) libqt5svg5 (0 (null)) libqt5x11extras5 (0 (null)) desktop-file-utils (0 (null)) 
Provides: 
3.24 - 
Reverse Provides: 
```

Use the -s flag to simulate the installation.

```
sudo apt-get install -s nekoray
```

Output: 
```
$ sudo apt-get install -s nekoray
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
nekoray is already the newest version (3.24).
The following packages were automatically installed and are no longer required:
  bridge-utils gir1.2-gnomeautoar-0.1 gir1.2-gnomedesktop-3.0 libei1
  libfreerdp-server2-2 libfuse2 libntfs-3g89 libraw23 libtss2-tcti-libtpms0
  libtss2-tcti-spi-helper0 libtss2-tctildr0 libwpe-1.0-1
  libwpebackend-fdo-1.0-1 shotwell-common ubuntu-fan
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 3 not upgraded.
```

# Task 3: Hold and Unhold Package Versions

1. **Install a Package**

Output:

```
$ sudo apt install nekoray

Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
nekoray is already the newest version (3.24).
The following packages were automatically installed and are no longer required:
  bridge-utils gir1.2-gnomeautoar-0.1 gir1.2-gnomedesktop-3.0 libei1
  libfreerdp-server2-2 libfuse2 libntfs-3g89 libraw23 libtss2-tcti-libtpms0
  libtss2-tcti-spi-helper0 libtss2-tctildr0 libwpe-1.0-1
  libwpebackend-fdo-1.0-1 shotwell-common ubuntu-fan
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 3 not upgraded.
```
2. **Hold the Package**

Prevent the package from being upgraded.

Output:

```
$ sudo apt-mark hold nekoray
nekoray set on hold.
```

3. **Verify the Hold Status**

```
$ apt-mark showhold
nekoray
```

4. **Unhold the Package**

Allow the package to be upgraded again and verify it.

```
$ apt-mark showhold
nekoray

$ sudo apt-mark unhold nekoray
Canceled hold on nekoray.

$ apt-mark showhold
$
```