# Containers Lab - Docker

In this lab, you will gain hands-on experience with Docker, a popular containerization platform. You will perform various tasks related to Docker containers, such as listing and pulling images, running containers, and creating custom images. Follow the tasks below to complete the lab assignment.

## Task 1: Container Management

**Objective**: Manage Docker containers and images.

1. **List Containers**:
   - Use the appropriate command to list the Docker containers present in your environment.

     ```sh
     docker ps -a
     ```

   - Document the command used and provide the output in a Markdown file named `submission8.md` in the lab folder.

2. **Pull Latest Ubuntu Image**:
   - Use the appropriate command to pull the latest Ubuntu image from the Docker registry.

     ```sh
     docker pull ubuntu:latest
     ```

   - Document the command used in the same `submission8.md` file.

3. **Run Container**:
   - Use the appropriate command to run a container using the Ubuntu image you just pulled.

     ```sh
     docker run -it --name ubuntu_container ubuntu:latest
     ```

   - Document the command used and any relevant details about the container in the same `submission8.md` file.

4. **Remove Image**:
   - Attempt to remove the Ubuntu image you pulled earlier.

     ```sh
     docker rmi ubuntu:latest
     ```

   - Document the command used and the outcome of the removal process in the same `submission8.md` file.

## Task 2: Image and Container Operations

**Objective**: Perform operations on Docker images and containers.

1. **Create Image Archive**:
   - Pull the latest Ubuntu image and create an archive file from it.

     ```sh
     docker save -o ubuntu_image.tar ubuntu:latest
     ```

   - Document the commands used in a Markdown file named `submission8.md` in the lab folder.
   - Compare the size of the archive file with the size of the original image. Explain any differences, if present, in the same `submission8.md` file.

2. **Run Nginx Container**:
   - Use the appropriate command to run a container using the Nginx web server image:
     - Bind the container's port 80 to the local port 80.
     - Run the container in detached mode and name it `nginx_container`.

     ```sh
     docker run -d -p 80:80 --name nginx_container nginx
     ```

   - Verify that the web server is running and accessible from the local machine.

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
     docker cp index.html nginx_container:/usr/share/nginx/html/index.html
     ```

4. **Create Custom Image**:
   - Create a custom Docker image from the running container and name it `my_website`.
   - Tag the container with the `latest` tag.

     ```sh
     docker commit nginx_container my_website:latest
     ```

5. **Remove Original Container**:
   - Remove the original container (`nginx_container`) and verify that it has been successfully removed.

     ```sh
     docker rm -f nginx_container
     ```

6. **Create New Container**:
   - Create a new container using the custom image you've created (the same way as the original container).

     ```sh
     docker run -d -p 80:80 --name my_website_container my_website:latest
     ```

7. **Test Web Server**:
   - Use the `curl` command to access the web server at `127.0.0.1:80`.

     ```sh
     curl http://127.0.0.1:80
     ```

8. **Analyze Image Changes**:
   - Use the `docker diff` command to analyze the changes made to the new image.

     ```sh
     docker diff my_website_container
     ```

   - Explain the output of the `docker diff` command in the `submission8.md` file.

### Guidelines

- Use proper Markdown formatting and structure for the documentation files.
- Organize the files within the lab folder using appropriate naming conventions.
- Create a Pull Request to the main branch of the repository with your completed lab assignment.

> Note: Actively explore Docker container management and image operations to gain practical experience with containerization.
