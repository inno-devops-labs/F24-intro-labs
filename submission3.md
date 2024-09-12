## Task 1: Understanding Version Control Systems

**1. `git rev-list --all`** - Lists all commits in the repository, including branches and tags.

```bash
33728fe401a9e7f9a19d07236e8b2dba890c977f
e8f89e8ee69aab33783cb794473b17e23dda572c
77dedb74544cfdede8be1851327a4bef81adeccf
bf1e711eae46b961296dea9db101013aaaf1ced7
7e1e25571d421a44d0e689675d3dc28f023cfe01
29009ac73c7c4c4f05a2c6e03cbde92effc842d0
7b5309bb1677b069b01a93ec1c4c633b49688e2f
68630e479e29cea78825bfdd4de0dd60dc347819
6ade7fdfa1fe2192c8f3e247ed8b24d5d7ff6b30
```

**2. `git cat-file -p 33728`** - Displays the content of a commit.

```bash
tree ae3d9283024014721cf8cdd1f9c4b40391df7d8a
parent fa8f400b3aaa9eabc6e14a3f659a2d6ca7e02a26
author Iurii-Podkorytov <i.podkorytov@innopolis.university> 1725974455 +0300
committer Iurii-Podkorytov <i.podkorytov@innopolis.university> 1725974455 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAghmmj8+ZZNmBfK4rWczp55iamdF
 x39Hd4fyPh48rkkJgAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQEcP3K3FeIyc5Py9GvWmWWpyLwQIcsxH51ivmBi79kteDav7H8dev7ED9FKcsRU9OK
 jrmSjvejGNI6xs4/pf3wg=
 -----END SSH SIGNATURE-----

te test git cat-file -p on blob
```

**3. `git cat-file -p ae3d`** - Displays the content of a specific tree (snapshot of files in a commit).

```bash
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
100644 blob 9daeafb9864cf43055ae93beb0afd6c7d144bfa4    submission3.md
```

**4. `git cat-file -p 9daea`** - Displays the content of a specific blob (file).

```bash
test
```



## Task 2: Practice with Git Reset Command

I created a new branch named `git-reset-practice` and made three commits:

**Commands and Observations:**

1. **`git reset --soft HEAD~1`:**

   - This command moved the HEAD pointer one commit back (to the second commit) while keeping the changes from the third commit in the staging area.
2. **`git reset --hard HEAD~1`:
   `HEAD is now at ccf61e2 First commit`**

   - This command moved the HEAD pointer one commit back (to the first commit) and discarded all changes made in the second commit, both from the working directory and the staging area.
   - The output confirmed that HEAD is now at the first commit (with hash ccf61e2).
3. **`git reflog`**:

   ```
   ccf61e2 (HEAD -> git-reset-practice) HEAD@{0}: reset: moving to HEAD1
   f631638 HEAD@{1}: reset: moving to HEAD1
   91178eb HEAD@{2}: commit: Third commit
   f631638 HEAD@{3}: commit: Second commit
   ccf61e2 (HEAD -> git-reset-practice) HEAD@{4}: commit: First commit
   33728fe (Lab3) HEAD@{5}: checkout: moving from Lab3 to git-reset-practice
   ```
   - This command displayed the reflog, which is a record of all changes to the HEAD pointer.
   - It showed the history of resets and commits, allowing me to see the sequence of actions and the corresponding commit hashes.
4. **`git reset --hard 91178eb`:**

   - This command reset the HEAD pointer to the third commit (with hash 91178eb).
   - The output confirmed that HEAD is now at the third commit.
