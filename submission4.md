## Task 1: Configure and Use a Local Package Repository

**1. Downloading the .deb Package:**
    
* First I downloaded gimp using  ` apt-get download gimp` 

**2. Creating the Local Repository:**

* A directory named `~/local-apt-repo` was created to store the GIMP package.
* The downloaded `.deb` file was copied into this directory.

**3. Generating the Package Index:**

* The `dpkg-scanpackages` command was used to generate a `Packages` file containing metadata about the GIMP package:

   ```bash
   dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
   ```

* I encountered a warning message, that said that an override file was missing. As the GIMP package is standard, I decided to ignore this warning.

**4. Verifying the `Packages.gz` File:**

* I checked that the `Packages.gz` file `Filename` entry contained a relative path. It had the absolute path, so I unpacked the archive, modifed the Filename and archived it back.
* The `Filename` was verified to be:

    ```
    Filename: ./gimp_2.10.30-1ubuntu0.1_amd64.deb
    ```

**5. Installing GIMP from the Local Repository:**

* The GIMP package was successfully installed from the local repository using the `apt` command:

   ```bash
   sudo apt install gimp
   ```

## Task 2: Simulate Package Installation and Identify Dependencies
root@LAPTOP-6E9KNCDJ:/home/y_pod/F24-intro-labs# sudo apt-get install -s gimp 
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  adwaita-icon-theme at-spi2-core dconf-gsettings-backend dconf-service fontconfig fonts-droid-fallback fonts-noto-mono ghostscript gimp-data
  graphviz gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme humanity-icon-theme i965-va-driver intel-media-va-driver libaa1
  libaacs0 libamd2 libann0 libaom3 libatk-bridge2.0-0 libatk1.0-0 libatk1.0-data libatspi2.0-0 libauthen-sasl-perl libavahi-client3
  libavahi-common-data libavahi-common3 libavcodec58 libavformat58 libavutil56 libbabl-0.1-0 libbdplus0 libblas3 libbluray2 libcairo-gobject2
  libcairo2 libcamd2 libccolamd2 libcdt5 libcgraph6 libcholmod3 libchromaprint1 libclone-perl libcodec2-1.0 libcolamd2 libcolord2 libcups2
  libdata-dump-perl libdatrie1 libdav1d5 libdconf1 libde265-0 libdrm-amdgpu1 libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libencode-locale-perl
  libepoxy0 libexiv2-27 libfile-basedir-perl libfile-desktopentry-perl libfile-listing-perl libfile-mimeinfo-perl libfont-afm-perl libfontenc1
  libgail-common libgail18 libgdk-pixbuf-2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgegl-0.4-0 libgegl-common libgexiv2-2 libgfortran5
  libgimp2.0 libgl1 libgl1-amber-dri libgl1-mesa-dri libglapi-mesa libglvnd0 libglx-mesa0 libglx0 libgme0 libgraphite2-3 libgs9 libgs9-common
  libgsm1 libgtk-3-0 libgtk-3-bin libgtk-3-common libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libgtkd-3-0 libgts-0.7-5 libgts-bin libgudev-1.0-0
  libgvc6 libgvpr2 libharfbuzz0b libheif1 libhtml-form-perl libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl
  libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libice6 libidn12 libigdgmm12 libijs-0.35
  libilmbase25 libio-html-perl libio-socket-ssl-perl libio-stringy-perl libipc-system-simple-perl libjbig2dec0 libjson-glib-1.0-0
  libjson-glib-1.0-common liblab-gamut1 liblapack3 liblcms2-2 libllvm11 libllvm15 libltdl7 liblwp-mediatypes-perl liblwp-protocol-https-perl
  libmailtools-perl libmetis5 libmfx1 libmng2 libmp3lame0 libmpg123-0 libmypaint-1.5-1 libmypaint-common libnet-dbus-perl libnet-http-perl
  libnet-smtp-ssl-perl libnet-ssleay-perl libnorm1 libnspr4 libnss3 libogg0 libopenexr25 libopenjp2-7 libopenmpt0 libopus0 libpango-1.0-0
  libpangocairo-1.0-0 libpangoft2-1.0-0 libpaper-utils libpaper1 libpathplan4 libpciaccess0 libpgm-5.3-0 libphobos2-ldc-shared98 libpixman-1-0
  libpoppler-glib8 libpoppler118 librabbitmq4 libraw20 librsvg2-2 librsvg2-common libsensors-config libsensors5 libshine3 libsm6 libsnappy1v5
  libsoxr0 libspeex1 libsrt1.4-gnutls libssh-gcrypt-4 libsuitesparseconfig5 libswresample3 libswscale5 libthai-data libthai0 libtheora0
  libtie-ixhash-perl libtimedate-perl libtry-tiny-perl libtwolame0 libudfread0 libumfpack5 liburi-perl libva-drm2 libva-x11-2 libva2 libvdpau1
  libvorbis0a libvorbisenc2 libvorbisfile3 libvpx7 libvte-2.91-0 libvte-2.91-common libvted-3-0 libwayland-client0 libwayland-cursor0
  libwayland-egl1 libwebpdemux2 libwebpmux3 libwmf-0.2-7 libwmflite-0.2-7 libwww-perl libwww-robotrules-perl libx11-protocol-perl libx11-xcb1
  libx264-163 libx265-199 libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-randr0 libxcb-render0 libxcb-shape0 libxcb-shm0
  libxcb-sync1 libxcb-xfixes0 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxft2 libxi6 libxinerama1 libxkbcommon0 libxkbfile1
  libxml-parser-perl libxml-twig-perl libxml-xpathengine-perl libxmu6 libxrandr2 libxrender1 libxshmfence1 libxt6 libxtst6 libxv1 libxvidcore4
  libxxf86dga1 libxxf86vm1 libzmq5 libzvbi-common libzvbi0 mesa-va-drivers mesa-vdpau-drivers ocl-icd-libopencl1 perl-openssl-defaults
  poppler-data session-migration tilix tilix-common ubuntu-mono va-driver-all vdpau-driver-all x11-common x11-utils x11-xserver-utils xdg-utils
Suggested packages:
  fonts-noto ghostscript-x gimp-help-en | gimp-help gimp-data-extras gvfs-backends libasound2 gsfonts graphviz-doc i965-va-driver-shaders
  libdigest-hmac-perl libgssapi-perl libcuda1 libnvcuvid1 libnvidia-encode1 libbluray-bdj colord cups-common exiv2 gvfs liblcms2-utils
  libcrypt-ssleay-perl opus-tools librsvg2-bin lm-sensors speex libsub-name-perl libbusiness-isbn-perl libwmf-0.2-7-gtk libauthen-ntlm-perl
  libunicode-map8-perl libunicode-string-perl xml-twig-tools opencl-icd poppler-utils fonts-japanese-mincho | fonts-ipafont-mincho
  fonts-japanese-gothic | fonts-ipafont-gothic fonts-arphic-ukai fonts-arphic-uming fonts-nanum python-nautilus libvdpau-va-gl1 mesa-utils nickle
  cairo-5c xorg-docs-core
The following NEW packages will be installed:
  adwaita-icon-theme at-spi2-core dconf-gsettings-backend dconf-service fontconfig fonts-droid-fallback fonts-noto-mono ghostscript gimp gimp-data
  graphviz gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme humanity-icon-theme i965-va-driver intel-media-va-driver libaa1
  libaacs0 libamd2 libann0 libaom3 libatk-bridge2.0-0 libatk1.0-0 libatk1.0-data libatspi2.0-0 libauthen-sasl-perl libavahi-client3
  libavahi-common-data libavahi-common3 libavcodec58 libavformat58 libavutil56 libbabl-0.1-0 libbdplus0 libblas3 libbluray2 libcairo-gobject2
  libcairo2 libcamd2 libccolamd2 libcdt5 libcgraph6 libcholmod3 libchromaprint1 libclone-perl libcodec2-1.0 libcolamd2 libcolord2 libcups2
  libdata-dump-perl libdatrie1 libdav1d5 libdconf1 libde265-0 libdrm-amdgpu1 libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libencode-locale-perl
  libepoxy0 libexiv2-27 libfile-basedir-perl libfile-desktopentry-perl libfile-listing-perl libfile-mimeinfo-perl libfont-afm-perl libfontenc1
  libgail-common libgail18 libgdk-pixbuf-2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgegl-0.4-0 libgegl-common libgexiv2-2 libgfortran5
  libgimp2.0 libgl1 libgl1-amber-dri libgl1-mesa-dri libglapi-mesa libglvnd0 libglx-mesa0 libglx0 libgme0 libgraphite2-3 libgs9 libgs9-common
  libgsm1 libgtk-3-0 libgtk-3-bin libgtk-3-common libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libgtkd-3-0 libgts-0.7-5 libgts-bin libgudev-1.0-0
  libgvc6 libgvpr2 libharfbuzz0b libheif1 libhtml-form-perl libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl
  libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libice6 libidn12 libigdgmm12 libijs-0.35
  libilmbase25 libio-html-perl libio-socket-ssl-perl libio-stringy-perl libipc-system-simple-perl libjbig2dec0 libjson-glib-1.0-0
  libjson-glib-1.0-common liblab-gamut1 liblapack3 liblcms2-2 libllvm11 libllvm15 libltdl7 liblwp-mediatypes-perl liblwp-protocol-https-perl
  libmailtools-perl libmetis5 libmfx1 libmng2 libmp3lame0 libmpg123-0 libmypaint-1.5-1 libmypaint-common libnet-dbus-perl libnet-http-perl
  libnet-smtp-ssl-perl libnet-ssleay-perl libnorm1 libnspr4 libnss3 libogg0 libopenexr25 libopenjp2-7 libopenmpt0 libopus0 libpango-1.0-0
  libpangocairo-1.0-0 libpangoft2-1.0-0 libpaper-utils libpaper1 libpathplan4 libpciaccess0 libpgm-5.3-0 libphobos2-ldc-shared98 libpixman-1-0
  libpoppler-glib8 libpoppler118 librabbitmq4 libraw20 librsvg2-2 librsvg2-common libsensors-config libsensors5 libshine3 libsm6 libsnappy1v5
  libsoxr0 libspeex1 libsrt1.4-gnutls libssh-gcrypt-4 libsuitesparseconfig5 libswresample3 libswscale5 libthai-data libthai0 libtheora0
  libtie-ixhash-perl libtimedate-perl libtry-tiny-perl libtwolame0 libudfread0 libumfpack5 liburi-perl libva-drm2 libva-x11-2 libva2 libvdpau1
  libvorbis0a libvorbisenc2 libvorbisfile3 libvpx7 libvte-2.91-0 libvte-2.91-common libvted-3-0 libwayland-client0 libwayland-cursor0
  libwayland-egl1 libwebpdemux2 libwebpmux3 libwmf-0.2-7 libwmflite-0.2-7 libwww-perl libwww-robotrules-perl libx11-protocol-perl libx11-xcb1
  libx264-163 libx265-199 libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-randr0 libxcb-render0 libxcb-shape0 libxcb-shm0
  libxcb-sync1 libxcb-xfixes0 libxcomposite1 libxcursor1 libxdamage1 libxfixes3 libxft2 libxi6 libxinerama1 libxkbcommon0 libxkbfile1
  libxml-parser-perl libxml-twig-perl libxml-xpathengine-perl libxmu6 libxrandr2 libxrender1 libxshmfence1 libxt6 libxtst6 libxv1 libxvidcore4
  libxxf86dga1 libxxf86vm1 libzmq5 libzvbi-common libzvbi0 mesa-va-drivers mesa-vdpau-drivers ocl-icd-libopencl1 perl-openssl-defaults
  poppler-data session-migration tilix tilix-common ubuntu-mono va-driver-all vdpau-driver-all x11-common x11-utils x11-xserver-utils xdg-utils
0 upgraded, 267 newly installed, 0 to remove and 129 not upgraded.

## Task 3: Hold and Unhold Package Versions

root@LAPTOP-6E9KNCDJ:/home/y_pod/F24-intro-labs# sudo apt install nano
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Suggested packages:
  hunspell
The following NEW packages will be installed:
  nano
0 upgraded, 1 newly installed, 0 to remove and 4 not upgraded.
Need to get 280 kB of archives.
After this operation, 881 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 nano amd64 6.2-1 [280 kB]
Fetched 280 kB in 1s (407 kB/s)
Selecting previously unselected package nano.
(Reading database ... 30159 files and directories currently installed.)
Preparing to unpack .../archives/nano_6.2-1_amd64.deb ...
Unpacking nano (6.2-1) ...
Setting up nano (6.2-1) ...
update-alternatives: using /bin/nano to provide /usr/bin/editor (editor) in auto mode
update-alternatives: using /bin/nano to provide /usr/bin/pico (pico) in auto mode
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for install-info (6.8-4build1) ...
root@LAPTOP-6E9KNCDJ:/home/y_pod/F24-intro-labs# sudo apt-mark hold nano
nano set on hold.
root@LAPTOP-6E9KNCDJ:/home/y_pod/F24-intro-labs# apt-mark showhold
nano
root@LAPTOP-6E9KNCDJ:/home/y_pod/F24-intro-labs# sudo apt-mark unhold nano
Canceled hold on nano.