

# Git

```
You can unstage files from the index using

git reset HEAD -- path/to/file

Just like git add, you can unstage files recursively by directory and so forth, so to unstage everything at once, run this from the root directory of your repository:

git reset HEAD -- .





```


[https://stackoverflow.com/questions/6682740/how-can-i-unstage-my-files-again-after-making-a-local-commit](https://stackoverflow.com/questions/6682740/how-can-i-unstage-my-files-again-after-making-a-local-commit)  


```

How can I unstage my files again after making a local commit?


git reset --soft HEAD~1 
After this, you'll have the first changes in the index (visible with git diff --cached), and your newest changes not staged. git status will then look like this:

# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#       modified:   foo.java
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#       modified:   foo.java
#

You can then do git add foo.java and commit both changes at once.


```

[https://articles.assembla.com/en/articles/2941346-how-to-delete-commits-from-a-branch-in-git](https://articles.assembla.com/en/articles/2941346-how-to-delete-commits-from-a-branch-in-git)  
How to delete commits from a branch in Git?

```

git reset --hard HEAD~1

git reset --hard <sha1-commit-id>


Alternatively, if you have already pushed your changes you will need to run the following code

git push origin HEAD --force 

Please note if others have pulled this branch you would be better off starting a new branch. If you don't do this when someone else pulled, it will just merge it into their work, and you will get it pushed back up again.


If you need to find a commit that you "deleted", it is typically present in <git reflog> unless you have garbage collected your repository.

```

[https://www.atlassian.com/git/tutorials/rewriting-history/git-reflog](https://www.atlassian.com/git/tutorials/rewriting-history/git-reflog)  
[https://itextpdf.com/en/blog/technical-notes/how-completely-remove-file-git-repository](https://itextpdf.com/en/blog/technical-notes/how-completely-remove-file-git-repository)  

```

1. You want to keep the file locally

Amend the last commit to remove the file from the repository, and add it to .gitignore, to prevent it from being added by accident again.

git rm --cached $FILE
echo $FILE >> .gitignore
git add .gitignore
git commit --amend --no-edit
git reflog expire --expire=now --all && git gc --prune=now --aggressive

The git reflog expire and git gc commands force a garbage collection, to keep the file from dangling somewhere in your repository.




2. You do not want to keep the file locally

Just amend the last commit.

git rm $FILE
git commit --amend --no-edit
git reflog expire --expire=now --all && git gc --prune=now --aggressive

```

