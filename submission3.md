# Version Control

## Task 1: Understanding Version Control Systems

1. **Create and Explore a Repository**:
   - Use the current repository and make a few commits.

     First, I need to add some file:
     ```sh
     mkdir test
     cd test
     echo 'Hello, World!' > test.txt
     git add test.txt
     git commit -S -m 'tests'
     ```

   - Use `git cat-file` to inspect the contents of blobs, trees, and commits.

     ```sh
     # Example commands to inspect contents
     git cat-file -p <blob_hash>
     git cat-file -p <tree_hash>
     git cat-file -p <commit_hash>
     ```

     Results:
     ```sh
     # Blob hash
     # Content of specific file is printed
     > git cat-file -p 5a004a226beb63a153dd7601edfad8493fb6ef86
     Hello, world!

     # Tree hash
     # Files and subtrees are listed
     > git cat-file -p d75bbe8fc30706cad4d8b3a9acaaa5ae344e2cbe
     100644 blob ede183da8ef201e5f5737eea502edc77fd8a9bdc    README.md
     100644 blob 5738bc15a0416ad2624df13badfb235052777e79    index.html
     100644 blob 7a94f7af59b8968be392288ea03179a24ffc9d9e    lab1.md
     100644 blob 1b99cc0044f93f556a0f6a599c7edf2f33f4944a    lab2.md
     100644 blob 2f8463cc188ec6ca69ae7a0f98d38e132280becb    lab3.md
     100644 blob d66a6867f90e48f6f44d9d80821aa1d866a24882    lab4.md
     040000 tree e1006a2676f891f30a6f068fb69e386b806419e8    test

     # Commit hash
     # Hash of the commited tree, hash of the parent(previous commit), some info about commiter and commit message are printed
     > git cat-file -p ccf17aa
     tree d75bbe8fc30706cad4d8b3a9acaaa5ae344e2cbe
     parent bf1e711eae46b961296dea9db101013aaaf1ced7
     author Makar Brednikov <m.brednikov@innopolis.university> 1725879059 +0300
     committer Makar Brednikov <m.brednikov@innopolis.university> 1725879059 +0300
     gpgsig -----BEGIN SSH SIGNATURE-----
     ...
     ...
     ...
     -----END SSH SIGNATURE-----

     tests
     ```

## Task 2: Practice with Git Reset Command

1. **Create a New Branch**:
   - Create a new branch named "git-reset-practice" in your Git repository.

     ```sh
     git checkout -b git-reset-practice
     ```

2. **Explore Advanced Reset and Reflog Usage**:
   - Create a series of commits.

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

     After those steps I have the following logs:

     ```sh
     > git log --oneline
     463930c (HEAD -> git-reset-practice) Third commit
     722d497 Second commit
     db46d51 First commit
     ```

   - Use `git reset --hard` and `git reset --soft` to navigate the commit history.

     ```sh
     git reset --soft HEAD~1
     # So, soft reset resets only the HEAD pointer and commit, keeping changes in files and making it able to make new commit with same changes

     git reset --hard HEAD~1
     # Hard reset resets the working space, and stage. It makes stage the same as it was after the previous commit
     ```

   - Use `git reflog` to recover commits after a reset.

     ```sh
     > git reflog
     # Reflog shows a history of changes made to HEAD.
     # It is useful when reset was done in a wrong way or incorrect number of times: you can find the necessary commit and restore its state.
     db46d51 (HEAD -> git-reset-practice) HEAD@{0}: reset: moving to HEAD~1
     722d497 HEAD@{1}: reset: moving to HEAD~1
     463930c HEAD@{2}: commit: Third commit
     722d497 HEAD@{3}: commit: Second commit
     db46d51 (HEAD -> git-reset-practice) HEAD@{4}: commit: First commit
     bf1e711 (origin/master, origin/HEAD, master) HEAD@{5}: checkout: moving from master to git-reset-practice

     > git reset --hard db46d51
     HEAD is now at db46d51 First commit
     # 'First commit' is in a file - just like after the first commit
     > git reset --hard 722d497
     HEAD is now at 722d497 Second commit
     # 'First commit
     # Second commit' is in a file - just like after the second commit
     > git reset --hard 463930c
     HEAD is now at 463930c Third commit
     # File containt all 3 comments info
     ```