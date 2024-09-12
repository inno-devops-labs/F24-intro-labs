### Task 1
1. Create a Local Repository
   first command I used without changes, second command was appended with packege name:
  `cp /var/cache/apt/archives/zerofree_1.1.1-1build3_amd64.deb ~/local-apt-repo/` 
   both command had no output. My "some package" is zerofree. It was in my ubunta somewhere.
2.Generate the Package Index
  I used command without changes and get following output:
```
    $ dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
          dpkg-scanpackages: warning: Packages in archive but missing from override file:
          dpkg-scanpackages: warning:   zerofree
          dpkg-scanpackages: info: Wrote 1 entries to output Packages file.
```
3. Command used without changes and without output.
4. Verify the Contents of the Packages.gz File
  Next command give me the following output:
```
  $ zcat Packages.gz
          Package: zerofree
          Version: 1.1.1-1build3
          Architecture: amd64
          Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
          Installed-Size: 30
          Depends: libc6 (>= 2.34), libext2fs2 (>= 1.42)
          Filename: /home/admin/local-apt-repo/zerofree_1.1.1-1build3_amd64.deb
          Size: 8814
          MD5sum: c16eab0131c22e00cd53ce60400f50fe
          SHA1: 45aa04ef31af497aae9d4870b8dc689051a50eff
          SHA256: b65039dcc39ab399264e5cea9dd26996d7422b04983a044baca578e436d1072c
          Section: admin
          Priority: optional
          Homepage: https://frippery.org/uml/
          Description: zero free blocks from ext2, ext3 and ext4 file-systems
           Zerofree finds the unallocated blocks with non-zero value content in
           an ext2, ext3 or ext4 file-system and fills them with zeroes
           (zerofree can also work with another value than zero). This is mostly
           useful if the device on which this file-system resides is a disk
           image. In this case, depending on the type of disk image, a secondary
           utility may be able to reduce the size of the disk image after
           zerofree has been run. Zerofree requires the file-system to be
           unmounted or mounted read-only.
           .
           The usual way to achieve the same result (zeroing the unused
           blocks) is to run "dd" to create a file full of zeroes that takes up
           the entire free space on the drive, and then delete this file. This
           has many disadvantages, which zerofree alleviates:
            * it is slow;
            * it makes the disk image (temporarily) grow to its maximal extent;
            * it (temporarily) uses all free space on the disk, so other
              concurrent write actions may fail.
           .
           Zerofree has been written to be run from GNU/Linux systems installed
           as guest OSes inside a virtual machine. If this is not your case, you
           almost certainly don't need this package. (One other use case would
           be to erase sensitive data a little bit more securely than with a
           simple "rm").
          Original-Maintainer: Thibaut Paumard <thibaut@debian.org>
```
  That ensure me that the package is locale by filename bulletpoint. 
```
    $ apt policy zerofree
          zerofree:
            Installed: 1.1.1-1build3
            Candidate: 1.1.1-1build3
            Version table:
           *** 1.1.1-1build3 500
                  500 http://ru.archive.ubuntu.com/ubuntu jammy/main amd64 Packages
                  100 /var/lib/dpkg/status
```
5. Install a Package from the Local Repository
   using folloeing command I installed the package 
```
    $ sudo apt install zerofree
          Reading package lists... Done
          Building dependency tree... Done
          Reading state information... Done
          zerofree is already the newest version (1.1.1-1build3).
          zerofree set to manually installed.
          0 upgraded, 0 newly installed, 0 to remove and 327 not upgraded.
```
### Task 2
As a package for simulation I chose zerofree because I knew there it is. It tooks a lot of time before the first task to find some package for this manipulations
     I execute all command from the task and base on it's output I can say that I have zerofree version 1.1.1-1build3 installend on my VM and it has the following dependencies: 
        1.1.1-1build3 - libc6 (2 2.34) libext2fs2 (2 1.42) zerofree:i386 (32 (null))
### Task 3
1. Already installed, skip this step
2. Input: sudo apt-mark hold zerofree
   Output: zerofree set on hold.
3. Input: apt-mark showhold
   Output: zerofree
4. Input: sudo apt-mark unhold zerofree
   Output: Canceled hold on zerofree.

