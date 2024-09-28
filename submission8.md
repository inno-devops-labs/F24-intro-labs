## Task 1: Container Management


1. **List Containers**:
     ```sh
     docker ps -a
     ```
   ![img.png](Images/img.png)
2. **Pull Latest Ubuntu Image**:
     ```sh
     docker pull ubuntu:latest
     ```
    ![img_1.png](Images/img_1.png)
3. **Run Container**:
     ```sh
     docker run -it --name ubuntu_container ubuntu:latest
     ```
4. **Remove Image**:
     ```sh
     docker rmi ubuntu:latest
     ```
    ![img_2.png](Images/img_2.png)
    So firstly we need to remove the container first, and then we will be able to remove the image

## Task 2: Image and Container Operations

1. **Create Image Archive**:

     ```sh
     docker save -o ubuntu_image.tar ubuntu:latest
     ```

   Archived file size - 76.8 MiB. The original image size - 78.1MiB. The difference in, obviously, because of compression.
2. **Run Nginx Container**:
     ```sh
     docker run -d -p 80:80 --name nginx_container nginx
     ```
    ![img_3.png](Images/img_3.png)

3. **Create HTML File**:
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
     ```sh
     docker cp index.html nginx_container:/usr/share/nginx/html/index.html
     ```
   
    ![img_4.png](Images/img_4.png)

4. **Create Custom Image**:s
     ```sh
     docker commit nginx_container my_website:latest
     ```
    ![img_5.png](Images/img_5.png)
5. **Remove Original Container**:
     ```sh
     docker rm -f nginx_container
     ```
   ![img_6.png](Images/img_6.png)
   ![img_7.png](Images/img_7.png)

6. **Create New Container**:
     ```sh
     docker run -d -p 80:80 --name my_website_container my_website:latest
     ```
   ![img_8.png](Images/img_8.png)
7. **Test Web Server**:
     ```sh
     curl http://127.0.0.1:80
     ```
   ![img_9.png](Images/img_9.png)
8. **Analyze Image Changes**:
     ```sh
     docker diff my_website_container
     ```
   ![img_10.png](Images/img_10.png)

   As we can see, there are only changes in default config of nginx and its pid, other differences are related to the directory changes because of changes in this files.