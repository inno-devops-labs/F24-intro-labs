## Summury on signed commits
The key point for using commit signature verification is to other people to know a person and a time when the commit was done. 
On Github there's three ways to sign commit: GPG or SSH those used by individual users or S/MIME that more suitable for big companies. 
Repository administrators can required commit signing on a branch to block unsigned commits.

## Summary on merge types
#### Standart merge
Combines two branches by creating a merge commit.
###### Advantages:
- Provides descriptive and verbose history that helps to have better understanding about code changes
- Allows us to see a graph of when branches were made using `git log --oneline --graph`
- no loss of granularity 
###### Disadvantages:
- Empty commits are created by merge operation can mess up the history a bit
- A graph can be too complex when we have a lot of branches
#### Squash & merge
Combines all commits from a feature branch into a single commit before merging.
###### Advantages:
- Keeps a very clean commit history
- Can look at a single commit to see a full piece of work, rather than shifting through multiple commits in the log
###### Disadvantages:
- Lost of granularity, any useful detail
#### Rebase & merge
Reapplies commits from a feature branch onto the base branch.
###### Advantages:
- Keeps a very clean commit history
- Keeps the individual commit granularity
###### Disadvantages:
- You have to rebase again if someone was to commit to the base branch before you get to merge
- Difficult to see which commits relate to which PR or branch

#### Why standart merge
Standart merge is often preferred in collaborative environments by the reason that it keeps more detailed change history than others. It is suit more for larger teams.