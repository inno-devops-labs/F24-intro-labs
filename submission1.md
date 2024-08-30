### Task 1

Commits have author and committer. By default they are set to ones in git config but can be changed by the user. This way, a malicious user can add malware modifications under another person's name but commit signature verification helps to avoid this problem.

Therefore, the commits signing has the following benefits:

- solves the problem of impersonalization: the commit will not be marked as verified if it was made by the person who has not access to the private key of another person under who's name he/she would like to make the commit => helps distinguish a commit made by a real user from a commit possibly made by another user who has changed their info to someone else's.

- makes visible unauthorized changes of code: previous signature will become invalid after modifications of code allowing to detect suspicious changes.

- prevent the usage of existing commits in other undesirable contexts: sending verified commit to another context (for example, branch) will make it unverified.
