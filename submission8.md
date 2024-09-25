# Task 1

1. I launched Docker
2. Ran the command that lists the Docker containers present in my environment:
   ```sh
   docker ps -a
   ```

   Output:
   
   ![изображение](https://github.com/user-attachments/assets/7af70406-9f53-4b3a-8c61-29c596de0ce2)

3. Pulled the latest Ubuntu image from the Docker registry:
   ```sh
   docker pull ubuntu:latest
   ```

   Output:
   
   ![изображение](https://github.com/user-attachments/assets/eb8d6e20-6fd2-4831-a7bb-16af1c9f181c)

4. Ran container using the Ubuntu image:
   ```sh
   winpty docker run -it --name ubuntu_container ubuntu:latest
   ```

   Output:
   
   ![изображение](https://github.com/user-attachments/assets/f20860d2-bfe2-4ada-9d47-dd69fa7e5c5b)

   ![изображение](https://github.com/user-attachments/assets/876a9708-e8da-4b6d-b6b0-8172b248a4f3)

5. I tried to remove the Ubuntu image:
   ```sh
   docker rmi ubuntu:latest
   ```

   Output:
   
   ![изображение](https://github.com/user-attachments/assets/633d67fe-6e7b-4b09-b9d0-8bc39f71cd7e)

   Commands to remove the Ubuntu image:
   
   ![изображение](https://github.com/user-attachments/assets/466b97e9-0003-4045-9756-c4a6f4f0c385)


# Task 2

1. I pulled the latest Ubuntu image and created an archive file:
   ```sh
   docker pull ubuntu:latest
   docker save -o ubuntu_image.tar ubuntu:latest
   ```


   Then, compared the size of the ubuntu_image.tar archive file with the original image:

   Command to check the size of the archive:
   
   ```sh
   ls -lh ubuntu_image.tar
   ```


   Command to check the image size:
   ```sh
   docker images | grep ubuntu
   ```

   Outputs:

   ![изображение](https://github.com/user-attachments/assets/8f5cffa0-914f-4c1d-9059-23b6426bba4f)

   So, archive file size: 77 MB, original image size: 78.1 MB.
   
   There is some minor difference attributed to file system differences and the lack of compression in the docker save archive.
   
2. Ran Nginx container:

   Command:
   ```sh
   docker run -d -p 80:80 --name nginx_container nginx
   ```

   Output:

   ![изображение](https://github.com/user-attachments/assets/edd06446-a66c-450e-9f94-9b903636c94d)

   Verifying:

   ![изображение](https://github.com/user-attachments/assets/fecb32f0-56b9-4b3d-a369-b6db4d4bc3d6)

3. I created HTML file and copied it to the container, verifyied result:

   Command:
   ```sh
   docker cp index.html nginx_container:/usr/share/nginx/html/index.html
   ```

   ![изображение](https://github.com/user-attachments/assets/a10a6c78-df6f-4ba1-854f-1f36ed1afb15)


4. Created custom image:

   - created a custom Docker image from the running container and named it my_website:
     ```sh
     docker commit nginx_container my_website:latest
     ```

   Output:

   ![изображение](https://github.com/user-attachments/assets/76c375c1-f5ae-4942-b6d0-af56713b6a61)

   ![изображение](https://github.com/user-attachments/assets/a26e8254-a6da-4c83-bda6-4c4254058e97)


5. Removed the original container and verifyed that it has been successfully removed:

   Command:
   ```sh
   docker rm -f nginx_container
   ```

   Outputs/verifying:
   
   ![изображение](https://github.com/user-attachments/assets/9228fdce-f487-4ea7-9709-ef2efd85886d)


6. Created a new container using the custom image i have created:

   Command:
   ```sh
   docker run -d -p 80:80 --name my_website_container my_website:latest
   ```

   Output:
   
   ![изображение](https://github.com/user-attachments/assets/b1a18380-c5a1-4b9a-aeea-cceabd731d12)


7. Tested Web Server:

   Command:
   ```sh
   curl http://127.0.0.1:80
   ```

   Output:

   ![изображение](https://github.com/user-attachments/assets/aad1900a-432f-47b6-a9a4-6b5047e85021)

8. Analyzed Image Changes:

   Used the docker diff command to analyze the changes made to the new image:

   Output:
   
   ![изображение](https://github.com/user-attachments/assets/a5c3bf5c-7c75-4b0e-8830-76ca2eccd334)

   - **C** indicates that these files or directories were changed in the container compared to the original image.
     
   - /run/nginx.pid was created by Nginx to store its process ID after the web server was started.
     
   - The /etc/nginx/conf.d/default.conf was modified to apply the default Nginx configuration.
     
   - Other changes indicate that files and directories related to Nginx were updated when the container was run to configure and launch the web server.

