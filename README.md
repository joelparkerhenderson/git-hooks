# Git hooks

Git hooks that can use subdirectories.

For example, our git hook named `pre-commit` does this:

  * Search the corresponding directory named `pre-commit.d`. 
  
  * Search for executable files, and ignore other files. 

  * Run each file by using the shell command `sh`.

  * If a file returns an error, then stop.

