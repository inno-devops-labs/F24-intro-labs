# Task 1. Container Management

1. ``docker ps -a`` - list all containers in my environment
```
CONTAINER ID   IMAGE          COMMAND                  CREATED       STATUS                   PORTS     NAMES
a648f3dfcb21   39286ab8a5e1   "/docker-entrypoint.…"   8 days ago    Exited (0) 7 days ago              ExampleNginxContainer
c6585e711fe0   ipfs/go-ipfs   "/sbin/tini -- /usr/…"   3 weeks ago   Exited (0) 2 weeks ago             ipfs_host
```

2. ``docker pull ubuntu:latest`` - pull the latest Ubuntu image from the Docker registry.
```
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete 
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

3. ``docker run -it --name ubuntu_container ubuntu:latest`` - run a container

The container is running:

```
root@ba9cf04330cf:/# 
root@ba9cf04330cf:~# printf 675        
675root@ba9cf04330cf:~# exit
exit
```

4. ``docker rmi ubuntu:latest`` - 

```
Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container ba9cf04330cf is using its referenced image b1e9cef3f297
```
Also, I cannot run the container again because: 'The container name "/ubuntu_container" is already in use by container "ba9cf04330cfece3d07bbfc20253179b398870c63e2f76715f7243faf5249a30". You have to remove (or rename) that container to be able to reuse that name'. However, I can force docker to do it: ``docker rmi -f ubuntu:latest``.

# Task 2. 

1. ``docker save -o ubuntu_image.tar ubuntu:latest`` - create image archive

    - Question: Compare the size of the archive file with the size of the original image. Explain any differences.

``docker images``:

```
REPOSITORY             TAG           IMAGE ID       CREATED         SIZE
ubuntu                 latest        b1e9cef3f297   4 weeks ago     78.1MB
nginx                  latest        39286ab8a5e1   6 weeks ago     188MB
... etc ...
```
>To correct: I still don't understand why the 'CREATED' column shows '4 weeks ago', but the 'my_website' image that will be created further is 'CREATED' 16 minutes ago.

``ls -lh ubuntu_image.tar``
```
-rw------- 1 anastasia anastasia 77M Sep 26 22:42 ubuntu_image.tar
```
The original Ubuntu image size is 78.1 MB and the archived is 77 M. The difference in size could be due to Docker’s layer storage format (differences in layers of image and tar.) and the archive might not contain some of the internal metadata (what is most probably in my case, because the difference is quite small).

2. ``docker run -d -p 80:80 --name nginx_container nginx`` - run a container using the Nginx web server image, binding the container’s port 80 to the host’s port 80 in detached mode with 'nginx_container' name.
```
3b3413b2c2d6aaf57559a024902d6dab0ec40cdaa6eab8b886144e425ca150fd
```
Verifying:

``curl http://127.0.0.1:80``: if the server is running correctly, the default Nginx welcome page in the output should appear:
```
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
Also, I can check the web-page:

<img src="https://raw.githubusercontent.com/caxapb/New/main/data/nginx.jpg" alt="CPU" width="500"/>


3. The original repository contains 'index.html' from the very beginning of the course. Thus, I decided to leave it as it is:
```
<!DOCTYPE html> 
<!-- You can modify it as you wish -->
<html>
<head>
    <title>My Simple Website</title>
</head>
<body>
    <h1>Welcome to My Simple Website</h1>
    <p>This is the content of the folder.</p>
    <ul>
        <li>File 1</li>
        <li>File 2</li>
        <li>File 3</li>
    </ul>
</body>
</html>
```

``docker cp index.html nginx_container:/usr/share/nginx/html/index.html`` - copy the HTML file (index.html) to the container
```
Successfully copied 2.05kB to nginx_container:/usr/share/nginx/html/index.html
```

4. ``docker commit nginx_container my_website:latest`` - custom image from the running container
```
sha256:9ce2095c217d6af2d12ddc0e7811ba3d67437a8ade8949fc6f4c4c4c8c2c96ea
```

5. ``docker rm -f nginx_container`` - remove the original container:
```
nginx_container
```

6. ``docker run -d -p 80:80 --name my_website_container my_website:latest`` - new container creation
```
391e7ec776f7c4fbd08079e579c7c0f22afbc90097fa221184fcd6e63d50974c
```

7. ``curl http://127.0.0.1:80`` - access the web server at 127.0.0.1:80 - gives the same contant as index.html - everything works
```
<!DOCTYPE html> 
<!-- You can modify it as you wish -->
<html>
<head>
    <title>My Simple Website</title>
</head>
<body>
    <h1>Welcome to My Simple Website</h1>
    <p>This is the content of the folder.</p>
    <ul>
        <li>File 1</li>
        <li>File 2</li>
        <li>File 3</li>
    </ul>
</body>
</html>⏎     
```

8. ``docker diff my_website_container`` - changes made to the new image:
```
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
C /run
C /run/nginx.pid
```

Analyzis: C - defines 'changed' mode. The file default.conf is the default Nginx file for defining how the server handles requests by default. The change indicates that the file was modified (what exactly happened - new HTML file). The nginx.pid is the Process ID (PID) of the running Nginx service. This change indicates that the PID file was created or updated, which is expected behavior when the Nginx service starts within the container. 


