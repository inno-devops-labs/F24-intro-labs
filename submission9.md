# Github Actions

## Task 1
#### First I created the directory and the actions file
![DEMO](demo_action.png)

##### I have also installed actions extension for vscode for easier management
![ext](vscodeExtension.png)

##### action was successful
![alt text](image.png)


#### now I documented the first steps and added images and pushed the changes
##### The actions were triggered and the workflow is running again
![alt text](image-1.png)

##### second actions run was also successful
![alt text](image-2.png)

## Task 2
#### adding a manual trigger
The `workflow_dispatch` event is added under on, allowing to manually trigger the workflow from the GitHub Actions tab.

![alt text](image-3.png)

#### adding tasks to gather system information
![alt text](image-4.png)

System information: The Gather system information step runs commands to retrieve:
* `uname -a`: Kernel and system architecture information.
* `lscpu`: CPU specifications.
* `free -h`: Memory usage.
* `df -h`: Disk usage.

#### Run was successful
![alt text](image-5.png)

![alt text](image-6.png)