**Commit hash**

Hash: 76e09158079505566aeff89df64a1254b127973f

**Output**

PS C:\Users\mixai\Education\IntroToDevOps\F24-intro-labs> git cat-file -p 76e09158079505566aeff89df64a1254b127973f
tree f4e36ee6d1d8e6201facf574156bf6e2725f8dd2
parent 9aabf5abfe46ce984e1ecec049209bed4a3d68e0
author Mikhail Stepanov <mi.stepanov@innopolis.university> 1725918640 +0300
committer Mikhail Stepanov <mi.stepanov@innopolis.university> 1725918640 +0300
gpgsig -----BEGIN SSH SIGNATURE-----
 U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgmevaqGwOObMStCFfhsi7TnOXRA
 pOAO+6rXb8ZP37LNgAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
 AAAAQKGfpFSSNeabXVwIjMN68sf5tSP4FjpjU1jZFKtrBP6gtO9ZUzuIywPcoPwz7E1hQs
 g/t7ylIuftT3VqxYsQjAQ=
 -----END SSH SIGNATURE-----

Add file2.txt file

PS C:\Users\mixai\Education\IntroToDevOps\F24-intro-labs> git cat-file -p f4e36ee6d1d8e6201facf574156bf6e2725f8dd2
100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
100644 blob e81a1213690ec749b44daaae19ff2d3073faed7d    file1.txt
100644 blob 23fafdd8ef568dd6679c22a772e436c48a6b73f0    file2.txt
100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md

PS C:\Users\mixai\Education\IntroToDevOps\F24-intro-labs> git cat-file -p e81a1213690ec749b44daaae19ff2d3073faed7d
��first commit

**Task2 Practice**

1. Create a new branch git-reset-practice
    '''sh
    git checkout -b git-reset-practice
    '''

2. Created 3 commits sequentially filling the file.txt with text
     ```sh
     echo "First commit" > file.txt
     git add file.txt
     git commit -m "First commit"
     
     echo "Second commit" >> file.txt
     git add file.txt
     git commit -m "Second commit"
     
     echo "Third commit" >> file.txt
     git add file.txt
     git commit -m "Third commit"
     ```

3. Navigate the commit history
   
     '''sh
     git reset --soft HEAD~1
     git reset --hard HEAD~1
     '''
 
     - soft rolled back 1 commit, but kept the changes
     - hard rolled back 1 commit, but delete the changes

5. Find HEAD history and recover commit
   
     '''sh
     git reflog
     
     Output
     76e0915 (HEAD -> git-reset-practice, lab03) HEAD@{0}: reset: moving to HEAD~1
     43af79d HEAD@{1}: reset: moving to HEAD~1
     1d8c457 HEAD@{2}: reset: moving to HEAD~1
     2113733 HEAD@{3}: commit: Third commit
     1d8c457 HEAD@{4}: commit: Second commit
     1d8c457 HEAD@{4}: commit: Second commit
     '''
 
     '''sh
     git reset --hard 2113733
     '''

