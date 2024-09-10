## Task 1

**Executed code and new commits creation:**

```
    echo "First commit content" > file1.md
    git add file1.md
    git commit -S -m "Commit with the 1st file"
    echo "Second commit content" > file2.md
    git add file2.md 
    git commit -S -m "Commit with the 1st and 2nd files"
```

**Git log**
```
commit 262151e77ff654c8fb383c0cb36d128aac8f6e96 (HEAD -> lab3)
Author: Anastasia Pichugina <a.pichugina@innopolis.university>
Date:   Sun Sep 8 20:22:23 2024 +0300
    Commit with the 1st and 2nd files

commit c6a7fbde145bd19786f03a2c169230c1484d15ab
Author: Anastasia Pichugina <a.pichugina@innopolis.university>
Date:   Sun Sep 8 20:21:40 2024 +0300
    Commit with the 1st file
```



**First commit hash:**
```
tree 0982c5df8a4acf5b97381d14c46a18a473319b0c
parent b39061b109b8a9fb1ef8fe11902920b64dd1a9fc
author Anastasia Pichugina <a.pichugina@innopolis.university> 1725816100 +0300
committer Anastasia Pichugina <a.pichugina@innopolis.university> 1725816100 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAg6KZPXcnrdw8KZFMkDTYBLQgDKx
 wkg63dX1sIRFtNLUoAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQNnYvv27vnungIFLBYApkiXed4aGv/Ojf8XBtOdYuJuEh+j0KGy3UY9+tFmHf70biG
 gEspCNCO2bI3UeYO9sSw0=
 -----END SSH SIGNATURE-----

Commit with the 1st file
```



**First commit tree**
```
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5ff85167e05f4c772a8a46a80b08ba60c5ea2152    file1.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
```

**First commit blob**

```First commit content```


**Second commit hash**
```
tree 4420819bd53b8502c26161297bf1ede6a291fbd5
parent c6a7fbde145bd19786f03a2c169230c1484d15ab
author Anastasia Pichugina <a.pichugina@innopolis.university> 1725816143 +0300
committer Anastasia Pichugina <a.pichugina@innopolis.university> 1725816143 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAg6KZPXcnrdw8KZFMkDTYBLQgDKx
 wkg63dX1sIRFtNLUoAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQMj9hkZqV9hH5T+yIQ/+n1HFt7gTk/GNX4tayIBIYfg/i4XGyFOSNgan+ffArgk8Hh
 iwSWVrYd8L+cHwoM5UDgI=
 -----END SSH SIGNATURE-----

Commit with the 1st and 2nd files
```

**Second commit tree**
```
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5ff85167e05f4c772a8a46a80b08ba60c5ea2152    file1.md
100644 blob 4e2cd24e1527a2a29869f218c3992ebd023321f1    file2.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
```

**Second commit blob**

```
Second commit content
```

## Task 2
Steps:
1. New branch creation: `git checkout -b git-reset-practice`
2. Series of commits: 3 commits as the baseline requires
3. Git reset and reflog usage step by step: 

`git reset --soft HEAD~1`: ~1 - move the HEAD to the previous commit (Second commit), --soft - keep changes on local machine and in the index ("Third commit" string isn't removed from the file, exists in the index). Doesn't give any output, but the result can be checked in the `git log`:
```
commit 21f91813ec606e9ca8e08ce07da6556907e5c8eb
Author: Anastasia Pichugina <a.pichugina@innopolis.university>
Date:   Sun Sep 8 22:01:08 2024 +0300

    Second commit

commit e692e36b33cff2bf5443d221227e4a167ca6f034
Author: Anastasia Pichugina <a.pichugina@innopolis.university>
Date:   Sun Sep 8 22:00:38 2024 +0300

    First commit
```

`git reset --soft HEAD~2`: ~2 - move the HEAD 2 commits back (from the current HEAD). No output, but `git log` demonstrates that the HEAD points to the commit from the previous task (3 steps before the last "Third commit" commit):
```
commit 262151e77ff654c8fb383c0cb36d128aac8f6e96 (HEAD -> git-reset-practice)
Author: Anastasia Pichugina <a.pichugina@innopolis.university>
Date:   Sun Sep 8 20:22:23 2024 +0300

    Commit with the 1st and 2nd files
```

`git reset --hard <hash>`: move the HEAD to the commit, which hash is "< hash >", used for switching between commits by their hash, the history can be checked through `git reflog`. The output:
```
HEAD is now at 3d8adb9 Third commit
```
`git reset --hard HEAD~1`: move the HEAD to the previous commit and "--hard" turns the file to his state in the prevouis commit (file.txt in both PC and staging area doesn't contain "Third commit" string). The output example:
```
HEAD is now at 21f9181 Second commit
```
`git reflog`: look at the order of actions taken, the history of swapping between commits and branches. The history of the switching to the previous commit and back (3d8adb9) example:
```
3d8adb9 HEAD@{1}: reset: moving to 3d8adb9
21f9181 (HEAD -> git-reset-practice) HEAD@{2}: reset: moving to HEAD~1
```
