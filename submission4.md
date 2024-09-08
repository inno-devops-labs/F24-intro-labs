# Task 1: Setting Up and Using a Local Package Repository

## 1. Creating the Local Repository
- Command used: `mkdir -p ~/local-apt-repo`
- Purpose: This command creates a new directory to store our local package files. It's the first step in setting up our own repository.

## 2. Obtaining a .deb Package
- Command used: `wget http://archive.ubuntu.com/ubuntu/pool/main/h/htop/htop_3.0.5-7build2_amd64.deb`
- Purpose: We download the htop package as an example .deb file for our repository. Htop is an interactive process viewer, chosen for its small size and usefulness.
- Command used: `mv htop_3.0.5-7build2_amd64.deb ~/local-apt-repo/`
- Purpose: This moves the downloaded htop package into our local repository directory.

## 3. Generating the Package Index
- Command used: `dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz`
- Purpose: This command scans our local repository, creates a Packages file with metadata about the packages, and compresses it. This index is crucial for apt to understand what's in our repository.

## 4. Adding the Local Repository to Sources List
- Command used: `echo "deb [trusted=yes] file:/home/$USER/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list`
- Purpose: This adds our local repository to the list of sources that apt checks for packages. The [trusted=yes] option is necessary because our local repository isn't signed.
- Command used: `sudo apt update`
- Purpose: This updates apt's package cache, incorporating the packages from our new local repository.

## 5. Verifying the Repository Contents
- Command used: `zcat ~/local-apt-repo/Packages.gz`
- Observations: This displays the contents of the Packages.gz file. We should see an entry for the htop package, including its filename, version, architecture, and other metadata.
- Command used: `apt policy htop`
- Observations: This shows the available versions of htop. We should see our local repository listed as a source, along with its priority.

## 6. Installing the Package
- Command used: `sudo apt install htop`
- Observations: This installs htop from our local repository. We should see apt recognizing and using our local repository as the package source.

## Conclusion
We've successfully set up a local package repository, added a package to it, and configured our system to use this repository. This process demonstrates how to create and manage a local apt repository, which can be useful for distributing custom packages or creating a local mirror of frequently used packages.



# Task 2: Simulate Package Installation and Identify Dependencies

### Package simulated: nginx

### Dependencies and additional packages that would be installed:
- nginx-common (1.18.0-6ubuntu14.4)
- libnginx-mod-http-geoip2 (1.18.0-6ubuntu14.4)
- libnginx-mod-http-image-filter (1.18.0-6ubuntu14.4)
- libnginx-mod-http-xslt-filter (1.18.0-6ubuntu14.4)
- libnginx-mod-mail (1.18.0-6ubuntu14.4)
- libnginx-mod-stream (1.18.0-6ubuntu14.4)
- libnginx-mod-stream-geoip2 (1.18.0-6ubuntu14.4)
- nginx-core (1.18.0-6ubuntu14.4)
- nginx (1.18.0-6ubuntu14.4)

### Suggested packages:
- fcgiwrap
- nginx-doc

## Observations:
1. The simulation shows that 9 new packages would be installed, with no upgrades or removals.
2. All packages are from the Ubuntu 22.04 (Jammy) repository, specifically from the jammy-updates branch.
3. The main nginx package depends on several modules and a core package, all of which would be installed alongside it.
4. Two packages (libwpe-1.0-1 and libwpebackend-fdo-1.0-1) were identified as no longer required and could be removed using 'sudo apt autoremove'.
5. There are 138 packages that could be upgraded, but this installation wouldn't affect them.
6. The simulation provides the exact version numbers for each package, ensuring compatibility and consistency.


# Task 3: Hold and Unhold Package Versions

### Objective
Prevent a package from being upgraded and then allow it to be upgraded again.

### Package Used
vim

### Steps and Commands

#### 1. Install the Package

Command:
```bash
sudo apt install vim
```

Output:
```
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libwpe-1.0-1 libwpebackend-fdo-1.0-1
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  vim-common vim-runtime vim-tiny
Suggested packages:
  ctags vim-doc vim-scripts indent
The following NEW packages will be installed:
  vim vim-runtime
The following packages will be upgraded:
  vim-common vim-tiny
2 upgraded, 2 newly installed, 0 to remove and 136 not upgraded.
Need to get 9 346 kB of archives.
After this operation, 37,6 MB of additional disk space will be used.
Do you want to continue? [Y/n] Y
[... installation process ...]
Processing triggers for man-db (2.10.2-1) ...
```

#### 2. Hold the Package

Command:
```bash
sudo apt-mark hold vim
```

Output:
```
vim set on hold.
```

#### 3. Verify the Hold Status

Command:
```bash
apt-mark showhold
```

Output:
```
vim
```

#### 4. Unhold the Package

Command:
```bash
sudo apt-mark unhold vim
```

Output:
```
Canceled hold on vim.
```

#### 5. Verify the Hold Status Again

Command:
```bash
apt-mark showhold
```

Output:
```
[No output, indicating no packages are on hold]
```

### Observations

1. The installation of vim also included related packages: vim-common, vim-runtime, and vim-tiny.
2. Two packages (vim-common and vim-tiny) were upgraded during the installation.
3. The 'hold' command successfully prevented the package from being automatically upgraded.
4. The 'showhold' command accurately listed vim as the only package on hold.
5. After unholding, vim no longer appeared in the list of held packages.
6. This process is useful for maintaining specific versions of packages, especially in production environments where stability is crucial.
7. For vim specifically, holding the package could be beneficial if relying on specific features or configurations that might change in future updates.
8. The installation process also suggested additional packages (ctags, vim-doc, vim-scripts, indent) that could enhance vim's functionality.
