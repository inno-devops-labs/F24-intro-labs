### Task 1

Commits have author and committer. By default they are set to ones in git config but can be changed by the user. This way, a malicious user can add malware modifications under another person's name but commit signature verification helps to avoid this problem.

Therefore, the commits signing has the following benefits:

- solves the problem of impersonalization: the commit will not be marked as verified if it was made by the person who has not access to the private key of another person under who's name he/she would like to make the commit => helps distinguish a commit made by a real user from a commit possibly made by another user who has changed their info to someone else's.
- makes visible unauthorized changes of code: allows to detect suspicious changes.
- prevent the usage of existing commits in other undesirable contexts: sending verified commit to another context (for example, branch) will make it unverified.

### Task 2

**Merge strategy comparison**

1. **Standard merge** strategy adds commits from new (feature) branch into the source one with additional commit about merge. Useful when you want to save all history of changes made in the feature branch.

Advantages:

- Each small modification is visible in the history of commits.
- Does not rewrite the history, saves the histories of both branches, merging them using a new commit.

Disadvantages:

- The history can become too long (less readable) and it will be hard to find the needed modification in long-living branches.
- If changes are applied to both branches the history becomes tangled.

2. **Squash and merge strategy** joins the commits in the new branch into one commit before merging, adds it to the main branch creating an additional merge commit. Useful when the changes are small and insignificant (for example, formatting, correcting typos, etc.) and appropriate for small branсhes.

Advantages:

- Short, straight and clean history of main branch.

Disadvantages:

- Impossible to track the history of changes and their details made to the new (feature) branch because all changes are placed together in one commit before merging.

3. **Rebase and merge strategy** moves commits from the new (feature) branch at the end of the main branch without adding additional commit about merge. Useful when you want to add changes from a main branch into feature one if the main branch was updated.

Advantages:

- Clean and linear history.

Disadvantages:

- Increases the likelihood of merge conflict. If there is a conflict, it will have to be resolved for all commits that you want to rebase.
- The moved commit will be given a new identifier that may complicate the work of сontributors who used the original commit.
- The moved commit will have a different time of change than the original commit creation time.

**Why the standard merge strategy is often preferred in collaborative environments?**

In collaborative environments it is important to track each specific change to the project and the actions of each contributor to facilitate review procedure and project management.

Squash and merge strategy is not appropriate to the group work because of putting all commits from a feature branch into one and loosing the details of each small modification.

Rebase and merge strategy is also hard to implement in group projects when many people work on one branch at the same time. Because after you perform rebase and merge to shared branch, other collaborators who started working earlier will continue to work on the old version of the main branch and conflicts will occur when trying to merge their branches with main.

Since the standard merge strategy keeps track of each contrubutor's actions and all changes made in chronological order, therefore it is suitable for team work.
