```bash
docker ps -a
CONTAINER ID   IMAGE                                                                                       COMMAND                  CREATED        STATUS
    PORTS     NAMES
b49207094245   vsc-overlord100-84508adbf0c8d486a69a5e02efb179cbd44173470da60b745aaf2c06d8f8a0ce            "/bin/sh -c 'echo Co…"   2 weeks ago    Exited (0) 8 days ago               objective_keldysh
80181a94d769   ipfs/go-ipfs                                                                                "/sbin/tini -- /usr/…"   3 weeks ago    Exited (0) 3 weeks ago              ipfs_host
cf187c1d2579   vsc-softoverlord100-fe14b5fb36b1276d0d5b05ca30160c794cdbf46fe336bdea84a4ce5b2e47b806        "/bin/sh -c 'echo Co…"   2 months ago   Exited (0) 2 months ago             hungry_booth
8d50f81e54b3   vsc-test_mobile_platform-2b4212f5b3f03561a55479599a56038bde5b32edf7b3034ab6e81d918188f692   "/bin/sh -c 'echo Co…"   3 months ago   Exited (0) 2 months ago             frosty_moser
```

```bash
docker pull ubuntu:latest
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

```bash
docker run -it --name ubuntu_container ubuntu:latest
root@438ef21b8676:/#
```

```bash
docker rmi ubuntu:latest
Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container 438ef21b8676 is using its referenced image b1e9cef3f297
```


```
docker save -o ubuntu_image.tar ubuntu:latest
```

```
Unable to find image 'nginx:latest' locally
a2318d6c47ec: Pull complete
bbfaa25db775: Pull complete
0723edc10c17: Pull complete
3122471704d5: Pull complete
Digest: sha256:04ba374043ccd2fc5c593885c0eacddebabd5ca375f9323666f28dfd5a9710e3
Status: Downloaded newer image for nginx:latest
c69d3223704adf3ea481ebfc27958f20d8341fb92088a8177b8519a1e97b265d
```

```
docker cp index.html nginx_container:/usr/share/nginx/html/index.html
Successfully copied 2.05kB to nginx_container:/usr/share/nginx/html/index.html
PS C:\Users\y_pod\Desktop\F24-intro-labs> docker commit nginx_container my_website:latest
sha256:9f0d88ea8342dffb4bda5fdda59227611f67991696eef16d63494117ccf878c6
```

```
docker rm -f nginx_container
```

```
docker run -d -p 80:80 --name my_website_container my_website:latest
8c547a7c455d4c6c01a39dcc1dfe3dd871fe78b135b3cd31856100919a653615
PS C:\Users\y_pod\Desktop\F24-intro-labs> docker diff my_website_container
C /run
C /run/nginx.pid
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
```

![1727349081596](image/submission8/1727349081596.png)
