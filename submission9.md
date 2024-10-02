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

1. In repository, particulary, 
