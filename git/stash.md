https://stackoverflow.com/questions/15745045/how-do-i-resolve-git-saying-commit-your-changes-or-stash-them-before-you-can-me  


You can't merge with local modifications. Git protects you from losing potentially important changes.  

You have three options:  

1. **Commit the change** using  
   ```sh
   git commit -m "My message"
   ```
2. **Stash it**  
   Stashing acts as a stack, where you can push changes, and you pop them in reverse order.  
   To stash, type  
   ```sh
   git stash
   ```
   Do the merge, and then pull the stash:  
   ```sh
   git stash pop
   ```
3. **Discard the local changes**  
   using `git reset --hard`  
   or `git checkout -t -f remote/branch`  
   
   Or: Discard local changes for a specific file  
   using `git checkout filename`

