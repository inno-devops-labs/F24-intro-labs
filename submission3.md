### Task 1
The output of the command `$ git cat-file -p edf3a97708c37c32edd189171b609104a31a976e`, there the object is a commit:
```
tree 1c170821471e35a60d7f6af07ad55cffecc85429
parent 2f8f33288aa0c764d9a76608ae5a98b12fcf247b
author NedoDno <78658946+NedoDno@users.noreply.github.com> 1725578413 +0300
committer NedoDno <78658946+NedoDno@users.noreply.github.com> 1725578413 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBAMFcyRNO/OWYULu9N3edF7
 0XPfT5AZk97pvuvmbomS2FxC5/HPWAgfulV508QYzqssJZi8mGRtfpCHzlhnnMQR+dC9DI
 N/KKVNTSGCFIJMVWgi8PO/7pYJabaUDLzy2hginlCQWkN6dFmGlyK3ZMtAOba3S/AjpyFp
 T86xY1HODuKaWGGQPN5GMIirw0cdlzGjAOSx/HmpCUtDd/XgEqJILDittWWRR6i+UcTrr8
 L9a8EIOwjpJBBVYcp9y9CnlKT1z9vJlLzNCPrN74yirPB7DUdL4CfX/JoSk1fAeX5dBqpk
 60GPt9ahW7pubkQFciLMlfvT3HipcM2lcwIOdPDFtcZztkHEn4Gr5OQzhoYWNZAgDxglNQ
 EFrJycdNIHln1qkjJGVMYiu1vpvQc9xtwA/OZkMr5Ctj/Wz02eApt2UE7Dqk01LhGQZyt1
 l1HHTCWDfO5c489GdKoAfDHn6qB87Xjr3g2Gru191OIZDO36EyjIjhoGzplNoBhF5NN8Nt
 DQAAAANnaXQAAAAAAAAABnNoYTUxMgAAAZQAAAAMcnNhLXNoYTItNTEyAAABgCppoRouBU
 E9e3KfZlNqkFktQIpZ186zFOtQMXHuGJE+5ih8/bTTTjA8sx/U9GLXp6E1Wp/+pfAgQ/CS
 3LFe2iRP7G+cpENL6a1PRlwnceFSlqcD4iu0+HcO5xGO8rcuWuDtIMm9afPlVX5RIdB6Xt
 nlQao0OEnjJjet9f0Z+MT6h5JH+mP+4OPBFn03Ev3CRes2oaO34WSP0KqSp5VPcfsi2T/l
 brQmapGNMYceKiXcDLh1cdzmQ+r4yjuklFL2CgNaFT7/7mpPr4zyBAw3ilY1CfVcAPGKjV
 /c6u+A+4Bv1ymAXzXRhgsL7NALapRuUTnPAbtw2aT4POupHLMua8Hjgw+m+rf0EK2H7JTz
 3NjqytP7div3yWsYyeflhz/MRKB/6jQfcuvuBSntBT3cFSiKJQSQODWoGs/C/394aUVa84
 EEJkuBjIpV3U3p02EMhI1NqAFT9VMUXz/NSxGRhfAFmofevsn7SaO0wS7D5DcY3lT2hy4h
 GRAX4uBsoxvxBA==
 -----END SSH SIGNATURE-----

edit submission1.md with task 2
```
The output of the command `$ git cat-file -p 1c170821471e35a60d7f6af07ad55cffecc85429`, there the object is a tree:
```
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
100644 blob 4796e523c762d5798e57636a7e9eee272c4365cc    submission1.md
```
The the command `$ git cat-file -p 4796e523c762d5798e57636a7e9eee272c4365cc`, there the object is a blob gave me a text of the file submission1.md.
### Task 2
1. I created three commits using example in the lab3.md file:
```
$ echo "First commit" > file.txt
$ git add file.txt
$ git commit -m "First commit"
    [git-reset-practice bf9168b] First commit
     1 file changed, 0 insertions(+), 0 deletions(-)
# and other two times with pretty same outputs
```
2.I used command ```git reset --soft HEAD~1``` that didn't give me any output and didn't change file.txt, but moved head from third commit to second.
3.I used command
```
$ git reset --hard HEAD~1
    HEAD is now at bf9168b First commit
```
and that command move head to the first commit and change state of the file.txt to the first commit state.
4. And to restore second commit I used
```
$ git reflog --all
    bf9168b (HEAD -> git-reset-practice) refs/heads/git-reset-practice@{0}: reset: moving to HEAD~1
    bf9168b (HEAD -> git-reset-practice) HEAD@{0}: reset: moving to HEAD~1
    aadddbc refs/heads/git-reset-practice@{1}: reset: moving to HEAD~1
    aadddbc HEAD@{1}: reset: moving to HEAD~1
    5ce7eb9 refs/heads/git-reset-practice@{2}: commit: Third commit
    5ce7eb9 HEAD@{2}: commit: Third commit
    aadddbc refs/heads/git-reset-practice@{3}: commit: Second commit
    bf9168b (HEAD -> git-reset-practice) refs/heads/git-reset-practice@{4}: commit: First commit
    aadddbc HEAD@{3}: commit: Second commit
    bf9168b (HEAD -> git-reset-practice) HEAD@{4}: commit: First commit
```
to get it's hash and use command ```git reset --hard aadddbc``` to move head to the seccond commit. After that file.txt is changed like it was a seccond commit.
