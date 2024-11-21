# Task 1
## The benefits of signing commits
- Signing commits with a keys GPG/SSH/S/MIME allows other people to verify that the commits actually came from you.
- Signed commits help organizations meet different requirements by providing a clear, verifiable trail of changes.
- By using GPG or SSH keys, especially with vigilant mode enabled, you add a layer of protection against intruders. Vigilant mode ensures that all commits from authorized contributors are verified, that allows to save all data and ensure repository security.

# Task 2
## Comparison of merge strategies
- 1. Standard Merge: used when preserving the full history, maintaining a full commit record, and working in a collaborative environment where different developers need to contribute without rewriting the history.
- Pros: 
	Maintains the complete history of all branches
	Shows a clear timeline of when branches were merged
	Best for preserving the context of development over time
- Cons:
	It can result in a more cluttered and confusing commit history due to the addition of numerous merge commits

- 2. Squash and Merge: used for merging feature branches with numerous small commits, resulting in a cleaner main branch history.
- Pros:
	Produces a cleaner commit history by reducing multiple small commits into one
	Very suitable for feature branches with many small, incremental commits
- Cons:
	losing information about when specific changes were originally made and who authored the squashed commits
	If you continue working on the head branch of a pull request after squashing and merging, and then create a new pull request between the same branches, commits that you previously squashed and merged will be listed in the new pull request. You may also have conflicts that you have to repeatedly resolve in each successive pull request.
- 3. Rebase and Merge: used to maintain a clean and linear project history, especially in projects with strict commit rules.
- Pros:
	Maintains a linear commit history without extra merge commits.
	Helps avoid merge conflicts if used correctly.
- Cons:
	Contributors must carefully rebase, resolve conflicts, and force-push to avoid overwriting others' work before using the rebase and merge option on GitHub.
	Rebase and merge on GitHub bypasses commit signature verification because GitHub cannot sign commits without access to the user's private signing keys.
	