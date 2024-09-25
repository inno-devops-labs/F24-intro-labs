# Introduction to DevOps Lab 8
## Ruslan Izmailov B22-DS-01 

### Task 1: Container Management

```sh
> docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

It is empty as recently I did ```docker system prune``` 

Pulling the image: 
```sh
> docker pull ubuntu:latest     
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete 
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

Verifying: 
```sh 
> docker images -a
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    b1e9cef3f297   4 weeks ago   78.1MB
```             

Running the container: 
```sh
> docker run -it --name ubuntu_container ubuntu:latest

> root@821d26035910:/# whoami
root

> exit
```

Removing the image: 
```sh 
> docker rmi ubuntu:latest
Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container 821d26035910 is using its referenced image b1e9cef3f297

> docker ps -a
CONTAINER ID   IMAGE           COMMAND       CREATED         STATUS                          PORTS     NAMES
821d26035910   ubuntu:latest   "/bin/bash"   4 minutes ago   Exited (2) About a minute ago             ubuntu_container

> docker rm 821d26035910   
821d26035910

> docker rmi ubuntu:latest
Untagged: ubuntu:latest
Untagged: ubuntu@sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Deleted: sha256:b1e9cef3f2977f8bdd19eb9ae04f83b315f80fe4f5c5651fedf41482c12432f7
Deleted: sha256:b15b682e901dd27efdf436ce837a94c729c0b78c44431d5b5ca3ccca1bed40da

> docker images 
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```

