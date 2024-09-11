# Taks 1

## As I use Fedora distributive I adapt lab instructions for my operating system.

1. **I Downloaded `obfs4proxy.rpm` package:** [[Link]](http://rpmfind.net/linux/fedora/linux/releases/40/Everything/x86_64/os/Packages/o/obfs4-0.0.14-5.20221103gitproxy.0.0.14.fc40.x86_64.rpm)
2. **Download required tool:**
    ```shell
   sudo dnf install createrepo_c
   ```
3. **Create Local Repository:**
    ```shell
   cp ~/Downloads/{package_name}.rpm ~/local-repo
   mkdir ~/local-repo
   ```
4. **Create repository metadata:**
    ```shell
   createrepo_c .
   ```

5. **Add local repository to source list:**
    - Create the file `my-rpms.repo` in `/etc/yum.repos.d` and fill it
    ```
   [local]
   name=MyRepo
   baseurl=/home/t/local-repo
   enabled=1
   gpgcheck=0
   ```
    
    - Local repo (MyRepo) is visible for dnf installer:
   ```
   repo id                                                                 repo name
   copr:copr.fedorainfracloud.org:phracek:PyCharm                          Copr repo for PyCharm owned by phracek
   docker-ce-stable                                                        Docker CE Stable - x86_64
   fedora                                                                  Fedora 40 - x86_64
   fedora-cisco-openh264                                                   Fedora 40 openh264 (From Cisco) - x86_64
   google-chrome                                                           google-chrome
   local                                                                   MyRepo
   rpmfusion-nonfree-nvidia-driver                                         RPM Fusion for Fedora 40 - Nonfree - NVIDIA Driver
   rpmfusion-nonfree-steam                                                 RPM Fusion for Fedora 40 - Nonfree - Steam
   updates                                                                 Fedora 40 - x86_64 - Updates
    ```

6. **Check dnf installer knows about local repo:**
   ```shell
   sudo dnf repolist
   ```
7. **Refresh the dnf installer repos knowledge**
   ```shell
    sudo dnf makecache 
    ```   
8. **Install the repo:**
   ```shell
   sudo dnf install {package_name} --repo=local
   ```

# Task 2

```shell
sudo dnf install --assumeno obfs4-0.0.14-5.20221103gitproxy.0.0.14.fc40.x86_64 --repo=local
```
    
- No requirements for this repository.
    
```
Last metadata expiration check: 0:30:09 ago on Wed 11 Sep 2024 09:04:11 PM MSK.
Dependencies resolved.
====================================================================================================================================================
 Package                    Architecture                Version                                                    Repository                  Size
====================================================================================================================================================
Installing:
 obfs4                      x86_64                      0.0.14-5.20221103gitproxy.0.0.14.fc40                      local                      2.1 M
    
Transaction Summary
====================================================================================================================================================
Install  1 Package
    
Total size: 2.1 M
Installed size: 5.5 M
Operation aborted.
```

# Task 3

1. **Install the plugin for locking packages:**
   ```shell
    sudo dnf install python3-dnf-plugin-versionlock-4.9.0-1.fc40.noarch
    ```
   
2. **Lock the package:**
    ```shell
    sudo dnf versionlock nano
    ```
   Output:
   ```
    Adding versionlock on: nano-0:7.2-7.fc40.*
    ```

3. **List locked packages:**
    ```shell
   sudo dnf versionlock list
   ```
   Output:
    ```
   nano-0:7.2-7.fc40.*
   ```
4. **Unlock the package:**
    ```shell
   sudo dnf versionlock delete nano
   ```
    Output:
    ```
   Deleting versionlock for: nano-0:7.2-7.fc40.*
   ```