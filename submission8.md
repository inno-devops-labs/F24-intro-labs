
# Containers Lab - Docker

## Task 1: Container Management

### 1. List Containers
Command: 
```bash
docker ps -a
```
Output:
```
CONTAINER ID   IMAGE          COMMAND                  CREATED       STATUS                     PORTS                                                                                        NAMES
cd64cf2242ad   195245f0c792   "/docker-entrypoint.…"   6 days ago    Exited (0) 6 days ago                                                                                                   nginx-server
0e03778e7ac3   ubuntu         "/bin/bash"              2 weeks ago   Exited (129) 2 weeks ago                                                                                                crazy_golick
f3e968633e3f   debian         "bash"                   2 weeks ago   Exited (255) 6 days ago                                                                                                 debian-repo
10706b425200   ipfs/go-ipfs   "/sbin/tini -- /usr/…"   3 weeks ago   Exited (255) 2 weeks ago   0.0.0.0:4001->4001/tcp, 0.0.0.0:5001->5001/tcp, 4001/udp, 0.0.0.0:8080->8080/tcp, 8081/tcp   ipfs_host
```

### 2. Pull Latest Ubuntu Image
Command: 
```bash
docker pull ubuntu:latest
```
Output: 
```
latest: Pulling from library/ubuntu
6e59cb05818e: Pull complete 
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

### 3. Run Container
Command: 
```bash
docker run -it --name ubuntu_container ubuntu:latest
```
Details: Exited the container and returned to the host terminal to execute further commands.

### 4. Remove Image
Commands: 
```bash
docker stop ubuntu_container
docker rm ubuntu_container
docker rmi ubuntu:latest
```
Outcome: Image removed successfully.

---

## Task 2: Image and Container Operations

### 1. Create Image Archive
Command: 
```bash
docker save -o ubuntu_image.tar ubuntu:latest
```
Output: `ls -lh ubuntu_image.tar` shows:
```
-rw-------  1 arseny0304  staff    98M Sep 26 16:42 ubuntu_image.tar
```
The original image size was around 101MB, but the archive file might be slightly smaller due to compression.

### 2. Run Nginx Container
Command: 
```bash
docker run -d -p 80:80 --name nginx_container nginx
```
Verification using `curl http://127.0.0.1` showed the default Nginx welcome page.

### 3. Create HTML File and Copy to Container
Created `index.html` with the required content, then copied it to the container:
```bash
docker cp index.html nginx_container:/usr/share/nginx/html/index.html
```
Verification using `curl http://127.0.0.1` showed the updated webpage content:
```html
<html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>
```

### 4. Create Custom Image
Command: 
```bash
docker commit nginx_container my_website:latest
```
Output: 
```
sha256:06e22ad38d229d6ac8468acbef77810cf6252b29a8b7808f6636cad32799c55d
```

### 5. Remove Original Container
Commands: 
```bash
docker stop nginx_container
docker rm nginx_container
```
Outcome: Successfully removed the original container.

### 6. Create New Container Using Custom Image
Command: 
```bash
docker run -d -p 80:80 --name my_website_container my_website:latest
```
Verification using `curl http://127.0.0.1` displayed the correct HTML content.

### 7. Analyze Image Changes
Command: 
```bash
docker diff my_website_container
```
Output:
```
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
C /run
C /run/nginx.pid
```
Explanation: The `C` (changed) indicates changes in the configuration files and runtime data for Nginx.

---

### Conclusion

All tasks have been completed successfully, and the custom web server is running correctly using the Docker container.
