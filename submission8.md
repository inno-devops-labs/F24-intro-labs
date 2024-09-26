# Container management

```sh
> docker ps -a
```
```sh
CONTAINER ID   IMAGE          COMMAND                  CREATED       STATUS                     PORTS                                                                                                                                                 NAMES
3c13d7426b64   llm-backend    "/bin/sh -c 'exec uv…"   10 days ago   Exited (137) 10 days ago                                                                                                                                                         awesome_driscoll
c30574259a1c   ipfs/go-ipfs   "/sbin/tini -- /usr/…"   3 weeks ago   Exited (255) 3 weeks ago   0.0.0.0:4001->4001/tcp, :::4001->4001/tcp, 0.0.0.0:5001->5001/tcp, :::5001->5001/tcp, 4001/udp, 0.0.0.0:8080->8080/tcp, :::8080->8080/tcp, 8081/tcp   ipfs_host
0074825f8c81   ddf181ecb672   "/bin/sh -c 'exec uv…"   4 weeks ago   Exited (137) 4 weeks ago                                                                                                                                                         silly_margulis
222c425bc18e   f1be24995c6c   "/bin/sh -c 'poetry …"   4 weeks ago   Exited (1) 4 weeks ago                                                                                                                                                           musing_rubin
f63439c11b75   8451a566ffdc   "/bin/sh -c 'poetry …"   4 weeks ago   Exited (1) 4 weeks ago                                                                                                                                                           condescending_golick
3c0b0d7f9a29   36e354908777   "/bin/sh -c 'poetry …"   4 weeks ago   Exited (1) 4 weeks ago                                                                                                                                                           compassionate_bose
9d4cc63d8ee4   1cc734f90375   "/bin/sh -c 'poetry …"   4 weeks ago   Exited (1) 4 weeks ago                                                                                                                                                           awesome_thompson
9b445200fcff   56cfe24e10c0   "/bin/sh -c 'poetry …"   4 weeks ago   Exited (1) 4 weeks ago                                                                                                                                                           objective_wozniak
383f1267de5d   dbaccab72f51   "/bin/sh -c 'poetry …"   4 weeks ago   Exited (1) 4 weeks ago                                                                                                                                                           compassionate_sanderson
f6322ad4164b   a6a5dafd32f1   "/bin/sh -c 'poetry …"   4 weeks ago   Exited (1) 4 weeks ago                                                                                                                                                           bold_northcutt
493ac8e6d0aa   56cfe24e10c0   "/bin/sh -c 'poetry …"   4 weeks ago   Exited (1) 4 weeks ago                                                                                                                                                           intelligent_rhodes
929451b35701   43c87485cae0   "/bin/sh -c 'poetry …"   4 weeks ago   Exited (1) 4 weeks ago                                                                                                                                                           stupefied_kare
f00dad2f9464   513d6142b16f   "/bin/sh -c 'exec uv…"   5 weeks ago   Exited (137) 5 weeks ago                                                                                                                                                         wonderful_newton
86e4a42cedab   cba9b07a43db   "/bin/sh -c 'exec uv…"   5 weeks ago   Exited (137) 5 weeks ago                                                                                                                                                         stoic_wescoff
cd05267f9f24   78766a3e4030   "/bin/sh -c 'poetry …"   5 weeks ago   Exited (1) 5 weeks ago                                                                                                                                                           funny_banzai
61da85581758   f05318e9f4e2   "/bin/sh -c 'exec uv…"   5 weeks ago   Exited (137) 5 weeks ago                                                                                                                                                         recursing_tharp
e5c8658e0c0b   6b3ac221f3e6   "/bin/sh -c 'poetry …"   5 weeks ago   Exited (1) 5 weeks ago                                                                                                                                                           wizardly_blackwell
4bcdc6df03c9   bd125fa9208d   "/bin/sh -c 'poetry …"   5 weeks ago   Exited (1) 5 weeks ago                                                                                                                                                           thirsty_antonelli
aea239fc0eea   5e1788e51606   "/bin/sh -c 'exec uv…"   5 weeks ago   Exited (137) 5 weeks ago                                                                                                                                                         lucid_jennings
5dc089932e27   6b3ac221f3e6   "/bin/sh -c 'poetry …"   5 weeks ago   Exited (1) 5 weeks ago                                                                                                                                                           vigorous_black
b968d85638f0   dd6142ca39d7   "/bin/sh -c 'exec uv…"   5 weeks ago   Exited (137) 5 weeks ago                                                                                                                                                         exciting_johnson
154045fb8a2e   6f09f58e0426   "/bin/sh -c 'poetry …"   6 weeks ago   Exited (1) 6 weeks ago                                                                                                                                                           affectionate_euler
450e53239f30   f4c5dfa42560   "/bin/sh -c 'poetry …"   6 weeks ago   Exited (1) 6 weeks ago                                                                                                                                                           trusting_hoover
b3880e3bf380   9c994974c7c5   "/bin/sh -c 'poetry …"   6 weeks ago   Exited (1) 6 weeks ago                                                                                                                                                           suspicious_jones
e9c57c2c9c86   63eaae635f6b   "/bin/sh -c 'poetry …"   6 weeks ago   Exited (1) 6 weeks ago                                                                                                                                                           dreamy_elion
b4dd6b4fbce6   d74370aafd8c   "/bin/sh -c 'poetry …"   6 weeks ago   Exited (1) 6 weeks ago                                                                                                                                                           mystifying_black
7e5a80fb7ed7   df9062ae95c2   "/bin/sh -c 'exec uv…"   6 weeks ago   Exited (137) 6 weeks ago                                                                                                                                                         elated_mclean
88ce03aec7bb   856150ed756d   "/bin/sh -c 'poetry …"   6 weeks ago   Exited (1) 6 weeks ago                                                                                                                                                           adoring_beaver
c14d20914497   856150ed756d   "/bin/sh -c 'poetry …"   6 weeks ago   Exited (1) 6 weeks ago                                                                                                                                                           zealous_wilbur
948cf57d82ce   856150ed756d   "/bin/sh -c 'poetry …"   6 weeks ago   Exited (1) 6 weeks ago                                                                                                                                                           gifted_hodgkin
e3a32703a3ae   2a37d72f5f38   "/bin/sh -c 'poetry …"   6 weeks ago   Exited (1) 6 weeks ago                                                                                                                                                           sharp_robinson
```

As you can see I have a lot of unactive containers that need to be pruned later.

```sh
> docker pull ubuntu:latest
```
This command pulls the docker image of ubuntu which we can later run in Terminal with **no GUI**.
```sh
latest: Pulling from library/ubuntu
dafa2b0c44d2: Pull complete 
Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
```

Let's run it:

```sh
docker run -it --name ubuntu_container ubuntu:latest
```
This command run's the image and creates container, also transforming the current terminal in Ubuntu's container shell.

```sh
root@37932a3a1d75:/# whoami
root
root@37932a3a1d75:/# cat /etc/os-release 
PRETTY_NAME="Ubuntu 24.04.1 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.1 LTS (Noble Numbat)"
VERSION_CODENAME=noble
...
```
We can press Ctrl+D to exit.

Remove the image:

```sh
docker rmi ubuntu:latest
```

```sh
Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container 37932a3a1d75 is using its referenced image b1e9cef3f297
```

We can't remove the image when the container with that image is actively running.

## Image and Container operations

Pulling the ubuntu image and archiving it:

```sh
docker save -o ubuntu_image.tar ubuntu:latest
```

Let's compare file sizes:

```sh
> du -sh ubuntu_image.tar
```
```sh
77M     ubuntu_image.tar
```
And in docker hub we can inspect that docker image of ubuntu weights 28.37MB

#### Nginx

```sh
docker run -d -p 80:80 --name nginx_container nginx
```

Web server is up and running now at 0.0.0.0:80

```sh
docker cp index.html nginx_container:/usr/share/nginx/html/index.html
```

```sh
> docker commit nginx_container my_website:latest
```

```sh

sha256:f81d31885e81aee14c87e23040b70c1b6cf1f982a3aa287f417c37be57a84f2f
```

```sh
docker rm -f nginx_container
```

```sh
nginx_container
```

```sh
docker run -d -p 80:80 --name my_website_container my_website:latest
```
```sh
4be5c59b184a2211629f3990777c3fb3a5837b2f7bd2b810e27d2085eaa92e3a
```

```sh
curl http://127.0.0.1:80
```

```html
<html></html>
<head>
<title>The best</title>
</head>
<body>
<h1>website</h1>
</body>
</html>%
```

```sh
docker diff my_website_container
```

```sh
C /run
C /run/nginx.pid
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
```

"C" means the file or directory was changed. Since we modified the container, the differences shown are files that was changed in modification process.