# Task 1: Container Management
## Command:
```bash
docker ps -a
```
## Output:
```bash
CONTAINER ID   IMAGE          COMMAND                  CREATED       STATUS                   PORTS     NAMES
6e2d7ec7c464   ipfs/go-ipfs   "/sbin/tini -- /usr/…"   3 weeks ago   Exited (0) 3 weeks ago             ipfs_host
```
## Command:
```bash
docker pull ubuntu:latest

```
## Output:
```bash
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete 
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest

```
## Command:
```bash
docker run -it --name ubuntu_container ubuntu:latest

```
## Output:
```bash
root@dcf7783c691c:/# 
```
## Command:
```bash
docker rmi ubuntu:latest

```
## Output:
```bash
Untagged: ubuntu:latest
Untagged: ubuntu@sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Deleted: sha256:b1e9cef3f2977f8bdd19eb9ae04f83b315f80fe4f5c5651fedf41482c12432f7
Deleted: sha256:b15b682e901dd27efdf436ce837a94c729c0b78c44431d5b5ca3ccca1bed40da
```
# Task 2: Image and Container Operations
## Command:
```bash
docker images            
docker pull ubuntu:latest  
docker save -o ubuntu_image.tar ubuntu:latest  
```
## Output:
```bash
REPOSITORY     TAG       IMAGE ID       CREATED        SIZE
ipfs/go-ipfs   latest    2eac8d47ed7d   3 months ago   95.1MB
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete 
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```
## Command:
```bash
docker images ubuntu:latest
```
## Output:
```bash
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    b1e9cef3f297   4 weeks ago   78.1MB

```
## Command:
```bash
docker run -d -p 80:80 --name nginx_container nginx
```
## Output:
```bash
unable to find image 'nginx:latest' locally
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
a961ff3eac61f95d63ff2a104a44016d07a7d35be822a4e4a94363561ab945e7
```
## Command:
```bash
docker cp index.html nginx_container:/usr/share/nginx/html/index.html

```
## Output:
```bash
Successfully copied 2.05kB to nginx_container:/usr/share/nginx/html/index.html
```
## Command:
```bash
docker commit nginx_container my_website:latest
```
## Output:
```bash
sha256:691d942d01a459b668ea6021862b4d8f07bb6693e900d1f98f7e843a1123a1e9
```
## Command:
```bash
docker rm -f nginx_container
```
## Output:
```bash
nginx_container
```
## Command:
```bash
docker run -d -p 80:80 --name my_website_container my_website:latest
```
## Output:
```bash
9c268c3ea6eae0c14438cb88f0ddf6a704c62de7bc11f75f47b9e0505ee9ebe8
```
## Command:
```bash
curl http://127.0.0.1:80
```
## Output:
```bash
<html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>
```
## Command:
```bash
docker diff my_website_container

```
## Output:
```bash
C /run
C /run/nginx.pid
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
```

### Docker Diff Command Output Summary


- **`/run`**: The runtime directory has been modified. It typically contains runtime data like PID or socket files.
  
- **`/run/nginx.pid`**: The NGINX PID file has been altered, indicating a change in the process ID of the NGINX service.

- **`/etc`**: The system-wide configuration directory has been changed.

- **`/etc/nginx`**: The NGINX configuration directory has been modified.

- **`/etc/nginx/conf.d`**: This subdirectory, which stores additional NGINX configuration files (like site-specific settings), has been modified.

- **`/etc/nginx/conf.d/default.conf`**: The default NGINX configuration file has changed.

In summary, the container shows changes to NGINX configuration files and runtime data, affecting how NGINX operates within the container.

