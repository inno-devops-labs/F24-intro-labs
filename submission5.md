# Task 1

1. I ran 'htop' command to monitor applications using CPU and memory:
   ![изображение](https://github.com/user-attachments/assets/49a058cd-9e6b-44ac-9b16-b7b2b922507a)

-  Top 3 most consuming applications for CPU:
      ![изображение](https://github.com/user-attachments/assets/10bd999e-3ff7-4e27-b23e-0a82bf1299ef)

- Top 3 most consuming applications for memory:
      ![изображение](https://github.com/user-attachments/assets/20badad9-60ad-4f1d-9a8d-a28b830e7246)
      ![изображение](https://github.com/user-attachments/assets/c35fe5e6-7357-4480-977f-9aba72b67d0e)
      ![изображение](https://github.com/user-attachments/assets/533296ad-51ae-4651-b201-e6399d9a46ce)

2. I ran 'iostat' command to monitor applications using I/O:
  ![изображение](https://github.com/user-attachments/assets/b046c7b2-1d9a-4d31-9697-11e484b062d1)

- Top 3 most consuming applications for I/O:
    ![изображение](https://github.com/user-attachments/assets/c9021829-2750-4357-ab27-830d5ecbf21e)
    ![изображение](https://github.com/user-attachments/assets/c9a7d074-153f-48e0-b78f-90f689bc55dc)
    ![изображение](https://github.com/user-attachments/assets/0e2c69c0-65a9-4483-9a40-d8dbb208caf1)

3. I used 'du' and 'df' to manage disk space and identify the top 3 largest file in the '/var' directory:

   ```sh
   sudo du -ah /var | sort -rh | head -n 3
   ```

   Output:
   
   ![изображение](https://github.com/user-attachments/assets/b78889cf-b448-4424-bdaf-3d40e4ee2598)

## Conclusion:
- CPU usage:  The desktop environment (GNOME) is the primary CPU consumer, which might need optimization or monitoring, especially if it consistently uses a high percentage of the CPU.
- Memory usage: The GNOME desktop environment and Firefox are the most significant memory consumers, with GNOME taking a larger share.
- I/O usage: Firefox is the most I/O-intensive application due to its browser-related activities.
- Disk space management:
  
    /var (5.7 GB): The /var directory, which stores variable data like logs, caches, and spool files, is the largest.
  
    /var/lib (4.0 GB): This subdirectory responsible for system libraries and application data.
  
    /var/lib/snapd (3.6 GB): This subdirectory responsible for installed Snap applications.


# Task 2

1. Firstly, I installed terraform to Windows following the instructions
2. I opened and ran Docker.
3. Created a lab5 repository create a file called main.tf
4. Initialize the project, which downloads a plugin called a provider that lets Terraform interact with Docker:

   ![изображение](https://github.com/user-attachments/assets/660d2092-afad-49ad-8bd9-ee0e5ea18654)


5. Created the NGINX server with 'terraform apply'
6. Checked the existence of container:

   ![изображение](https://github.com/user-attachments/assets/77085b9d-3947-4a56-a1a9-8af190002fee)

7. Did some checks:

   ![изображение](https://github.com/user-attachments/assets/6582509f-d707-4d4c-ba58-d52e24f20419)


8. According to the tutorial, I changed external port to 8080 instead of 8000, ran the command 'terraform apply':

   ![изображение](https://github.com/user-attachments/assets/002ba363-89ba-4c44-9722-cb611e53a3b1)

9. I ran the 'terraform destroy':

    ![изображение](https://github.com/user-attachments/assets/279f26d3-bdb9-4868-b0bf-27425ad521b7)

10. Created a new file called variables.tf with a block defining a new container_name variable
11. In main.tf, updated the docker_container resource block to use the new variable

   ![изображение](https://github.com/user-attachments/assets/0e9cecaa-da03-4a7f-8dae-2928d0f66aa0)

12. Created a file called outputs.tf
13. Ran the 'terraform apply' command:

   ![изображение](https://github.com/user-attachments/assets/d6885c2f-9734-4db1-8772-3e916bc186b9)

14. I destroyed infrastructure:

    ![изображение](https://github.com/user-attachments/assets/1c03e9bd-a456-4791-9ae7-4ae2fe26fcd3)


