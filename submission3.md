## Task 1


###Commit:

```sh
  git cat-file -p 61404
```

```
tree 231904982c85725486fe10f239c83dccc33f2081
parent 6ade7fdfa1fe2192c8f3e247ed8b24d5d7ff6b30
author Dmitriy Creed <creed@soramitsu.co.jp> 1725371993 +0700
committer GitHub <noreply@github.com> 1725371993 +0700
gpgsig -----BEGIN PGP SIGNATURE-----
 
 wsFcBAABCAAQBQJm1xZZCRC1aQ7uu5UhlAAAoyoQAHiPcxdQ8IDb1OwPKrXmDwR4
 +1GidXksXNmSAeWGlFWPFV/1Onz/yKDUPEKvqfYD7w/u8+s0ymxygQf21xLdWQIm
 Tx6AGbp21YVIhYuA4w+k6lVFKsLX1nJiL6dD+cDSo7fUw3Si+Bwxon6qgCc29/Mf
 hRl94Q+/fG2RRhAxmC3tbmBZzt60sZIVmI6veD3Uc4UHEwRebRG1uASLeU9QNM2j
 FKouhTMMSPDmzSXhhqihNSXva/5arY2Dg3Kab7liUnyerNndyaZA8IOAARCv6kkS
 ZmY0nR7jBLynNZLKfBB/wiqj80WV6QIkzZljpAb0GozjDMqYbd1kapjJEUh+Ff4U
 58b0f9BCYcguefixKO8iPqWLnRn08GI52fLX0vlcN4tLPilHp+3pc9GzLM0SbXet
 5PUkrKt3PK9U57Fu+bAyXvZS0vur29q8AVOXYNGCKSTpYfTL7h3d/kPeXr0xdbd9
 zYS55W9xMVu2BNm5TZXHCwfTTrtGqGmTQXzFzLvE1QMo/k7x+9CwuHVFSv4Kqu1i
 qSS9uLYbmF/v8bpJvoIm7yoZ0jsjdw3wdguU7BM1IgihZiTEl7/r7Yh+yFgrTQU6
 78oDKsUp9SWudY7V5SGEiLy1/zItVrtwk/AvqBWw/ejdp1KHfl9SmSAvpmv3ydTA
 zKuGjboOeQDtw0gvSOr/
 =txg4
 -----END PGP SIGNATURE-----
```


### Blob:

```shell
git cat-file -p 5738
```
 
```
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
</html>
```

### Tree: 

```shell
git cat-file -p HEAD^{tree}
```
>100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5b3c010a011b95052efe998176ef18ca8efd4adf    file.txt
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md







## Taks 2

Firstly, I did three commits that are described in task. 
After I experiment with `git reset` command.

- `reset --soft target` allows to return to the targeted commit without changing the files states.
- `reset --hard target` both returns to the targeted commit logic state and files state.

### Examples:

1) ```shell
   git reset --hard bf1e7
    ```
   >HEAD is now at bf1e711 Merge branch 'master' of github.com:inno-devops-labs/F24-intro-labs
    
    The logic and files state moved to selected commit. HEAD cursor is on commit bf1e7 and file `file.txt` disappeared.
2) ```shell
    git reflog
   ```
    >    bf1e711 (HEAD -> get-reset-practice, origin/master, origin/HEAD, master, Lab-3) HEAD@{0}: reset: moving to bf1e7 <br>
    19665d6 HEAD@{1}: reset: moving to 1966 <br>
    19665d6 HEAD@{2}: reset: moving to HEAD~1 <br>
    980e6a9 HEAD@{3}: commit: Third commit <br>
    19665d6 HEAD@{4}: commit: Second commit <br>
    72d2e0e HEAD@{5}: commit: First commit <br>
    bf1e711 (HEAD -> get-reset-practice, origin/master, origin/HEAD, master, Lab-3) HEAD@{6}: reset: moving to bf1e711eae46b961296dea9db101013aaaf1ced7 <br>
    6d0c40d HEAD@{7}: commit: Second commit <br>
    bf1e711 (HEAD -> get-reset-practice, origin/master, origin/HEAD, master, Lab-3) HEAD@{8}: checkout: moving from Lab-3 to get-reset-practice <br>

    The `reflog` command shows the complete local history of the commits and moving among them and different git branches.    

3) ```shell
   git reset --hard
   ```
    > HEAD is now at 980e6a9 Third commit

    The project status returned to the final state. 
``