### Task 1: Container Management

1. **List Containers**:
   - Command:
     ```sh
     docker ps -a
     ```
   - Output:
     ```sh
     CONTAINER ID   IMAGE          COMMAND                  CREATED       STATUS                      PORTS                                                                                        NAMES
     4ba3ec462744   ipfs/go-ipfs   "/sbin/tini -- /usr/…"   2 weeks ago   Exited (255) 47 hours ago   0.0.0.0:4001->4001/tcp, 0.0.0.0:5001->5001/tcp, 4001/udp, 0.0.0.0:8080->8080/tcp, 8081/tcp   ipfs_host
     ```

2. **Pull Latest Ubuntu Image**:
   - Command:
     ```sh
     docker pull ubuntu:latest
     ```
   - Output:
     ```sh
     latest: Pulling from library/ubuntu
     dafa2b0c44d2: Pull complete
     Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
     Status: Downloaded newer image for ubuntu:latest
     ```

3. **Run Container**:
   - Command:
     ```sh
     docker run -it --name ubuntu_container ubuntu:latest
     ```
   - Details: The container started successfully, and I was dropped into the root shell. I explored the file system and ran some commands:
     
    ```
    root@068780de9ed4:/# ls
    bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
    root@068780de9ed4:/# apt update
    ...
    root@068780de9ed4:/# exit
    exit
    ```

    

4. **Remove Image**:
   - Command:
     
   - Initial Attempt Outcome: The image couldn't be removed because it was being used by a running container.
     ```
     C:\Users\test>docker rmi ubuntu:latest
     Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container 068780de9ed4 is using its referenced image b1e9cef3f297
     ```
   - Fix: After removing the container with:
     ```sh
     docker rm 068780de9ed4
     ```
   - The image was successfully deleted:
     ```sh
     Untagged: ubuntu:latest
     Untagged: ubuntu@sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
     ```

### Task 2: Image and Container Operations

1. **Create Image Archive**:
   - Command:
     ```sh
     docker save -o ubuntu_image.tar ubuntu:latest
     ```
   - It turned out that the weight of the archived image was the same as the weight of the image itself (78.1MB)

2. **Run Nginx Container**:
   - Command:
     ```sh
     docker run -d -p 80:80 --name nginx_container nginx
     ```
   - The Nginx image was automatically pulled, and container ran successfully.

3. **Create HTML File and Copy**:
   - Command:
     ```sh
     docker cp index.html nginx_container:/usr/share/nginx/html/index.html
     ```

4. **Create Custom Image**:
   - Command:
     ```sh
     docker commit nginx_container my_website:latest
     ```

5. **Remove Original Container**:
   - Command:
     ```sh
     docker rm -f nginx_container
     ```

6. **Create New Container**:
   - Command:
     ```sh
     docker run -d -p 80:80 --name my_website_container my_website:latest
     ```

7. **Test Web Server**:
   - Command:
     ```sh
     curl http://127.0.0.1:80
     ```
   - Output:
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

8. **Analyze Image Changes**:
   - Command:
     ```sh
     docker diff my_website_container
     ```
   - Output:
     ```sh
     C /run
     C /run/nginx.pid
     C /etc
     C /etc/nginx
     C /etc/nginx/conf.d
     C /etc/nginx/conf.d/default.conf
     ```

---
