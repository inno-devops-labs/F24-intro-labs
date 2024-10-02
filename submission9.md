# Task 1

1. In my repository I created a new file: ```.github/workflows/github-actions-demo.yml```
2. Pushed the following YAML contents into the ```github-actions-demo.yml``` file:
   ```
   name: GitHub Actions Demo
   run-name: ${{ github.actor }} is testing out GitHub Actions 🚀  
   on: [push]
   jobs:
     Explore-GitHub-Actions:
       runs-on: ubuntu-latest
       steps:
      - run: echo "🎉 The job was automatically triggered by a ${{ github.event_name }} event."
      - run: echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!"
      - run: echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ${{ github.repository }}."
      - name: Check out repository code
        uses: actions/checkout@v4
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
      - run: echo "🖥️ The workflow is now ready to test your code on the runner."
      - name: List files in the repository
        run: |
          ls ${{ github.workspace }}
      - run: echo "🍏 This job's status is ${{ job.status }}."

3. Clicked commit changes and then, in the "Propose changes" dialog, selected the option to create a new branch and start a pull request.
   
4. Viewed my workflow results:

   ![изображение](https://github.com/user-attachments/assets/3f60a12a-a94e-46e1-8a10-20e1e49f0d31)

   ![изображение](https://github.com/user-attachments/assets/022efe87-df0a-40b4-9836-18f569fde330)


5. Observation:
   - The pipeline successfully executed upon pushing the changes
   - No errors encountered
   - The pipeline automatically runs for each push to the main branch
   - GitHub Actions provide detailed logs for each step


# Task 2

1. In repository, particulary, in lab9 branch, i created a new file: ```.github/workflows/main.yml``` with following content (I changed ```        workflow_dispatch:``` line and add some lines for including the gathering system information:
   ```
   name: GitHub Actions Demo

   on:
   push:
       branches:
         - lab9  
        workflow_dispatch: 
   jobs:
   build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Gather system information
        run: |
          echo "System information:"
          uname -a
          lscpu
          free -h
          df -h
   ```


2. After that, I navigated to the Actions tab in my repository to observe the workflow execution.
   
   ![изображение](https://github.com/user-attachments/assets/0bd8da4f-69c1-4318-a2f8-d050120e6963)

   ![изображение](https://github.com/user-attachments/assets/519d715d-e050-4cf0-afc2-f4d1938f28ad)


3. Observations:
   - No errors encountered
   - The workflow was triggered successfully upon the push

4. Commands to gather system information:

   ```
   uname -a: Displays system information
   lscpu: Shows CPU architecture information
   free -h: Provides memory usage statistics
   df -h: Displays disk space usage
   ```

5. Output:

   - System information:
  
     Linux fv-az1108-283 6.8.0-1014-azure #16~22.04.1-Ubuntu SMP Thu Aug 15 21:31:41 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

   - CPU Information:

     ![изображение](https://github.com/user-attachments/assets/c147fa92-266c-4b8b-b179-04cb43eda16e)

   - Memory Usage:
  
     ![изображение](https://github.com/user-attachments/assets/1dd43389-8f40-4890-8fb2-6800bf355b63)

   - Disk Space Usage:
  
     ![изображение](https://github.com/user-attachments/assets/4cb37e3d-ea49-443b-8b98-2304a93446fb)


