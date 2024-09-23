# Task 1: VM Deployment

## Install VirtualBox

1. **Download and Install VirtualBox:**
   - Downloaded VirtualBox from the official VirtualBox website.
   - Installed the latest version.

2. **VirtualBox Version:**
   - Version: 7.0.10

### Deploy a Virtual Machine

1. **Create a New VM:**
   - Opened VirtualBox and clicked on "New" to create a new VM.
   - Named the VM "Ubuntu lab 7".
   - Selected "Linux" as the type and "Ubuntu 22.04 LTS (Jammy Jellyfish) (64-bit)" as the version.
   ![](imgs/img1.jpg)

2. **Customize VM Settings:**
   - **Memory:** Allocated 2048 MB of RAM.
   - **CPU Cores:** Assigned 1 CPU core.
  
   ![](imgs/img2.jpg)

3. **Steps Followed:**
   - Created and configured a virtual hard disk (VDI) with a dynamically allocated size of 25 GB.
   - Mounted the Ubuntu ISO file in the storage settings.
   - Started the VM and followed the Ubuntu installation process.
   ![](imgs/img3.jpg)
   ![](imgs/img4.jpg)
   ![](imgs/img5.jpg)
   ![](imgs/img6.jpg)
   ![](imgs/img7.jpg)
4. **Screenshot of Running VM:**
   ![UbuntuVM Running](imgs/img8.jpg)

## Task 2: System Information Tools

### Processor, RAM, and Network Information

1. **Tool for Displaying Processor Information:**
   - **Tool Name:** `lscpu`
   - **Command Used:** `lscpu`
   - **Output:**
     ![Processor Information](imgs/img9.jpg)
     ![Processor Informaiton 2](imgs/img10.jpg)

2. **Tool for Displaying RAM Information:**
   - **Tool Name:** `free`
   - **Command Used:** `free -h`
   - **Output:**
     ![RAM Information](imgs/img11.jpg)

3. **Tool for Displaying Network Information:**
   - **Tool Name:** `ip`
   - **Command Used:** `ip -a`
   - **Output:**
     ![Network Information](imgs/img12.jpg)

4. **Tool for Additional Network Information:**
   - **Tool Name:** `net-tools`
   - **Installation Command:** `sudo apt install net-tools`
   - **Command Used:** `ifconfig`
   - **Output:**
     ![Additional Network Information](imgs/img13.jpg)

### Operating System Specifications

1. **Tool for Displaying Operating System Specifications:**
   - **Tool Names:** `lsb`, `lsb_release`
   - **Commands Used:** `lsb`, `lsb_release -a`

2. **Outputs:**
   ![](imgs/img14.jpg)

3. **Additional OS Information:**
   - **Command Used:** `uname -a`
   - **Output:**
     ![](imgs/img15.jpg)
