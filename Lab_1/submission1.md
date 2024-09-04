# Task 1: Introduction to DevOps with Git


Commits signature is really valuable thing. It ensures:
1. Authenticity verification - the author is verified and commit belongs to the author

2. Integrity assurance - the content of commit didn't change after signification

3. Prevention of unathorized changes - if the practice of project require signed commits, unathorized users cannot change trusted commits.


# Task 2: Merge Strategies in Git


1. **Standard Merge** Combines two branches by creating a merge commit. 

It's easier to understand global history with context. Therefore it's useful for collaborative environments (to understand sequence and relationship between commits)

But it leads to a cluttered commit history including "merge commits" wich are meaningful.

2. **Squash and Merge** combines all commits from a feature branch into a single commit before merging. 

It has two main purposes: cleaner history in main branch (when you make only one commit instead of severals), and when you make little changes for one task and commiting everything (you can make one commit, instead of severals). 

However, authors of original commits may disapear. Moreover, it can be hard to debug or understand development process.

3. **Rebase and Merge** reapplies commits from a feature branch onto the base branch, which leads to a linear history and avoidance of merge commits.

Since it rewrites commit history and commit hashes, you must use "git push force" to apply changes. IT'S VERY DANGEROUS, and can complicate problemns in collaboration. Therefore, you shouldn't use it on collaboratibe branches.

#### The cost of making mistakes in large teams is expensive, so it's preferable to use simple merge strategy with its cons. Rebase is very bad for this purpose. Additionally, merge saves history of both commits, leading to transparency and understanding of the code. While, squash removes it.
