# Lab Assignment: Software Distribution

## Task 1: Configure and Use a Local Package Repository

### Step 1: Download a `.deb` File
- The `htop` package was downloaded using `wget` after installing it via `apt`. The package was saved in the `local-apt-repo` directory.
- Commands used:
    ```bash
    wget http://ftp.us.debian.org/debian/pool/main/h/htop/htop_3.0.5-7_amd64.deb
    ```

### Step 2: Move the `.deb` File to the Repository Directory
- Created a directory for the local repository and moved the `htop` package into it:
    ```bash
    mkdir -p ~/local-apt-repo
    mv htop_3.0.5-7_amd64.deb ~/local-apt-repo/
    ```

### Step 3: Generate the Package Index
- Used `dpkg-scanpackages` to create the `Packages.gz` file:
    ```bash
    dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
    ```

### Step 4: Add the Local Repository to `sources.list`
- Added the local repository to the system by editing the `sources.list`:
    ```bash
    echo "deb [trusted=yes] file:/home/yourusername/local-apt-repo ./" | tee /etc/apt/sources.list.d/local-apt-repo.list
    ```

### Step 5: Install the Package from the Local Repository
- After updating the package lists using `apt update`, the `htop` package was successfully installed from the local repository:
    ```bash
    apt update
    apt install htop
    ```

## Task 2: Simulate Package Installation and Identify Dependencies

### Step 1: Simulate Installation
- Simulated the installation of the `htop` package using the `-s` flag to avoid actual installation:
    ```bash
    apt-get install -s htop
    ```

### Step 2: Analyze Output
- The output showed that `htop` was already installed. No additional packages were installed, but the process also suggested packages like `lm-sensors`, `lsof`, and `strace`.

## Task 3: Hold and Unhold Package Versions

### Step 1: Hold the Package
- Held the `htop` package to prevent it from being upgraded:
    ```bash
    apt-mark hold htop
    apt-mark showhold
    ```

### Step 2: Unhold the Package
- Unheld the package to allow upgrades:
    ```bash
    apt-mark unhold htop
    apt-mark showhold
    ```

---

### Conclusion
The local repository was successfully configured, the `htop` package was installed from the local repository, the installation process was simulated, and the package was held and unheld correctly.
