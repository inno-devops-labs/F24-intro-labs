# Setting up a local package repository

Let's create a local apt folder in home directory
```markdown
> mkdir -p ~/local-apt-repo
```
Now let's install a .deb package and move it to our folder
```markdown
> wget http://archive.ubuntu.com/ubuntu/pool/universe/k/kdeconnect/kdeconnect_23.08.5-0ubuntu5_amd64.deb
> mv kdeconnect_23.08.5-0ubuntu5_amd64.deb ~/local-apt-repo/
```

Generate package index
```markdown
> dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
```
```markdown
dpkg-scanpackages: warning: Packages in archive but missing from override file:
dpkg-scanpackages: warning:   kdeconnect
dpkg-scanpackages: info: Wrote 1 entries to output Packages file.
```

Add local repository to sources list

```markdown
> echo "deb [trusted=yes] file:/home/$USER/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list
> sudo apt update
```

Verify repo contents

```markdown
> sudo zcat ~/local-apt-repo/Packages.gz
```
```markdown
Package: kdeconnect
Version: 23.08.5-0ubuntu5
Architecture: amd64
Maintainer: Kubuntu Developers <kubuntu-devel@lists.ubuntu.com>
...
```
```markdown
> apt policy kdeconnect
```
```markdown
kdeconnect:
  Installed: (none)
  Candidate: 23.08.5-0ubuntu5
  Version table:
     23.08.5-0ubuntu5 500
        500 http://ru.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
```

```markdown
> sudo apt install kdeconnect
```

# Simulating package installation

Let's simulate flatpak package installation

```markdown
> apt-cache showpkg flatpak
```

```markdown
Package: flatpak
Versions: 
1.14.6-1 (/var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_noble_universe_binary-amd64_Packages) (/var/lib/dpkg/status)
 Description Language: 
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_noble_universe_binary-amd64_Packages
                  MD5: f91acb1d2880527b2759bc5e2d99fbff
 Description Language: en
                 File: /var/lib/apt/lists/ru.archive.ubuntu.com_ubuntu_dists_noble_universe_i18n_Translation-en
                  MD5: f91acb1d2880527b2759bc5e2d99fbff
```

```markdown
> sudo apt-get install -s flatpak
```
```markdown
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libostree-1-1
Suggested packages:
  malcontent-gui
The following NEW packages will be installed:
  flatpak libostree-1-1
```
The suggested package is `malcontent-gui`, and the new package installed is `libostree-1-1`


