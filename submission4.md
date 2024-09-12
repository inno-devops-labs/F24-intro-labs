# Software Distribution

## Task 1: Configure and Use a Local Package Repository

1. **Create a Local Repository**:
   - Create a directory to hold your repository and place some `.deb` files in it.

     ```sh
     > mkdir -p ~/local-apt-repo
     > cd local-apt-repo
     > apt-get download vim
     > ls
     vim_2%3a8.2.3995-1ubuntu2.18_amd64.deb 
     ```

2. **Generate the Package Index**:
   - Use `dpkg-scanpackages` to create a `Packages` file. Compress this file into a `Packages.gz` archive.

     ```sh
     > dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
     
     dpkg-scanpackages: warning: Packages in archive but missing from override file:
     dpkg-scanpackages: warning: vim
     dpkg-scanpackages: info: Wrote 1 entries to output Packages file.
     ```

3. **Add the Local Repository to Your Sources List**:
   - Add the repository to your `sources.list`.

     ```sh
     > echo "deb [trusted=yes] file:/home/yourusername/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list

     deb [trusted=yes] file:/home/mbred/local-apt-repo ./

     > sudo apt update
     ```

4. **Verify the Contents of the Packages.gz File:**:
   - Check that the Packages.gz file contains the correct paths and metadata for your .deb files, **it must be relative path like `./your_package.deb`**. Also you can see the package name there. Then check the repository of your package, make sure it's local one.

     ```sh
     > zcat Packages.gz
     Package: vim
     Version: 2:8.2.3995-1ubuntu2.18
     Architecture: amd64
     Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
     Installed-Size: 3931
     Depends: vim-common (= 2:8.2.3995-1ubuntu2.18), vim-runtime (= 2:8.2.3995-1ubuntu2.18), libacl1 (>= 2.2.23), libc6 (>= 2.34), libgpm2 (>= 1.20.7), libpython3.10 (>= 3.10.0), libselinux1 (>= 3.1~), libsodium23 (>= 1.0.14), libtinfo6 (>= 6)  Suggests: ctags, vim-doc, vim-scripts
     Provides: editor
     Filename: /home/mbred/local-apt-repo/vim_2%3a8.2.3995-1ubuntu2.18_amd64.deb
     {Some other info...}

     > apt policy vim
     vim:
      Installed: 2:8.2.3995-1ubuntu2.13
      Candidate: 2:8.2.3995-1ubuntu2.18
      Version table:
          2:8.2.3995-1ubuntu2.18 500
             500 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages
             500 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages
      *** 2:8.2.3995-1ubuntu2.13 100
             100 /var/lib/dpkg/status
          2:8.2.3995-1ubuntu2 500
             500 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages  
     ```

5. **Install a Package from the Local Repository**:
   - Install a package using `apt` from your local repository.

     ```sh
     > sudo apt install vim
     Reading package lists... Done
     Building dependency tree... Done
     Reading state information... Done
     The following additional packages will be installed:
       vim-common vim-runtime vim-tiny
     The following packages will be upgraded:
       vim vim-common vim-runtime vim-tiny
     4 upgraded, 0 newly installed, 0 to remove and 126 not upgraded.
     ...
     Do you want to continue? [Y/n] y
     {Some fetching info...}
     ```

## Task 2: Simulate Package Installation and Identify Dependencies

**Objective**: Use `apt` to simulate package installation and identify dependencies without actually installing the packages.

1. **Choose a Package to Simulate**:
   - Select a package to simulate its installation.

     ```sh
     > apt-cache showpkg gedit
     Package: gedit
     Versions:
     ...
     Reverse Depends:
     ...
     Dependencies:
     ...
     Provides:
     ...
     Reverse Provides:
     ...
     ```

2. **Simulate the Installation**:
   - Use the `-s` flag to simulate the installation.

     ```sh
     > sudo apt-get install -s gedit
     Reading package lists... Done
     Building dependency tree... Done
     Reading state information... Done
     The following additional packages will be installed:
     ...
     Suggested packages:
     ...
     The following NEW packages will be installed:
     ...
     0 upgraded, 211 newly installed, 0 to remove and 126 not upgraded.
     ```

3. **Analyze the Output**:
   - Identify the dependencies and the packages that would be installed.
   The output contained a lot of info about installations and configurations of packages. Here are some of them (full output is in the end of the file):
   ```sh
   # Installing packages
   # Inst {name} ({version}, {release} and {architecture})
   Inst sgml-base (1.30 Ubuntu:22.04/jammy [all])
   Inst hicolor-icon-theme (0.17-2 Ubuntu:22.04/jammy [all])
   Inst libgdk-pixbuf2.0-common (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [all])
   Inst libgdk-pixbuf-2.0-0 (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst gtk-update-icon-cache (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst humanity-icon-theme (0.6.16 Ubuntu:22.04/jammy [all]) []
   # After 'Inst', there is 'Conf' which mean configuration of a packet
   ```

## Task 3: Hold and Unhold Package Versions

**Objective**: Prevent a package from being upgraded and then allow it to be upgraded again.

1. **Install a Package**:
   - Install a package that is commonly updated.

     ```sh
     > sudo apt install git
     Reading package lists... Done
     Building dependency tree... Done
     Reading state information... Done
     Suggested packages:
       git-daemon-run | git-daemon-sysvinit git-doc git-email git-gui gitk gitweb           git-cvs git-mediawiki git-svn
     The following packages will be upgraded:
       git
     1 upgraded, 0 newly installed, 0 to remove and 125 not upgraded.
     Need to get 3165 kB of archives.
     After this operation, 16.4 kB of additional disk space will be used.
     Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 git amd64 1:2.34.1-1ubuntu1.11 [3165 kB]
     Fetched 3165 kB in 1s (3305 kB/s)
     (Reading database ... 29945 files and directories currently installed.)
     Preparing to unpack .../git_1%3a2.34.1-1ubuntu1.11_amd64.deb ...
     Unpacking git (1:2.34.1-1ubuntu1.11) over (1:2.34.1-1ubuntu1.10) ...
     Setting up git (1:2.34.1-1ubuntu1.11) ... 
     ```

2. **Hold the Package**:
   - Use `apt-mark` to hold the package.

     ```sh
     > sudo apt-mark hold git
     git set on hold.
     ```

3. **Verify the Hold Status**:
   - Check the status of held packages.

     ```sh
     > apt-mark showhold
     git
     ```

4. **Unhold the Package**:
   - Use `apt-mark` to unhold the package.

     ```sh
     > sudo apt-mark unhold git
     Canceled hold on git.
     ```

## Task 2 full output
```sh
   Inst sgml-base (1.30 Ubuntu:22.04/jammy [all])
   Inst hicolor-icon-theme (0.17-2 Ubuntu:22.04/jammy [all])
   Inst libgdk-pixbuf2.0-common (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [all])
   Inst libgdk-pixbuf-2.0-0 (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst gtk-update-icon-cache (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst humanity-icon-theme (0.6.16 Ubuntu:22.04/jammy [all]) []
   Inst ubuntu-mono (20.10-0ubuntu2 Ubuntu:22.04/jammy [all]) []
   Inst adwaita-icon-theme (41.0-1ubuntu1 Ubuntu:22.04/jammy [all])
   Inst alsa-topology-conf (1.2.5.1-2 Ubuntu:22.04/jammy [all])
   Inst libasound2-data (1.2.6.1-1ubuntu1 Ubuntu:22.04/jammy [all])
   Inst libasound2 (1.2.6.1-1ubuntu1 Ubuntu:22.04/jammy [amd64])
   Inst alsa-ucm-conf (1.2.6.3-1ubuntu1.11 Ubuntu:22.04/jammy-updates [all])
   Inst libaspell15 (0.60.8-4build1 Ubuntu:22.04/jammy [amd64])
   Inst emacsen-common (3.0.4 Ubuntu:22.04/jammy [all])
   Inst dictionaries-common (1.28.14 Ubuntu:22.04/jammy [all])
   Inst aspell (0.60.8-4build1 Ubuntu:22.04/jammy [amd64])
   Inst aspell-en (2018.04.16-0-1 Ubuntu:22.04/jammy [all])
   Inst libxi6 (2:1.8-1build1 Ubuntu:22.04/jammy [amd64])
   Inst libatspi2.0-0 (2.44.0-3 Ubuntu:22.04/jammy [amd64])
   Inst x11-common (1:7.7+23ubuntu2 Ubuntu:22.04/jammy [all])
   Inst libxtst6 (2:1.2.3-1build4 Ubuntu:22.04/jammy [amd64])
   Inst dbus-user-session (1.12.20-2ubuntu4.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libdconf1 (0.40.0-3 Ubuntu:22.04/jammy [amd64])
   Inst dconf-service (0.40.0-3 Ubuntu:22.04/jammy [amd64])
   Inst dconf-gsettings-backend (0.40.0-3 Ubuntu:22.04/jammy [amd64])
   Inst session-migration (0.3.6 Ubuntu:22.04/jammy [amd64])
   Inst gsettings-desktop-schemas (42.0-1ubuntu1 Ubuntu:22.04/jammy [all])
   Inst at-spi2-core (2.44.0-3 Ubuntu:22.04/jammy [amd64])
   Inst bubblewrap (0.6.1-1 Ubuntu:22.04/jammy [amd64])
   Inst xml-core (0.18+nmu1 Ubuntu:22.04/jammy [all])
   Inst sgml-data (2.0.11+nmu1 Ubuntu:22.04/jammy [all])
   Inst docbook-xml (4.5-11 Ubuntu:22.04/jammy [all])
   Inst hunspell-en-us (1:2020.12.07-2 Ubuntu:22.04/jammy [all])
   Inst libhunspell-1.7-0 (1.7.0-4build1 Ubuntu:22.04/jammy [amd64])
   Inst libenchant-2-2 (2.3.2-1ubuntu2 Ubuntu:22.04/jammy [amd64])
   Inst enchant-2 (2.3.2-1ubuntu2 Ubuntu:22.04/jammy [amd64])
   Inst fontconfig (2.13.1-4.2ubuntu5 Ubuntu:22.04/jammy [amd64])
   Inst gedit-common (41.0-3 Ubuntu:22.04/jammy [all])
   Inst libatk1.0-data (2.36.0-3build1 Ubuntu:22.04/jammy [all])
   Inst libatk1.0-0 (2.36.0-3build1 Ubuntu:22.04/jammy [amd64])
   Inst gir1.2-atk-1.0 (2.36.0-3build1 Ubuntu:22.04/jammy [amd64])
   Inst gir1.2-freedesktop (1.72.0-1 Ubuntu:22.04/jammy [amd64])
   Inst gir1.2-gdkpixbuf-2.0 (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libgraphite2-3 (1.3.14-1build2 Ubuntu:22.04/jammy [amd64])
   Inst libharfbuzz0b (2.7.4-1ubuntu3.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])Inst gir1.2-harfbuzz-0.0 (2.7.4-1ubuntu3.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libthai-data (0.1.29-1build1 Ubuntu:22.04/jammy [all])
   Inst libdatrie1 (0.2.13-2 Ubuntu:22.04/jammy [amd64])
   Inst libthai0 (0.1.29-1build1 Ubuntu:22.04/jammy [amd64])
   Inst libpango-1.0-0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libpixman-1-0 (0.40.0-1ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libxcb-render0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libxcb-shm0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libxrender1 (1:0.9.10-1build4 Ubuntu:22.04/jammy [amd64])
   Inst libcairo2 (1.16.0-5ubuntu2 Ubuntu:22.04/jammy [amd64])
   Inst libpangoft2-1.0-0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libpangocairo-1.0-0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libxft2 (2.3.4-1 Ubuntu:22.04/jammy [amd64])
   Inst libpangoxft-1.0-0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Inst gir1.2-pango-1.0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libatk-bridge2.0-0 (2.38.0-3 Ubuntu:22.04/jammy [amd64])
   Inst libcairo-gobject2 (1.16.0-5ubuntu2 Ubuntu:22.04/jammy [amd64])
   Inst liblcms2-2 (2.12~rc1-2build2 Ubuntu:22.04/jammy [amd64])
   Inst libcolord2 (1.4.6-1 Ubuntu:22.04/jammy [amd64])
   Inst libavahi-common-data (0.8-5ubuntu5.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libavahi-common3 (0.8-5ubuntu5.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libavahi-client3 (0.8-5ubuntu5.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libcups2 (2.4.1op1-1ubuntu4.10 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64]) 
   Inst libepoxy0 (1.5.10-1 Ubuntu:22.04/jammy [amd64])
   Inst libwayland-client0 (1.20.0-1ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libwayland-cursor0 (1.20.0-1ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libwayland-egl1 (1.20.0-1ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libxcomposite1 (1:0.4.5-1build2 Ubuntu:22.04/jammy [amd64])
   Inst libxfixes3 (1:6.0.0-1 Ubuntu:22.04/jammy [amd64])
   Inst libxcursor1 (1:1.2.0-2build4 Ubuntu:22.04/jammy [amd64])
   Inst libxdamage1 (1:1.1.5-2build2 Ubuntu:22.04/jammy [amd64])
   Inst libxinerama1 (2:1.1.4-3 Ubuntu:22.04/jammy [amd64])
   Inst libxkbcommon0 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Inst libxrandr2 (2:1.5.2-1build1 Ubuntu:22.04/jammy [amd64])
   Inst libgtk-3-common (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [all])
   Inst libgtk-3-0 (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64]) 
   Inst gir1.2-gtk-3.0 (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libgtksourceview-4-common (4.8.3-1 Ubuntu:22.04/jammy [all])
   Inst libgtksourceview-4-0 (4.8.3-1 Ubuntu:22.04/jammy [amd64])
   Inst gir1.2-gtksource-4 (4.8.3-1 Ubuntu:22.04/jammy [amd64])
   Inst libpeas-common (1.32.0-1 Ubuntu:22.04/jammy [all])
   Inst libpeas-1.0-0 (1.32.0-1 Ubuntu:22.04/jammy [amd64])
   Inst gir1.2-peas-1.0 (1.32.0-1 Ubuntu:22.04/jammy [amd64])
   Inst python3-cairo (1.20.1-3build1 Ubuntu:22.04/jammy [amd64])
   Inst python3-gi-cairo (3.42.1-0ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libgspell-1-common (1.9.1-4 Ubuntu:22.04/jammy [all])
   Inst libgspell-1-2 (1.9.1-4 Ubuntu:22.04/jammy [amd64])
   Inst gedit (41.0-3 Ubuntu:22.04/jammy [amd64])
   Inst libproxy1v5 (0.4.17-2 Ubuntu:22.04/jammy [amd64])
   Inst glib-networking-common (2.72.0-1 Ubuntu:22.04/jammy [all])
   Inst glib-networking-services (2.72.0-1 Ubuntu:22.04/jammy [amd64])
   Inst glib-networking (2.72.0-1 Ubuntu:22.04/jammy [amd64])
   Inst libgraphene-1.0-0 (1.10.8-1 Ubuntu:22.04/jammy [amd64])
   Inst libglvnd0 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Inst libwayland-server0 (1.20.0-1ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libxcb-randr0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libgbm1 (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Inst libglapi-mesa (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Inst libx11-xcb1 (2:1.7.5-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])Inst libxcb-dri2-0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libxcb-dri3-0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libxcb-present0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libxcb-sync1 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libxcb-xfixes0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libxshmfence1 (1.3-1build4 Ubuntu:22.04/jammy [amd64])
   Inst libegl-mesa0 (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Inst libegl1 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Inst libxcb-glx0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libxxf86vm1 (1:1.1.4-1build3 Ubuntu:22.04/jammy [amd64])
   Inst libdrm-amdgpu1 (2.4.113-2~ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libpciaccess0 (0.16-3 Ubuntu:22.04/jammy [amd64])
   Inst libdrm-intel1 (2.4.113-2~ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libdrm-nouveau2 (2.4.113-2~ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libdrm-radeon1 (2.4.113-2~ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libllvm15 (1:15.0.7-0ubuntu0.22.04.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libsensors-config (1:3.6.0-7ubuntu1 Ubuntu:22.04/jammy [all])
   Inst libsensors5 (1:3.6.0-7ubuntu1 Ubuntu:22.04/jammy [amd64])
   Inst libgl1-mesa-dri (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Inst libglx-mesa0 (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Inst libglx0 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Inst libgl1 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Inst liborc-0.4-0 (1:0.4.32-2ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libgstreamer-plugins-base1.0-0 (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libgudev-1.0-0 (1:237-2build1 Ubuntu:22.04/jammy [amd64])
   Inst libgstreamer-gl1.0-0 (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security 
   [amd64])
   Inst gstreamer1.0-gl (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libcdparanoia0 (3.10.2+debian-14build2 Ubuntu:22.04/jammy [amd64])
   Inst libogg0 (1.3.5-0ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libopus0 (1.3.1-0.1build2 Ubuntu:22.04/jammy [amd64])
   Inst libtheora0 (1.1.1+dfsg.1-15ubuntu4 Ubuntu:22.04/jammy [amd64])
   Inst libvisual-0.4-0 (0.4.0-17build2 Ubuntu:22.04/jammy [amd64])
   Inst libvorbis0a (1.3.7-1build2 Ubuntu:22.04/jammy [amd64])
   Inst libvorbisenc2 (1.3.7-1build2 Ubuntu:22.04/jammy [amd64])
   Inst gstreamer1.0-plugins-base (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libaa1 (1.4p5-50build1 Ubuntu:22.04/jammy [amd64])
   Inst libraw1394-11 (2.1.2-2build2 Ubuntu:22.04/jammy [amd64])
   Inst libavc1394-0 (0.5.4-5build2 Ubuntu:22.04/jammy [amd64])
   Inst libcaca0 (0.99.beta19-2.2ubuntu4 Ubuntu:22.04/jammy [amd64])
   Inst libdv4 (1.0.0-14build1 Ubuntu:22.04/jammy [amd64])
   Inst libflac8 (1.3.3-2ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])     
   Inst libgstreamer-plugins-good1.0-0 (1.20.3-0ubuntu1.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libiec61883-0 (1.2.0-4build3 Ubuntu:22.04/jammy [amd64])
   Inst libsamplerate0 (0.2.2-1build1 Ubuntu:22.04/jammy [amd64])
   Inst libjack-jackd2-0 (1.9.20~dfsg-1 Ubuntu:22.04/jammy [amd64])
   Inst libmp3lame0 (3.100-3build2 Ubuntu:22.04/jammy [amd64])
   Inst libmpg123-0 (1.29.3-1build1 Ubuntu:22.04/jammy [amd64])
   Inst libasyncns0 (0.8-6build2 Ubuntu:22.04/jammy [amd64])
   Inst libsndfile1 (1.0.31-2ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64]) 
   Inst libpulse0 (1:15.99.1+dfsg1-1ubuntu2.2 Ubuntu:22.04/jammy-updates [amd64])
   Inst libspeex1 (1.2~rc1.2-1.1ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libshout3 (2.4.5-1build3 Ubuntu:22.04/jammy [amd64])
   Inst libtag1v5-vanilla (1.11.1+dfsg.1-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libtag1v5 (1.11.1+dfsg.1-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Inst libtwolame0 (0.4.0-2build2 Ubuntu:22.04/jammy [amd64])
   Inst libv4lconvert0 (1.22.1-2build1 Ubuntu:22.04/jammy [amd64])
   Inst libv4l-0 (1.22.1-2build1 Ubuntu:22.04/jammy [amd64])
   Inst libvpx7 (1.11.0-2ubuntu2.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])     
   Inst libwavpack1 (5.4.0-1build2 Ubuntu:22.04/jammy [amd64])
   Inst libsoup2.4-common (2.74.2-3 Ubuntu:22.04/jammy [all])
   Inst libsoup2.4-1 (2.74.2-3 Ubuntu:22.04/jammy [amd64])
   Inst gstreamer1.0-plugins-good (1.20.3-0ubuntu1.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libxv1 (2:1.0.11-1build2 Ubuntu:22.04/jammy [amd64])
   Inst gstreamer1.0-x (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libltdl7 (2.4.6-15build2 Ubuntu:22.04/jammy [amd64])
   Inst libtdb1 (1.4.5-2build1 Ubuntu:22.04/jammy [amd64])
   Inst libvorbisfile3 (1.3.7-1build2 Ubuntu:22.04/jammy [amd64])
   Inst sound-theme-freedesktop (0.8-2ubuntu1 Ubuntu:22.04/jammy [all])
   Inst libcanberra0 (0.30-10ubuntu1.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libgdk-pixbuf2.0-bin (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libgl1-amber-dri (21.3.9-0ubuntu1~22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libgtk-3-bin (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libhandy-1-0 (1.6.1-1 Ubuntu:22.04/jammy [amd64])
   Inst libharfbuzz-icu0 (2.7.4-1ubuntu3.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libhyphen0 (2.8.8-7build2 Ubuntu:22.04/jammy [amd64])
   Inst libjavascriptcoregtk-4.0-18 (2.44.3-0ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libjson-glib-1.0-common (1.6.6-1build1 Ubuntu:22.04/jammy [all])
   Inst libjson-glib-1.0-0 (1.6.6-1build1 Ubuntu:22.04/jammy [amd64])
   Inst libevdev2 (1.12.1+dfsg-1 Ubuntu:22.04/jammy [amd64])
   Inst libmanette-0.2-0 (0.2.6-3build1 Ubuntu:22.04/jammy [amd64])
   Inst libnotify4 (0.7.9-3ubuntu5.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Inst libwebrtc-audio-processing1 (0.3.1-0ubuntu5 Ubuntu:22.04/jammy [amd64])
   Inst libspa-0.2-modules (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Inst libpipewire-0.3-0 (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Inst libpipewire-0.3-common (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [all])
   Inst libpipewire-0.3-modules (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Inst librsvg2-2 (2.52.5+dfsg-3ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst librsvg2-common (2.52.5+dfsg-3ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security 
   [amd64])
   Inst libsecret-common (0.20.5-2 Ubuntu:22.04/jammy [all])
   Inst libsecret-1-0 (0.20.5-2 Ubuntu:22.04/jammy [amd64])
   Inst libgles2 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Inst xdg-dbus-proxy (0.1.3-1 Ubuntu:22.04/jammy [amd64])
   Inst libwebpdemux2 (1.2.2-2ubuntu0.22.04.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libwoff1 (1.0.2-1build4 Ubuntu:22.04/jammy [amd64])
   Inst libxslt1.1 (1.1.34-4ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libwebkit2gtk-4.0-37 (2.44.3-0ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Inst libyelp0 (42.1-1 Ubuntu:22.04/jammy [amd64])
   Inst pipewire-bin (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Inst pipewire (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Inst pipewire-media-session (0.4.1-2ubuntu1 Ubuntu:22.04/jammy [amd64])
   Inst rtkit (0.13-4build2 Ubuntu:22.04/jammy [amd64])
   Inst xdg-desktop-portal (1.14.4-1ubuntu2~22.04.1 Ubuntu:22.04/jammy-updates [amd64]) Inst xdg-desktop-portal-gtk (1.14.0-1build1 Ubuntu:22.04/jammy [amd64])
   Inst yelp-xsl (42.0-1 Ubuntu:22.04/jammy [all])
   Inst yelp (42.1-1 Ubuntu:22.04/jammy [amd64])
   Inst zenity-common (3.42.1-0ubuntu1 Ubuntu:22.04/jammy-updates [all])
   Inst zenity (3.42.1-0ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Conf sgml-base (1.30 Ubuntu:22.04/jammy [all])
   Conf hicolor-icon-theme (0.17-2 Ubuntu:22.04/jammy [all])
   Conf libgdk-pixbuf2.0-common (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [all])
   Conf libgdk-pixbuf-2.0-0 (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf gtk-update-icon-cache (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf humanity-icon-theme (0.6.16 Ubuntu:22.04/jammy [all])
   Conf ubuntu-mono (20.10-0ubuntu2 Ubuntu:22.04/jammy [all])
   Conf adwaita-icon-theme (41.0-1ubuntu1 Ubuntu:22.04/jammy [all])
   Conf alsa-topology-conf (1.2.5.1-2 Ubuntu:22.04/jammy [all])
   Conf libasound2-data (1.2.6.1-1ubuntu1 Ubuntu:22.04/jammy [all])
   Conf libasound2 (1.2.6.1-1ubuntu1 Ubuntu:22.04/jammy [amd64])
   Conf alsa-ucm-conf (1.2.6.3-1ubuntu1.11 Ubuntu:22.04/jammy-updates [all])
   Conf libaspell15 (0.60.8-4build1 Ubuntu:22.04/jammy [amd64])
   Conf emacsen-common (3.0.4 Ubuntu:22.04/jammy [all])
   Conf dictionaries-common (1.28.14 Ubuntu:22.04/jammy [all])
   Conf aspell (0.60.8-4build1 Ubuntu:22.04/jammy [amd64])
   Conf aspell-en (2018.04.16-0-1 Ubuntu:22.04/jammy [all])
   Conf libxi6 (2:1.8-1build1 Ubuntu:22.04/jammy [amd64])
   Conf libatspi2.0-0 (2.44.0-3 Ubuntu:22.04/jammy [amd64])
   Conf x11-common (1:7.7+23ubuntu2 Ubuntu:22.04/jammy [all])
   Conf libxtst6 (2:1.2.3-1build4 Ubuntu:22.04/jammy [amd64])
   Conf dbus-user-session (1.12.20-2ubuntu4.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libdconf1 (0.40.0-3 Ubuntu:22.04/jammy [amd64])
   Conf dconf-service (0.40.0-3 Ubuntu:22.04/jammy [amd64])
   Conf dconf-gsettings-backend (0.40.0-3 Ubuntu:22.04/jammy [amd64])
   Conf session-migration (0.3.6 Ubuntu:22.04/jammy [amd64])
   Conf gsettings-desktop-schemas (42.0-1ubuntu1 Ubuntu:22.04/jammy [all])
   Conf at-spi2-core (2.44.0-3 Ubuntu:22.04/jammy [amd64])
   Conf bubblewrap (0.6.1-1 Ubuntu:22.04/jammy [amd64])
   Conf xml-core (0.18+nmu1 Ubuntu:22.04/jammy [all])
   Conf sgml-data (2.0.11+nmu1 Ubuntu:22.04/jammy [all])
   Conf docbook-xml (4.5-11 Ubuntu:22.04/jammy [all])
   Conf hunspell-en-us (1:2020.12.07-2 Ubuntu:22.04/jammy [all])
   Conf libhunspell-1.7-0 (1.7.0-4build1 Ubuntu:22.04/jammy [amd64])
   Conf libenchant-2-2 (2.3.2-1ubuntu2 Ubuntu:22.04/jammy [amd64])
   Conf enchant-2 (2.3.2-1ubuntu2 Ubuntu:22.04/jammy [amd64])
   Conf fontconfig (2.13.1-4.2ubuntu5 Ubuntu:22.04/jammy [amd64])
   Conf gedit-common (41.0-3 Ubuntu:22.04/jammy [all])
   Conf libatk1.0-data (2.36.0-3build1 Ubuntu:22.04/jammy [all])
   Conf libatk1.0-0 (2.36.0-3build1 Ubuntu:22.04/jammy [amd64])
   Conf gir1.2-atk-1.0 (2.36.0-3build1 Ubuntu:22.04/jammy [amd64])
   Conf gir1.2-freedesktop (1.72.0-1 Ubuntu:22.04/jammy [amd64])
   Conf gir1.2-gdkpixbuf-2.0 (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libgraphite2-3 (1.3.14-1build2 Ubuntu:22.04/jammy [amd64])
   Conf libharfbuzz0b (2.7.4-1ubuntu3.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])Conf gir1.2-harfbuzz-0.0 (2.7.4-1ubuntu3.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libthai-data (0.1.29-1build1 Ubuntu:22.04/jammy [all])
   Conf libdatrie1 (0.2.13-2 Ubuntu:22.04/jammy [amd64])
   Conf libthai0 (0.1.29-1build1 Ubuntu:22.04/jammy [amd64])
   Conf libpango-1.0-0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libpixman-1-0 (0.40.0-1ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libxcb-render0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libxcb-shm0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libxrender1 (1:0.9.10-1build4 Ubuntu:22.04/jammy [amd64])
   Conf libcairo2 (1.16.0-5ubuntu2 Ubuntu:22.04/jammy [amd64])
   Conf libpangoft2-1.0-0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libpangocairo-1.0-0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libxft2 (2.3.4-1 Ubuntu:22.04/jammy [amd64])
   Conf libpangoxft-1.0-0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Conf gir1.2-pango-1.0 (1.50.6+ds-2ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libatk-bridge2.0-0 (2.38.0-3 Ubuntu:22.04/jammy [amd64])
   Conf libcairo-gobject2 (1.16.0-5ubuntu2 Ubuntu:22.04/jammy [amd64])
   Conf liblcms2-2 (2.12~rc1-2build2 Ubuntu:22.04/jammy [amd64])
   Conf libcolord2 (1.4.6-1 Ubuntu:22.04/jammy [amd64])
   Conf libavahi-common-data (0.8-5ubuntu5.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libavahi-common3 (0.8-5ubuntu5.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libavahi-client3 (0.8-5ubuntu5.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libcups2 (2.4.1op1-1ubuntu4.10 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64]) 
   Conf libepoxy0 (1.5.10-1 Ubuntu:22.04/jammy [amd64])
   Conf libwayland-client0 (1.20.0-1ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libwayland-cursor0 (1.20.0-1ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libwayland-egl1 (1.20.0-1ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libxcomposite1 (1:0.4.5-1build2 Ubuntu:22.04/jammy [amd64])
   Conf libxfixes3 (1:6.0.0-1 Ubuntu:22.04/jammy [amd64])
   Conf libxcursor1 (1:1.2.0-2build4 Ubuntu:22.04/jammy [amd64])
   Conf libxdamage1 (1:1.1.5-2build2 Ubuntu:22.04/jammy [amd64])
   Conf libxinerama1 (2:1.1.4-3 Ubuntu:22.04/jammy [amd64])
   Conf libxkbcommon0 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Conf libxrandr2 (2:1.5.2-1build1 Ubuntu:22.04/jammy [amd64])
   Conf libgtk-3-common (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [all])
   Conf libgtk-3-0 (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64]) 
   Conf gir1.2-gtk-3.0 (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libgtksourceview-4-common (4.8.3-1 Ubuntu:22.04/jammy [all])
   Conf libgtksourceview-4-0 (4.8.3-1 Ubuntu:22.04/jammy [amd64])
   Conf gir1.2-gtksource-4 (4.8.3-1 Ubuntu:22.04/jammy [amd64])
   Conf libpeas-common (1.32.0-1 Ubuntu:22.04/jammy [all])
   Conf libpeas-1.0-0 (1.32.0-1 Ubuntu:22.04/jammy [amd64])
   Conf gir1.2-peas-1.0 (1.32.0-1 Ubuntu:22.04/jammy [amd64])
   Conf python3-cairo (1.20.1-3build1 Ubuntu:22.04/jammy [amd64])
   Conf python3-gi-cairo (3.42.1-0ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libgspell-1-common (1.9.1-4 Ubuntu:22.04/jammy [all])
   Conf libgspell-1-2 (1.9.1-4 Ubuntu:22.04/jammy [amd64])
   Conf gedit (41.0-3 Ubuntu:22.04/jammy [amd64])
   Conf libproxy1v5 (0.4.17-2 Ubuntu:22.04/jammy [amd64])
   Conf glib-networking-common (2.72.0-1 Ubuntu:22.04/jammy [all])
   Conf glib-networking-services (2.72.0-1 Ubuntu:22.04/jammy [amd64])
   Conf glib-networking (2.72.0-1 Ubuntu:22.04/jammy [amd64])
   Conf libgraphene-1.0-0 (1.10.8-1 Ubuntu:22.04/jammy [amd64])
   Conf libglvnd0 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Conf libwayland-server0 (1.20.0-1ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libxcb-randr0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libgbm1 (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Conf libglapi-mesa (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Conf libx11-xcb1 (2:1.7.5-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])Conf libxcb-dri2-0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libxcb-dri3-0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libxcb-present0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libxcb-sync1 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libxcb-xfixes0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libxshmfence1 (1.3-1build4 Ubuntu:22.04/jammy [amd64])
   Conf libegl-mesa0 (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Conf libegl1 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Conf libxcb-glx0 (1.14-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libxxf86vm1 (1:1.1.4-1build3 Ubuntu:22.04/jammy [amd64])
   Conf libdrm-amdgpu1 (2.4.113-2~ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libpciaccess0 (0.16-3 Ubuntu:22.04/jammy [amd64])
   Conf libdrm-intel1 (2.4.113-2~ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libdrm-nouveau2 (2.4.113-2~ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libdrm-radeon1 (2.4.113-2~ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libllvm15 (1:15.0.7-0ubuntu0.22.04.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libsensors-config (1:3.6.0-7ubuntu1 Ubuntu:22.04/jammy [all])
   Conf libsensors5 (1:3.6.0-7ubuntu1 Ubuntu:22.04/jammy [amd64])
   Conf libgl1-mesa-dri (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Conf libglx-mesa0 (23.2.1-1ubuntu3.1~22.04.2 Ubuntu:22.04/jammy-updates [amd64])
   Conf libglx0 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Conf libgl1 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Conf liborc-0.4-0 (1:0.4.32-2ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libgstreamer-plugins-base1.0-0 (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libgudev-1.0-0 (1:237-2build1 Ubuntu:22.04/jammy [amd64])
   Conf libgstreamer-gl1.0-0 (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security 
   [amd64])
   Conf gstreamer1.0-gl (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libcdparanoia0 (3.10.2+debian-14build2 Ubuntu:22.04/jammy [amd64])
   Conf libogg0 (1.3.5-0ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libopus0 (1.3.1-0.1build2 Ubuntu:22.04/jammy [amd64])
   Conf libtheora0 (1.1.1+dfsg.1-15ubuntu4 Ubuntu:22.04/jammy [amd64])
   Conf libvisual-0.4-0 (0.4.0-17build2 Ubuntu:22.04/jammy [amd64])
   Conf libvorbis0a (1.3.7-1build2 Ubuntu:22.04/jammy [amd64])
   Conf libvorbisenc2 (1.3.7-1build2 Ubuntu:22.04/jammy [amd64])
   Conf gstreamer1.0-plugins-base (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libaa1 (1.4p5-50build1 Ubuntu:22.04/jammy [amd64])
   Conf libraw1394-11 (2.1.2-2build2 Ubuntu:22.04/jammy [amd64])
   Conf libavc1394-0 (0.5.4-5build2 Ubuntu:22.04/jammy [amd64])
   Conf libcaca0 (0.99.beta19-2.2ubuntu4 Ubuntu:22.04/jammy [amd64])
   Conf libdv4 (1.0.0-14build1 Ubuntu:22.04/jammy [amd64])
   Conf libflac8 (1.3.3-2ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])     
   Conf libgstreamer-plugins-good1.0-0 (1.20.3-0ubuntu1.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libiec61883-0 (1.2.0-4build3 Ubuntu:22.04/jammy [amd64])
   Conf libsamplerate0 (0.2.2-1build1 Ubuntu:22.04/jammy [amd64])
   Conf libjack-jackd2-0 (1.9.20~dfsg-1 Ubuntu:22.04/jammy [amd64])
   Conf libmp3lame0 (3.100-3build2 Ubuntu:22.04/jammy [amd64])
   Conf libmpg123-0 (1.29.3-1build1 Ubuntu:22.04/jammy [amd64])
   Conf libasyncns0 (0.8-6build2 Ubuntu:22.04/jammy [amd64])
   Conf libsndfile1 (1.0.31-2ubuntu0.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64]) 
   Conf libpulse0 (1:15.99.1+dfsg1-1ubuntu2.2 Ubuntu:22.04/jammy-updates [amd64])
   Conf libspeex1 (1.2~rc1.2-1.1ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libshout3 (2.4.5-1build3 Ubuntu:22.04/jammy [amd64])
   Conf libtag1v5-vanilla (1.11.1+dfsg.1-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libtag1v5 (1.11.1+dfsg.1-3ubuntu3 Ubuntu:22.04/jammy [amd64])
   Conf libtwolame0 (0.4.0-2build2 Ubuntu:22.04/jammy [amd64])
   Conf libv4lconvert0 (1.22.1-2build1 Ubuntu:22.04/jammy [amd64])
   Conf libv4l-0 (1.22.1-2build1 Ubuntu:22.04/jammy [amd64])
   Conf libvpx7 (1.11.0-2ubuntu2.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])     
   Conf libwavpack1 (5.4.0-1build2 Ubuntu:22.04/jammy [amd64])
   Conf libsoup2.4-common (2.74.2-3 Ubuntu:22.04/jammy [all])
   Conf libsoup2.4-1 (2.74.2-3 Ubuntu:22.04/jammy [amd64])
   Conf gstreamer1.0-plugins-good (1.20.3-0ubuntu1.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libxv1 (2:1.0.11-1build2 Ubuntu:22.04/jammy [amd64])
   Conf gstreamer1.0-x (1.20.1-1ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libltdl7 (2.4.6-15build2 Ubuntu:22.04/jammy [amd64])
   Conf libtdb1 (1.4.5-2build1 Ubuntu:22.04/jammy [amd64])
   Conf libvorbisfile3 (1.3.7-1build2 Ubuntu:22.04/jammy [amd64])
   Conf sound-theme-freedesktop (0.8-2ubuntu1 Ubuntu:22.04/jammy [all])
   Conf libcanberra0 (0.30-10ubuntu1.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libgdk-pixbuf2.0-bin (2.42.8+dfsg-1ubuntu0.3 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libgl1-amber-dri (21.3.9-0ubuntu1~22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libgtk-3-bin (3.24.33-1ubuntu2.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libhandy-1-0 (1.6.1-1 Ubuntu:22.04/jammy [amd64])
   Conf libharfbuzz-icu0 (2.7.4-1ubuntu3.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libhyphen0 (2.8.8-7build2 Ubuntu:22.04/jammy [amd64])
   Conf libjavascriptcoregtk-4.0-18 (2.44.3-0ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libjson-glib-1.0-common (1.6.6-1build1 Ubuntu:22.04/jammy [all])
   Conf libjson-glib-1.0-0 (1.6.6-1build1 Ubuntu:22.04/jammy [amd64])
   Conf libevdev2 (1.12.1+dfsg-1 Ubuntu:22.04/jammy [amd64])
   Conf libmanette-0.2-0 (0.2.6-3build1 Ubuntu:22.04/jammy [amd64])
   Conf libnotify4 (0.7.9-3ubuntu5.22.04.1 Ubuntu:22.04/jammy-updates [amd64])
   Conf libwebrtc-audio-processing1 (0.3.1-0ubuntu5 Ubuntu:22.04/jammy [amd64])
   Conf libspa-0.2-modules (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Conf libpipewire-0.3-0 (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Conf libpipewire-0.3-common (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [all])
   Conf libpipewire-0.3-modules (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Conf librsvg2-2 (2.52.5+dfsg-3ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf librsvg2-common (2.52.5+dfsg-3ubuntu0.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security 
   [amd64])
   Conf libsecret-common (0.20.5-2 Ubuntu:22.04/jammy [all])
   Conf libsecret-1-0 (0.20.5-2 Ubuntu:22.04/jammy [amd64])
   Conf libgles2 (1.4.0-1 Ubuntu:22.04/jammy [amd64])
   Conf xdg-dbus-proxy (0.1.3-1 Ubuntu:22.04/jammy [amd64])
   Conf libwebpdemux2 (1.2.2-2ubuntu0.22.04.2 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libwoff1 (1.0.2-1build4 Ubuntu:22.04/jammy [amd64])
   Conf libxslt1.1 (1.1.34-4ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libwebkit2gtk-4.0-37 (2.44.3-0ubuntu0.22.04.1 Ubuntu:22.04/jammy-updates, Ubuntu:22.04/jammy-security [amd64])
   Conf libyelp0 (42.1-1 Ubuntu:22.04/jammy [amd64])
   Conf pipewire-bin (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Conf pipewire (0.3.48-1ubuntu3 Ubuntu:22.04/jammy-updates [amd64])
   Conf pipewire-media-session (0.4.1-2ubuntu1 Ubuntu:22.04/jammy [amd64])
   Conf rtkit (0.13-4build2 Ubuntu:22.04/jammy [amd64])
   Conf xdg-desktop-portal (1.14.4-1ubuntu2~22.04.1 Ubuntu:22.04/jammy-updates [amd64]) Conf xdg-desktop-portal-gtk (1.14.0-1build1 Ubuntu:22.04/jammy [amd64])
   Conf yelp-xsl (42.0-1 Ubuntu:22.04/jammy [all])
   Conf yelp (42.1-1 Ubuntu:22.04/jammy [amd64])
   Conf zenity-common (3.42.1-0ubuntu1 Ubuntu:22.04/jammy-updates [all])
   Conf zenity (3.42.1-0ubuntu1 Ubuntu:22.04/jammy-updates [amd64])
```