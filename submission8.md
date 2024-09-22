# Task 1: Docker Container Management

## 1. List Containers

Command used:
```bash
docker ps -a
```

Output:
CONTAINER ID   IMAGE          COMMAND                  CREATED       STATUS                     PORTS                                                                                                                                                 NAMES
358b5dd0c1a6   ipfs/go-ipfs   "/sbin/tini -- /usr/…"   3 weeks ago   Exited (255) 3 weeks ago   0.0.0.0:4001->4001/tcp, :::4001->4001/tcp, 0.0.0.0:5001->5001/tcp, :::5001->5001/tcp, 4001/udp, 0.0.0.0:8080->8080/tcp, :::8080->8080/tcp, 8081/tcp   ipfs_host


## 2. Pull Latest Ubuntu Image

Command used:
```bash
docker pull ubuntu:latest
```

## 3. Run Container

Command used:
```bash
docker run -it --name ubuntu_container ubuntu:latest
```
Details:
This command runs an interactive Ubuntu container with the name "ubuntu_container". The -it flags allow for an interactive terminal session within the container. Upon execution, a new Ubuntu container was created and a bash shell prompt appeared, indicating successful entry into the container.

## 4. Remove Image

Command used:
```bash
docker rmi ubuntu:latest
```
Outcome:
Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container 4e8550c6e4da is using its referenced image b1e9cef3f297

The removal process failed because the image is currently in use by the container we just created. To successfully remove the image, we would first need to stop and remove the container, or use the -f flag to force removal.

# Task 2: Image and Container Operations

## 1. Create Image Archive

Commands used:
```bash
docker pull ubuntu:latest
docker save -o ubuntu_image.tar ubuntu:latest
ls -lh ubuntu_image.tar
docker images ubuntu:latest
```

Size comparison:
The ubuntu_image.tar file is 77MB, while the original ubuntu:latest image is 78.1MB.

Explanation: The slight difference in size is due to compression applied during the save process. The tar file contains only the essential layers of the image, while the loaded image in Docker includes additional metadata and is optimized for quick access.

## 2. Run Nginx Container

Command used:
```bash
docker run -d -p 80:80 --name nginx_container nginx
```
Verification:
```bash
curl http://localhost:80
```
Output showed the default Nginx welcome page, confirming the web server is running and accessible.

## 3. Create HTML File

HTML file content:
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
Command to copy file:
```bash
docker cp index.html nginx_container:/usr/share/nginx/html/index.html
```

## 4. Create Custom Image

Command used:
```bash
docker commit nginx_container my_website:latest
```
## 5. Remove Original Container

Commands used:
```bash
docker rm -f nginx_container
docker ps -a
```
Verification showed that the nginx_container was no longer listed.

## 6. Create New Container

Command used:
```bash
docker run -d -p 80:80 --name my_website_container my_website:latest
```
7. Test Web Server

Command used:
```bash
curl http://127.0.0.1:80
```
Output:
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
8. Analyze Image Changes

Command used:
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
Explanation: The docker diff command shows the changes made to the filesystem of the container compared to its base image. In this case:
    'C' indicates a file or directory was changed
The output shows that several directory files were  changed, which corresponds to our custom HTML file that we copied into the container.
