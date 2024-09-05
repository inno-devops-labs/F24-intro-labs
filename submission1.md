# Task 1: SSH Commit Signature Verification
Signing Git commits ensures they come from a trusted source. 
Unsigned commits allow any author to be stated, making it unclear who made the changes. 
By cryptographically signing commits, authorship is verified, and GitHub shows a "Verified" tag. 
If the author is incorrect, 
GitHub still allows the commit but marks it as "Unverified."

# Task 2: Merge Strategies in Git
1. Standard Merge\
Adds all commits from the source branch to the target branch with a merge commit, preserving the full commit history.
This strategy is often preferred in collaborative environments. 
Firstly, it is easy contribution of each author, 
because the history of individual commits is saved.
Secondly, the point of merge is being stored, thus it is convenient to see the history of adding specific features.
    - Pros: 
      - Preserves individual commit history.
      - Tracks the point of merge, making it easier to revert changes.
    - Cons: 
      - Can clutter the history, especially when a linear history is preferred. 

2. Squash and Merge\
Combines all commits from a feature branch into a single commit before merging.
This strategy can be used when it is not important to save all individual commits from the source branch, 
and it is more important to maintain clear change history.
    - Pros:
      - Maintains a cleaner, simplified history.
      - Still tracks the feature merge point.
    - Cons: 
      - Loses individual commit history in the target branch.

3. Rebase and Merge\
Reapplies commits from the source branch directly to the target branch, avoiding a merge commit.
    - Pros:
      - Maintains a linear history.
    - Cons: 
      - Does not track the merge point, making it harder to revert changes.