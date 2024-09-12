# Task 1: Understanding Version Control Systems

Firstly, I have inspected the last commit in the repository.
```
❯ git cat-file -p cbb30a9
tree b752224f5671d0c5d5e04b6b27dfa1bfa598fb0f
parent 5326deb1e4359a5d1226ad512c5789bf53565d54
author Nit31 <dydalinnnov31@gmail.com> 1725560191 +0300
committer Nit31 <dydalinnnov31@gmail.com> 1725560191 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgDkxnIHUUGyExJhlMHE9yMetKJe
 v8oRhZCpzUI5B+dJcAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQCv40zfBR66DZfst5XY6+ivA9BBwmhuy1cTQlBm93rNx4RJ4OOFIwiibss0sb/D7qc
 eVK+XHcfMi+F5RQCPt9wc=
 -----END SSH SIGNATURE-----
 ```

 Next, I have inspected the tree, which gave me the list of files in the repository.
 ```
 ❯ git cat-file -p b752224f5671d0c5d5e04b6b27dfa1bfa598fb0f
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc	README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79	index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e	lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a	lab2.md
100644 blob 20d33bbedb8da83c68c9237fe3808cdac1039863	submission1.md
100644 blob 0bc4546077b664a302ca5a07c6be3a367c0bf1a9	submission2.md
```

Finally, I have inspected the blob of index.html, which gave me the content of the file.
```
❯ git cat-file -p 5738bc15a0416ad2624df13badfb235052777e79
<!DOCTYPE html> 
<!-- You can modify it as you wish -->
<html>
<head>
    <title>My Simple Website</title>
</head>
<body>
    <h1>Welcome to My Simple Website</h1>
    <p>This is the content of the folder.</p>
    <ul>
        <li>File 1</li>
        <li>File 2</li>
        <li>File 3</li>
    </ul>
</body>
</html>%  
```

# Task 2: Practice with Git Reset Command

I have created 3 commits in the new branch. Next, I have soft reset the branch to the second commit.

`git reset --soft HEAD~1` resets the current branch's HEAD to the previous commit. However, the changes are still staged and can be committed again.

Next, I have hard reset the branch to the fist commit.

`git reset --hard HEAD~1` resets the current branch's HEAD to the previous commit. However, the changes are not staged and cleared.

Afterall, I have checked the reflog to see the history of the commits.

`git reflog` shows the history of the commits and resets.

Finally, I have recovered the third commit by running `git reset --hard <reflog_hash>. 