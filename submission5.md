# Task 1

## Top 3 most consuming app
    
- **CPU**

    ![Alt text](image.png)

- **Memory**

    ![Alt text](image-1.png)

- **I/O usage**

    ![Alt text](image-2.png)

## The largest files in the /var directory

```sh
sudo find /var -type f -exec du -ah {} + | sort -rh | head -n 3   
```                              
         
    151M    /var/cache/pacman/pkg/libreoffice-still-7.5.5-3-x86_64.pkg.tar.zst
    105M    /var/lib/docker/overlay2/f6ef9412ad57fce8aadcd0b98d2b744695991e2c8edc1a5b22cac81b0b82768f/merged/usr/lib/x86_64-linux-gnu/libLLVM-14.so.1
    105M    /var/lib/docker/overlay2/5de112e375cb86a779db0fd8c6b05c1c3809b77fa8a2fcc7ac8d214ac40733a2/diff/usr/lib/x86_64-linux-gnu/libLLVM-14.so.1

## Analysis

- **CPU and Mem**

    ![Alt text](image-3.png)

    - There is a consistently low CPU usage
    - The system has a huge amount of RAM

- **Disk space**

    ![Alt text](image-4.png)
    
    The system has a lot of free disk space

# Task 2

- Terraform(IaC tool) allow users to describe and manage cloud and onpremises infrastructure

