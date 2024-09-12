#Lab4

## Task 1: Set up a Local APT Repository

## Step 1: Create a directory for the local APT repository
### Command:
```bash
mkdir -p ~/local-apt-repo
```
## Step 2: Generate the Packages.gz file for the repository
dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz

## Step 3: Add the local repository to the system's APT sources
echo "deb [trusted=yes] file:/home/nayal/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list

## Step 4: Update APT package lists
sudo apt update

## Step 5: Verify the generated Packages.gz file (optional)
zcat ~/local-apt-repo/Packages.gz

### Task 2: Simulate Package Installation and Identify Dependencies

# Step 1: Choose a Package to Simulate
# Output of apt-cache showpkg for google-chrome-stable
apt-cache showpkg google-chrome-stable

# Step 2: Simulate the Installation
# Simulate the installation of google-chrome-stable
sudo apt-get install -s google-chrome-stable

# Step 3: Analyze the Output
# Document the output in your documentation as:
# 
# Package: google-chrome-stable
# Versions: 128.0.6613.137-1
# Dependencies:
# - dpkg (>= 1.14.0)
# - ca-certificates
# - fonts-liberation
# - libasound2 (>= 1.0.17)
# - libatk-bridge2.0-0 (>= 2.5.3)
# - libatk1.0-0 (>= 2.2.0)
# - libatspi2.0-0 (>= 2.9.90)
# - libc6 (>= 2.17)
# - libcairo2 (>= 1.6.0)
# - libcups2 (>= 1.7.0)
# - libcurl3-gnutls
# - libcurl3-nss
# - libcurl4
# - libcurl3
# - libdbus-1-3 (>= 1.9.14)
# - libdrm2 (>= 2.4.75)
# - libexpat1 (>= 2.1~beta3)
# - libgbm1 (>= 17.1.0~rc2)
# - libglib2.0-0 (>= 2.39.4)
# - libgtk-3-0 (>= 3.9.10)
# - libgtk-4-1
# - libnspr4 (>= 2:4.9-2~)
# - libnss3 (>= 2:3.35)
# - libpango-1.0-0 (>= 1.14.0)
# - libvulkan1
# - libx11-6 (>= 2:1.4.99.1)
# - libxcb1 (>= 1.9.2)
# - libxcomposite1 (>= 1:0.4.4-1)
# - libxdamage1 (>= 1:1.1)
# - libxext6
# - libxfixes3
# - libxkbcommon0 (>= 0.5.0)
# - libxrandr2
# - wget
# - xdg-utils (>= 1.0.2)

# Step 4: Install or upgrade a package from the local repository
sudo apt install google-chrome-stable

