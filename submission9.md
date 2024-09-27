## Task 1
I already had some experience with GitHub Actions during the summer semester, so I made this guide pretty easy.

![image](https://github.com/user-attachments/assets/ec7f303c-b466-4fa5-8558-f16641ee43db)


## Task 2

1) **Configure a Manual Trigger:**
     To use manual trigger I added new job called 'add-manual-trigger:'. It uses enviromental variable 'manual' to be run.
2) **Gather System Information:**
     I added new job to the workflow that do three things to check some information about os and hardware of th host machine:
   ```
      - name: Check os version
        run: lsb_release -a
      - name: Check hardware information
        run: lspci
      - name: Check disk information
        run: sudo fdisk -l
    ```
this job gives me the following output:
![image](https://github.com/user-attachments/assets/9c42846f-71d9-4b44-85a3-41a9a7bb2e6e)
