### Signing commits
The reasons to use signing commits can be summarized into the following concepts:
1. Personality validation. Verifying the fact that a commit was made by an exact person. In other words, a random person cannot commit to someone's public repository, but your collaborator can set his name and email in a git configuration to fake his personality. Commit signing provides a mechanism to protect your ID through the SSH key.
2. Authorship validation. All the codes changes you can see are really done by a mentioned in a commit person. The code has not been tampered with. There can be no undetected attempts to modify the commit content, history, or authorship. 
3. Best practices. Commit signing is a standard that many organizations follow to provide security and trust.
4. Status. As it was mentioned in 'Best practices', 'Verified' flag can tell us about a serious approach of developers. Signed commits maintain a high level of trust and professionalism, all commits are made by a trusted source.
5. Responsibility. It is crucial for big projects to know a commit's creator. Signed commits provide links from each change to a verified collaborator, thus nobody can frame a colleague.
6. Security. Signed commits are a protection from hacker attacks that try to insert/delete a dangerous code. Such attacks cannot be implemented while a commit has to be verified.
To sum up, commit signing is a good practice, especially for large projects and companies, to **protect and confirm your code and to guarantee its reliability and security.**

---

The information was taken from [here](https://docs.gitbutler.com/features/virtual-branches/signing-commits) and [here](https://withblue.ink/2020/05/17/how-and-why-to-sign-git-commits.html)

---

### Merge strategies

A merge is the process of integrating changes from one branch into another. Since git supports branching for working in separate areas of a project, merge is the crucial for collaboration among developers. There are 3 main merge strategies:

**Standard merge:** combines 2 branches be creating a merge commit - a new commit on the target branch. Each commit from the second branch is added them too the history of the base branch based on the timestamp.

Advantages:
 - The most descriptive and verbose history. All individual commits from the feature branch are retained that gives the best context about code changes.
 - Conflict resolution. Possible conflicts are addressed and recorded in the merge commit and the resolution is much easier.
 
Disadvantages:
 - Long history. If the branching has started a lot of time ago, the history may become complex that’s more difficult to read.
 - Mess. There might be situations when commits happen too often or they are not really important and are there only for the history. Typos fixing for example doesn't bring a lot of meaning to the code. Thus, debugging can be more challenging due to the extra commits.

Preferred:
 Organizations that want to track each individual change and prioritizes transparency and teams that value complete commit history for debugging. Standard merge provides a `complete` record of when branches diverged and merged, which is especially important when multiple collaborators works on the same code, because understanding the full context of changes is critical for them. Moreover, as it was mentioned, conflicts must be resolved once in a merge commit and not for each commit.


**Squash and merge:** combines (squashes) all commits from a feature branch into a single commit before merging. That commit is then added to the history, but none of the commits that made up the branch are preserved.

Advantages:
 - The cleanest history. It doesn’t carry over the commit history from the feature branch, only one commit is added to the base branch. Useful when you want to make it easier to track and find changes *if needed*.
 - Easy tracking. Cumulative changes made by a feature branch in a single commit are easier to track.

Disadvantages:
 - Lost developing process. Detailed history is removed, thus multiple stages of development cannot be tracked and checked.
 - Conflict resolution is harder. 

Preferred:
 When the process doesn't require a detailed commit history, but the readability and simple log are prioritezed. Also, small branches for various purposes that don't bring a lot of sense to the final project can be merged by squashing.

**Rebase and merge:** reapplies commits from a feature branch *onto* the base branch. It will take where the second branch was created and move that point to the last commit into the base branch, then reapply the commits on top of those changes. 

Advantages:
 - Clean and consistent history. The history is linear and free from "merge commits".
 - Rebase helps identify conflicts sooner, as they are resolved while replaying the changes onto the target branch.

Disadvantages:
 - Impossible to capture branch creating and merging.
 - Difficult to see which commits relate to which PR / branch

Preferred:
 Use rebase when updating a feature branch that is not shared with others. If developers' aim is to keep history without merge commits but obtain commits' detailes. It keeps the branch history clean and easier to manage.


---

The information was taken from [here](https://docs.github.com/ru/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/about-pull-request-merges), [here](https://lukemerrett.com/different-merge-types-in-git/), and [here](https://medium.com/@shikha.ritu17/git-rebase-vs-merge-vs-squash-choosing-the-right-strategy-for-version-control-a9c9bb97040e)

---