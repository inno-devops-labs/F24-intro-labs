# Summary of Git Merge Strategies

## Standard Merge
Combines two branches by creating a new merge commit in main branch.
The new node of commit will have two parents from both branches.
It shows complete git history, but it might become too messy and complex.

## Squash and Merge
Combines all commits from a feature branch into a one single commit into the main branch.
Provides clean linear git history, by reducing the number of commits. But we lose the detailed commit history.  
Might have some problems with reverting changes in squashed commits.

## Rebase and Merge
Removes commits from a feature branch onto the base branch tip, making the commit history linear.


## Conclusion
The standard merge strategy is often preferred in collaborative environments because it preserves the complete history of changes, 
making it easier to track project development and resolve conflicts. 
Squash and rebase have their advantages in terms of maintaining a cleaner and linear commit history, 
bt=ut they can also introduce complexity and potential issues in resolving conflicts, reverting changes and tracking the whole project history. 
Therefore, the common choice is standard merge strategy, as it's not that complex and easier to navigate through.
