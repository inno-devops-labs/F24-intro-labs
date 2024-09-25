# Containers Lab - Docker

## Task 1: Container Management

1. **List Containers**:
   - Use the appropriate command to list the Docker containers present in your environment.

     ```sh
     > docker ps -a

     CONTAINER ID   IMAGE          COMMAND                  CREATED       STATUS                        PORTS                     NAMES
     4de8e2ea4754   ipfs/go-ipfs   "/sbin/tini -- /usr/…"   3 weeks ago   Exited (255) 12 seconds ago   0.0.0.0:4001->4001/tcp, 0.0.0.0:5001->5001/tcp, 4001/udp, 0.0.0.0:8080->8080/tcp, 8081/tcp   ipfs_host
     ```

2. **Pull Latest Ubuntu Image**:
   - Use the appropriate command to pull the latest Ubuntu image from the Docker registry.

     ```sh
     > docker pull ubuntu:latest
     latest: Pulling from library/ubuntu
     dafa2b0c44d2: Pull complete
     Digest: sha256:dfc10878be8d8fc9c61cbff33166cb1d1fe44391539243703c72766894fa834a
     Status: Downloaded newer image for ubuntu:latest
     docker.io/library/ubuntu:latest
     
     What's next:
        View a summary of image vulnerabilities and recommendations → docker scout quickview ubuntu:latest
     ```

3. **Run Container**:
   - Use the appropriate command to run a container using the Ubuntu image you just pulled.

     ```sh
     > docker run -it --name ubuntu_container ubuntu:latest
     root@9fc82bc5c76a:/#
     # So, the ubuntu container ran successfully
     ```

4. **Remove Image**:
   - Attempt to remove the Ubuntu image you pulled earlier.

     ```sh
     # Firstly, I exited from the ubuntu interface
     > docker rmi ubuntu:latest
     Error response from daemon: conflict: unable to remove repository reference "ubuntu:latest" (must force) - container 9fc82bc5c76a is using its referenced image b1e9cef3f297
     # This signalize that I cannot remove an image because it is assosiated with the existing container.
     # So, to remove an image, I need to remove a container at first
     ```

## Task 2: Image and Container Operations

1. **Create Image Archive**:
   - Pull the latest Ubuntu image and create an archive file from it.

     ```sh
     > docker save -o ubuntu_image.tar ubuntu:latest
     ```

   - Compare the size of the archive file with the size of the original image. Explain any differences, if present, in the same `submission8.md` file.
     ```sh
     > docker images --format "{{.Repository}}:{{.Tag}} {{.Size}}"
     ubuntu:latest 78.1MB
     # Archieve is 76.8MB
     ```
    
     The slight difference in size between the Docker image and the archive file can be because of the metadata and other information might be exclusion or different compression, leading to a smaller archive file size.

2. **Run Nginx Container**:
   - Use the appropriate command to run a container using the Nginx web server image:
     - Bind the container's port 80 to the local port 80.
     - Run the container in detached mode and name it `nginx_container`.

     ```sh
     > docker run -d -p 80:80 --name nginx_container nginx
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
     8d560e3ab050c81282a5586ecf638ab19c8c64d7c4c9db455591694f8d0902a9
     ```

   - Verify that the web server is running and accessible from the local machine.

     I went to the [local webpage](http://localhost:80) and saw the following:
     ```
     Welcome to nginx!
     If you see this page, the nginx web server is successfully installed and working. Further configuration is required.

     For online documentation and support please refer to nginx.org.
     Commercial support is available at nginx.com.

     Thank you for using nginx.
     ```

     So, everything is working fine :)

3. **Create HTML File**:
   - Create an HTML file with the specified content:

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

   - Copy the HTML file to the container at the appropriate location to serve as an index file.

     ```sh
     > docker cp index.html nginx_container:/usr/share/nginx/html/index.html
     Successfully copied 2.05kB to nginx_container:/usr/share/nginx/html/index.html 
     ```

4. **Create Custom Image**:
   - Create a custom Docker image from the running container and name it `my_website`.
   - Tag the container with the `latest` tag.

     ```sh
     > docker commit nginx_container my_website:latest
     sha256:6253153087d510e3fa39dfe39b430c8a75c44eb8511582c52a3cad4536a24ce9
     ```

5. **Remove Original Container**:
   - Remove the original container (`nginx_container`) and verify that it has been successfully removed.

     ```sh
     > docker rm -f nginx_container
     nginx_container
     > docker ps
     CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
     {nothing}
     ```

6. **Create New Container**:
   - Create a new container using the custom image you've created (the same way as the original container).

     ```sh
     > docker run -d -p 80:80 --name my_website_container my_website:latest
     8e5d12542d94d2a86855841f98ad3d4711d80ec9e63bc88e8a3231191d42ce06
     ```

7. **Test Web Server**:
   - Use the `curl` command to access the web server at `127.0.0.1:80`.

     ```sh
     > curl http://127.0.0.1:80
     # content is the same as in index.html file I've made earlier
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
   - Use the `docker diff` command to analyze the changes made to the new image.

     ```sh
     > docker diff my_website_container
     C /etc
     C /etc/nginx
     C /etc/nginx/conf.d
     C /etc/nginx/conf.d/default.conf
     C /run
     C /run/nginx.pid
     ```

   - Explain the output of the `docker diff` command in the `submission8.md` file.

     The /etc/nginx/conf.d/default.conf file is the default configuration file for Nginx, which was created when the container was started.

     The /run/nginx.pid file is created to store the PID of the Nginx master process, it is necessary for Nginx to manage its processes.