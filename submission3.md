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