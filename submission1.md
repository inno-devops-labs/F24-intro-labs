### Task 1

Commits have author and committer. By default they are set to ones in git config but can be changed by the user. This way, a malicious user can add malware modifications under another person's name but using commit signature verification helps to avoid this problem.

Therefore, the commits signing has the following benefits:

- solves the problem of impersonalization (the commit will not be marked as verified if it was made by the person who has not access to the private key of another person under who he would like to made the commit).
- unauthorized changes of code (previpus signature will be invalid after modifications of code).
- prevent the usage of existing commits in other undesirable contexts (sending verified commit to another context (for example, branch) will make it unverified).
