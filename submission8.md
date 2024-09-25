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

### Task 2: Image and Container Operations

#### Create image archive: 
```sh
> docker pull ubuntu:latest
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete 
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest

> docker save -o ubuntu_image.tar ubuntu:latest  
```

#### Run        Nginx container: 
```sh 
> docker pull nginx:latest
latest: Pulling from library/nginx
a2318d6c47ec: Pull complete 
095d327c79ae: Pull complete 
bbfaa25db775: Pull complete 
7bb6fb0cfb2b: Pull complete 
0723edc10c17: Pull complete 
24b3fdc4d1e3: Pull complete 
3122471704d5: Pull complete 
Digest: sha256:04ba374043ccd2fc5c593885c0eacddebabd5ca375f9323666f28dfd5a9710e3
Status: Downloaded newer image for nginx:latest
docker.io/library/nginx:latest

> docker run -d -p 80:80 --name nginx_container nginx
65d8f3570711946e88c231f0ae3702fe4f71a7c600e35e43e3e031ac0f28b1fd

> docker ps 
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                               NAMES
65d8f3570711   nginx     "/docker-entrypoint.…"   13 seconds ago   Up 12 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   nginx_container  

> curl localhost:80
        <!DOCTYPE html>
        <html>
        <head>
        <title>Welcome to nginx!</title>
        <style>
        html { color-scheme: light dark; }
        body { width: 35em; margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif; }
        </style>
        </head>
        <body>
        <h1>Welcome to nginx!</h1>
        <p>If you see this page, the nginx web server is successfully installed and
        working. Further configuration is required.</p>

        <p>For online documentation and support please refer to
        <a href="http://nginx.org/">nginx.org</a>.<br/>
        Commercial support is available at
        <a href="http://nginx.com/">nginx.com</a>.</p>

        <p><em>Thank you for using nginx.</em></p>
        </body>
        </html>
``` 

#### Create HTML File: 
```sh 
> docker cp index.html nginx_container:/usr/share/nginx/html/index.html
Successfully copied 2.05kB to nginx_container:/usr/share/nginx/html/index.html

> curl localhost:80
        <html>
        <head>
        <title>The best</title>
        </head>
        <body>
        <h1>website</h1>
        </body>
        </html>
```

#### Create custom image: 
```sh
> docker commit nginx_container my_website:latest
sha256:350851bf87eb0873e9e2ba6a791630bc9264ded9ad4d82d79160a747b5aac35a 
```

#### Remove Original Container: 
```sh
> docker rm -f nginx_container
nginx_container
```

#### Create New Container:
```sh
> docker run -d -p 80:80 --name my_website_container my_website:latest  
cd00fd274db9433943379d22e06263b28f4156b0e10866d725de525b18a89963   
```

#### Test Web Server:
```sh 
> curl http://127.0.0.1:80  
        <html>
        <head>
        <title>The best</title>
        </head>
        <body>
        <h1>website</h1>
        </body>
        </html>
```


#### Analyze Image Changes:
```sh
> docker diff my_website_container
C /run
C /run/nginx.pid
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf    
```

Output shows that there are only changes in directories and files:      

```/etc/nginx/conf.d/default.conf``` - and 3 lines above shows that there was changed the config file of nginx (probably this config keeps the initial page data).      