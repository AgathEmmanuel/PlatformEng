

# Git



## Adding a local repository to GitHub with GitHub CLI  

    In the command line, navigate to the root directory of your project.

    Initialize the local directory as a Git repository.

    git init -b main

    Stage and commit all the files in your project

    git add . && git commit -m "initial commit"




## Adding a local repository to GitHub using Git  

    Create a new repository on GitHub.com. To avoid errors, do not initialize the new repository with README, license, or gitignore files. You can add these files after your project has been pushed to GitHub. Create New Repository drop-down
    Open Terminal.
    Change the current working directory to your local project.
    Initialize the local directory as a Git repository.

    $ git init -b main

    Add the files in your new local repository. This stages them for the first commit.

    $ git add .
    # Adds the files in the local repository and stages them for commit. To unstage a file, use 'git reset HEAD YOUR-FILE'.

    Commit the files that you've staged in your local repository.

    $ git commit -m "First commit"
    # Commits the tracked changes and prepares them to be pushed to a remote repository. To remove this commit and modify the file, use 'git reset --soft HEAD~1' and commit and add the file again.

    At the top of your repository on GitHub.com's Quick Setup page, click 

to copy the remote repository URL. Copy remote repository URL field
In Terminal, add the URL for the remote repository where your local repository will be pushed.

$ git remote add origin  <REMOTE_URL> 
Sets the new remote
$ git remote -v
Verifies the new remote URL

Push the changes in your local repository to GitHub.com.

$ git push origin main
Pushes the changes in your local repository up to the remote repository you specified as the origin













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



[https://stackoverflow.com/questions/7167645/how-do-i-create-a-new-git-branch-from-an-old-commit](https://stackoverflow.com/questions/7167645/how-do-i-create-a-new-git-branch-from-an-old-commit)  

```


git checkout -b NEW_BRANCH_NAME COMMIT_ID

This will create a new branch called 'NEW_BRANCH_NAME' and check it out.

("check out" means "to switch to the branch")

git branch NEW_BRANCH_NAME COMMIT_ID

This just creates the new branch without checking it out.

in the comments many people seem to prefer doing this in two steps. here's how to do so in two steps:

git checkout COMMIT_ID
# you are now in the "detached head" state
git checkout -b NEW_BRANCH_NAME


```

