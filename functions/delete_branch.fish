function delete_branch --description 'deletes current branch'
  set branchname (git branch | grep \* | cut -d ' ' -f2)
  if [ "$branchname" != "master" ]
    git checkout master
    git pull --rebase origin master
    git push --delete origin $branchname
    git branch -D $branchname
  else
    echo "Cannot delete master branch"
  end
end

