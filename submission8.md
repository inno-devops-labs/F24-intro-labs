# Containerization

### listing the containers
![alt text](listing.png) 

### Latest ubuntu version
![alt text](image.png)

### Running the ubuntu container
![alt text](image-1.png)

### Attempting to remove the container
![alt text](image-2.png)

Alternative: Deleting from the GUI

![alt text](image-3.png)

# Image and Container operations
### Saving the ubuntu image
> docker save -o ubuntu_image.tar ubuntu:latest
size of the tar file: `09/26/2024  14:37        80,630,784 ubuntu_image.tar`
almost double the size of the original image 

### Running nginx container
![alt text](image-8.png)

### using the image container to display an html file:

![alt text](image-9.png)

![alt text](image-10.png)

![alt text](image-11.png)

![alt text](image-12.png)

![alt text](image-13.png)

![alt text](image-14.png)


From the documentation:

![alt text](image-15.png)

Based on the output of docker diff, we can see that no files were added or deleted. Furthermore, we see the list of files that have been modified.