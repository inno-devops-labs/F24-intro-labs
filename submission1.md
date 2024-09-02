# Introduction to DevOps Lab 1
## Ruslan Izmailov B22-DS-01 

### Benefits of signing commits 
Commits signature verification exists to give confidence that commit is done by authenticated person and we can trust it.
The verified commit signature means that a trusted/developer has signed the commit and the signature has been verified.


### Merge strategies comparison
* __Standard Merge__
  __\+__ Preserves the complete history of both branches.

  __\+__ Maintains a clear and detailed record of changes.

  __\-__ May introduce merge conflicts that need to be resolved manually.

* __Squash and Merge__ 
  __\+__ Keeps the commit history clean (as it combines all changes in 1 commit). 

  __\+__ Simplifies the review process by presenting all changes from a feature branch in a single commit.

  __\-__ Loses the detailed history of the feature branch. 


* __Rebase and Merge__
  __\+__ Avoids the "merge commit" clutter, what makes commit history clean.
 
  __\-__ Rewrites commit history, which can cause issues in the group work.

  __\-__ May lead to complex conflicts that need to be resolved during the rebase process.

### Why the standard merge strategy is often preferred. 
* Keeps a complete and detailed change records, which is crucial for debugging purposes. 

* Saves the information about individual commits, making it easier to understand the development process.

* Allows the group of developers to work on different branches and then merge their changes without loosing their work.