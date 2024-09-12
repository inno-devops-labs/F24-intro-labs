# Lab4

## Task 1: Set up a Local APT Repository

## Step 1: Create a directory for the local APT repository
```bash
mkdir -p ~/local-apt-repo
```
## Step 2: Generate the Packages.gz file for the repository
```bash
dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
```
### Output:
```bash
dpkg-scanpackages: warning: Packages in archive but missing from override file:
dpkg-scanpackages: warning:   google-chrome-stable
dpkg-scanpackages: info: Wrote 1 entries to output Packages file.
```
## Step 3: Add the local repository to the system's APT sources
```bash
echo "deb [trusted=yes] file:/home/nayal/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list
```
### Output:
```bash
[sudo] password for nayal:         
deb [trusted=yes] file:/home/nayal/local-apt-repo ./
```

## Step 4: Update APT package lists
```bash
sudo apt update
```
## Step 5: Verify the generated Packages.gz file
```bash
zcat ~/local-apt-repo/Packages.gz
```
### Output:
```bash
Package: google-chrome-stable
Version: 128.0.6613.119-1
Architecture: amd64
Maintainer: Chrome Linux Team <chromium-dev@chromium.org>
Installed-Size: 350473
Filename: /home/nayal/local-apt-repo/google-chrome-stable_current_amd64.deb
Size: 110842868
MD5sum: 53b092acfa58295d289a62aced36608b
```
## Step 6: Install or upgrade a package from the local repository
```bash
sudo apt install google-chrome-stable
```
### Output:
```bash
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages will be upgraded:
   google-chrome-stable
1 upgraded, 0 newly installed, 0 to remove and 338 not upgraded.
Need to get 111 MB of archives.
After this operation, 897 kB disk space will be freed.
Get:1 https://dl.google.com/linux/chrome/deb stable/main amd64 google-chrome-stable amd64 128.0.6613.137-1 [111 MB]
Fetched 111 MB in 43s (2 573 kB/s)
Setting up google-chrome-stable (128.0.6613.137-1) ...
```
## Task 2: Simulate Package Installation and Identify Dependencies

## Step 1: Choose a Package to Simulate
```bash
apt-cache showpkg google-chrome-stable
```
## Step 2: Simulate the Installation
```bash
sudo apt-get install -s google-chrome-stable
```
## Step 3: Analyze the Output
### Output:
```bash
Package: google-chrome-stable
Versions: 128.0.6613.137-1
Dependencies:
- dpkg (>= 1.14.0)
- ca-certificates
- fonts-liberation
- libasound2 (>= 1.0.17)
- libatk-bridge2.0-0 (>= 2.5.3)
- libatk1.0-0 (>= 2.2.0)
- libatspi2.0-0 (>= 2.9.90)
- libc6 (>= 2.17)
- libcairo2 (>= 1.6.0)
- libcups2 (>= 1.7.0)
- libcurl3-gnutls
- libcurl3-nss
- libcurl4
- libcurl3
- libdbus-1-3 (>= 1.9.14)
- libdrm2 (>= 2.4.75)
- libexpat1 (>= 2.1~beta3)
- libgbm1 (>= 17.1.0~rc2)
- libglib2.0-0 (>= 2.39.4)
- libgtk-3-0 (>= 3.9.10)
- libgtk-4-1
- libnspr4 (>= 2:4.9-2~)
- libnss3 (>= 2:3.35)
- libpango-1.0-0 (>= 1.14.0)
- libvulkan1
- libx11-6 (>= 2:1.4.99.1)
- libxcb1 (>= 1.9.2)
- libxcomposite1 (>= 1:0.4.4-1)
- libxdamage1 (>= 1:1.1)
- libxext6
- libxfixes3
- libxkbcommon0 (>= 0.5.0)
- libxrandr2
- wget
- xdg-utils (>= 1.0.2)
```
## Task 3: Hold and Unhold Package Versions

## Step1: Install a Package:
```bash
sudo apt install google-chrome-stable
```
## Step2: Hold the Package:
```bash
sudo apt-mark hold google-chrome-stable
```
### Output:
```bash
google-chrome-stable set on hold.
```
## Step3: Verification Command:
```bash
apt-mark showhold
```
### Output:
```bash
google-chrome-stable
```
## Step4: Unhold the Package:
```bash
sudo apt-mark unhold google-chrome-stable
```
### Output:
```bash
Canceled hold on google-chrome-stable.
```
