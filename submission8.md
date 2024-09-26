# Task 1

## List Containers

```sh
#command
docker ps -a
```
    
![alt text](image.png)

## Pull Latest Ubuntu Image:

```sh
#command
docker pull ubuntu:latest

#output
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview ubuntu:latest
```

## Run Container:

```sh
#command
docker run -it --name ubuntu_container ubuntu:latest
```

```sh
root@840b413901b0:/# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@840b413901b0:/# cd home
root@840b413901b0:/home# ls
ubuntu
```

### Processor

```sh
#command
lscpu

#output
Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         48 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  8
  On-line CPU(s) list:   0-7
Vendor ID:               AuthenticAMD
  Model name:            AMD Ryzen 3 5300U with Radeon Graphics
    CPU family:          23
    Model:               104
    Thread(s) per core:  2
    Core(s) per socket:  4
    Socket(s):           1
    Stepping:            1
    BogoMIPS:            5190.08
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid
                          extd_apicid pni pclmulqdq ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext perfctr_core s
                         sbd ibrs ibpb stibp vmmcall fsgsbase bmi1 avx2 smep bmi2 rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 clzero xsaveerptr arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists
                          pausefilter pfthreshold v_vmsave_vmload umip rdpid
Virtualization features:
  Virtualization:        AMD-V
  Hypervisor vendor:     Microsoft
  Virtualization type:   full
Caches (sum of all):
  L1d:                   128 KiB (4 instances)
  L1i:                   128 KiB (4 instances)
  L2:                    2 MiB (4 instances)
  L3:                    4 MiB (1 instance)
Vulnerabilities:
  Gather data sampling:  Not affected
  Itlb multihit:         Not affected
  L1tf:                  Not affected
  Mds:                   Not affected
  Meltdown:              Not affected
  Mmio stale data:       Not affected
  Retbleed:              Mitigation; untrained return thunk; SMT enabled with STIBP protection
  Spec rstack overflow:  Mitigation; safe RET
  Spec store bypass:     Mitigation; Speculative Store Bypass disabled via prctl and seccomp
  Spectre v1:            Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:            Mitigation; Retpolines, IBPB conditional, STIBP always-on, RSB filling, PBRSB-eIBRS Not affected
  Srbds:                 Not affected
  Tsx async abort:       Not affected
  ```

- Architecture: x86_64
- Logical Processors: 8(4 cores and 2 threads for each core)
- Model: AMD Ryzen 3 5300U with Radeon Graphics
- Virtualization: AMD-V

### Memory

```sh
#command
free -h

#output
               total        used        free      shared  buff/cache   available
Mem:            11Gi       1.0Gi       9.7Gi       4.4Mi       916Mi        10Gi
Swap:          3.0Gi          0B       3.0Gi
```

- Total Memory: 11 GB
- Used Memory: 1 GB
- Free Memory: 9.7 GB
- Swap: 3 GB(0 is used)

## Remove Image:

```sh
#command
docker rmi ubuntu:latest

#output
Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container 840b413901b0 is using its referenced image b1e9cef3f297
```

Image cannot be removed while the container are running

# Task 2

## Create Image Archive

```sh
docker save -o ubuntu_image.tar ubuntu:latest
```

- Image size

    Image size is 78.1MB
    
    ```sh
    #command
    docker images ubuntu:latest

    #output
    REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
    ubuntu       latest    b1e9cef3f297   4 weeks ago   78.1MB
    ```

- Archive file

    Archive size is 76.8 MB

    ![alt text](image-1.png)

I think the size difference is due to the peculiarity of different data formats, such as compression and metadata

## Run Nginx Container

```sh
#command to ran container
docker run -d -p 80:80 --name nginx_container nginx
```

Web server was running
![alt text](image-2.png)

## Create HTML File

Created file my_site.html with code

```sh
<html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>
```

```sh
#command to move html file to container
docker cp my_site.html nginx_container:/usr/share/nginx/html/index.html

#output
Successfully copied 2.05kB to nginx_container:/usr/share/nginx/html/index.html
```

## Create Custom Image

```sh
#command
docker commit nginx_container my_website:latest
```

## Remove Original Container

```sh
#command to remove container
docker rm -f nginx_container

#output
nginx_container
```

```sh
#command to check all containers(removed must be missed)
docker ps -a

#output
CONTAINER ID   IMAGE               COMMAND                  CREATED         STATUS                      PORTS     NAMES
840b413901b0   ubuntu:latest       "/bin/bash"              3 hours ago     Exited (130) 3 hours ago              ubuntu_container
d50ecc8d28f0   ipfs/go-ipfs        "/sbin/tini -- /usr/…"   3 weeks ago     Exited (0) 2 weeks ago                ipfs_host
72a76d98b0f4   myrustapp:latest    "Textyle"                2 months ago    Exited (101) 2 months ago             competent_cohen
e3afc5881708   my_image:latest     "/usr/local/bin/serv…"   3 months ago    Exited (0) 3 hours ago                crazy_sammet
```

## Create New Container

```sh
#command
docker run -d -p 80:80 --name my_website_container my_website:latest

#output
2e5f47881e8a036ea543d6b7f31851bf6e5ccf48c8d6cb5d91118616e61a8487
```

## Test Web Server

```sh
#command
curl http://127.0.0.1:80

#output
StatusCode        : 200
StatusDescription : OK
Content           : <html>
                    <head>
                    <title>The best</title>
                    </head>
                    <body>
                    <h1>website</h1>
                    </body>
                    </html>
RawContent        : HTTP/1.1 200 OK
                    Connection: keep-alive
                    Accept-Ranges: bytes
                    Content-Length: 92
                    Content-Type: text/html
                    Date: Thu, 26 Sep 2024 17:35:53 GMT
                    ETag: "66f59904-5c"
                    Last-Modified: Thu, 26 Sep 2024 17...
Forms             : {}
Headers           : {[Connection, keep-alive], [Accept-Ranges, bytes], [Content-Length, 92], [Content-Type, text/html]...}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        : mshtml.HTMLDocumentClass
RawContentLength  : 92
```

## Analyze Image Changes

```sh
#command
docker diff my_website_container

#output
C /run
C /run/nginx.pid
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
```

Command display a changed, added or deleted files