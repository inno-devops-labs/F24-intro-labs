# Task 1: Container Management

1) List all running containers
```
❯ sudo docker ps -a                 
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

no running containers found

2) Pull Latest Ubuntu Image
```
❯ sudo docker pull ubuntu:latest            
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete 
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

The command docker pull ubuntu:latest fetches the latest version of the official Ubuntu image from Docker Hub and downloads it to your local machine. Here's a breakdown:

    docker pull: The command to download images from Docker Hub or other Docker registries.
    ubuntu: The name of the image, in this case, Ubuntu.
    latest: The tag specifying the version of the image to pull. latest refers to the most recent stable version.

3) Run Container
 ```
❯ sudo docker run -it --name ubuntu_container ubuntu:latest                         
   root@438506bc573e:/# 
```
The command `docker run -it --name ubuntu_container ubuntu:latest` creates and starts a new Docker container from the Ubuntu image, allowing interactive terminal access

4) Remove Image
```
❯ sudo docker rmi ubuntu:latest
Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container 438506bc573e is using its referenced image b1e9cef3f297
```
The command docker rmi ubuntu:latest removes the Ubuntu image with the latest tag. 

To handle the error, I have to force the removal of the image
```
❯ sudo docker stop 438506bc573e
438506bc573e
❯ sudo docker rm 438506bc573e
438506bc573e
❯ sudo docker rmi ubuntu:latest
Untagged: ubuntu:latest
Untagged: ubuntu@sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Deleted: sha256:b1e9cef3f2977f8bdd19eb9ae04f83b315f80fe4f5c5651fedf41482c12432f7
Deleted: sha256:b15b682e901dd27efdf436ce837a94c729c0b78c44431d5b5ca3ccca1bed40da
```

# Task 2: Image and Container Operations

1) Create Image Archive
- Pull the latest Ubuntu image and create an archive file from it.

```
❯ sudo docker pull ubuntu:latest  

sudo docker save -o ubuntu_image.tar ubuntu:latest
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete 
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

The command docker save -o ubuntu_image.tar ubuntu:latest saves the specified Docker image to a file in tar format

- Compare the size of the archive file with the size of the original image
```
~ ❯ sudo docker images              
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    b1e9cef3f297   4 weeks ago   78.1MB
~ ❯ ls -lh ubuntu_image.tar
Permissions Size User Date Modified Name
.rw-------   81M root 26 Sep 22:26   ubuntu_image.tar
```

The size of the saved image is slightly larger than the original image. It happens because the saved image (probably) contains metadata.

2) Run Nginx Container
```
~ ❯ sudo docker run -d -p 80:80 --name nginx_container nginx             
Unable to find image 'nginx:latest' locally
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
fdbd7762ed9a83301e0fbac64ca492a9b5e963954a766c201a5b6873d89c5879
```

The command `docker run -d -p 80:80 --name nginx_container nginx` runs an NGINX container in detached mode with port mapping.

- Verification of NGINX Container

To verify that the container is running, use the command `docker ps`:
```
❯ sudo docker ps                                          
CONTAINER ID   IMAGE     COMMAND                  CREATED              STATUS              PORTS                               NAMES
fdbd7762ed9a   nginx     "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:80->80/tcp, :::80->80/tcp   nginx_container
```

To verify that the container is accessible, we can open `http://localhost:80` in the browser.

The other way is `curl`:
```
❯ curl http://localhost
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
...
```

3) Create HTML File:
I have created HTML file with the following content
```
<html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>
```

Next, I put it to the container with `docker cp index.html nginx_container:/usr/share/nginx/html/index.html`
```
❯ sudo docker cp index.html nginx_container:/usr/share/nginx/html/index.html
Successfully copied 2.05kB to nginx_container:/usr/share/nginx/html/index.html
```

4) Create Custom Image
I have created a custom Docker image from the running container
```
❯ sudo docker commit nginx_container my_website:latest                                                                     
sha256:286966490d3f8490ac21ececf052c601603eff955781a727ddde168fe5c94fa3
```

5) Remove Original Container
```
❯ sudo docker rm -f nginx_container                                               
nginx_container
```

6) Create New Container
```
❯ sudo docker run -d -p 80:80 --name my_website_container my_website:latest                            
f5785932775463192a12b1c3b05d188337dec5ecebd51af65890adb4711973e7
```

7) Test Web Server
```
❯ curl curl http://127.0.0.1:80                
curl: (6) Could not resolve host: curl
<html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>
```

The result is the html file I have created.

8) Analyze Image Changes
```
sudo docker diff my_website_container                                                                    
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
C /run
C /run/nginx.pid
```

The command `sudo docker diff my_website_container` displays the changes made to the container compared to the original image it was created from. 
C indicates that the file was changed