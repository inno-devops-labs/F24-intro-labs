# Lab 3 Solution file   
### Task 1
First I got some information about the commits
> git log

    commit 014cd5241314ea94b60507bed0725baca63afc39 (HEAD -> lab_3)
    Author: Amine <aminetr76@gmail.com>
    Date:   Sat Sep 7 11:20:30 2024 +0300

        Created submission3.md file

Then, I got more information about the last commit using cat-file
> git cat-file -p 014cd5241314ea94b60507bed0725baca63afc39

    tree 1e47c95e6d4cf0cea55fb1076ae83ed4b0ffc4ab
    parent 2c468f9f89890ab60d4921c0ddb876bdaedce985
    author Amine <aminetr76@gmail.com> 1725697230 +0300
    committer Amine <aminetr76@gmail.com> 1725697230 +0300
    gpgsig -----BEGIN SSH SIGNATURE-----
    <redacted>
    -----END SSH SIGNATURE-----

    Created submission3.md file

For curiosity I have checked the tree also using cat-file

> git cat-file -p 1e47c95e6d4cf0cea55fb1076ae83ed4b0ffc4ab

    100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
    100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
    100644 blob 1dba99957c3bb59d40913294b83e40d5c38b6c0b    lab1.md
    100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
    100644 blob cd3791299b44869cf4146545d63b21ff8dbbc646    submission3.md


# Task 2: reset

Reset practice:

I created 3 commits as in the task.
Here is the log:
> git log

    commit 316ca8b31eeb8a7456c901c8b40ec90dd8531000 (HEAD -> git-reset-practice)
    Author: Amine <aminetr76@gmail.com>
    Date:   Tue Sep 10 11:56:32 2024 +0300

        Third commit

    commit 473f4225335b8443d647bcde6ba990e6813f56ef
    Author: Amine <aminetr76@gmail.com>
    Date:   Tue Sep 10 11:56:30 2024 +0300

        Second commit

    commit 77484373aaa7844ca33ba7d01bd9b55b7e020452
    Author: Amine <aminetr76@gmail.com>
    Date:   Tue Sep 10 11:56:30 2024 +0300

        First commit

The I ran reset commands

> git reset --soft HEAD~1
> git reset --hard HEAD~1

    HEAD is now at 7748437 First commit

The I tried git reflog (output is partial)
> git reflog

    7748437 (HEAD -> git-reset-practice) HEAD@{0}: reset: moving to HEAD~1
    473f422 HEAD@{1}: reset: moving to HEAD~1
    316ca8b HEAD@{2}: commit: Third commit
    473f422 HEAD@{3}: commit: Second commit
    7748437 (HEAD -> git-reset-practice) HEAD@{4}: commit: First commit
    2c468f9 (origin/master, origin/HEAD, master) HEAD@{5}: checkout: moving from master to git-reset-practice

After that I recovered the commits using reset command and the hash from the reflog command:
> git reset --hard 316ca8b

    HEAD is now at 316ca8b Third commit

