function delete_branch --description 'deletes current branch'
  set -l branchname (git branch | grep \* | cut -d ' ' -f2)

  set -l branches (git branch --format='%(refname:short)')

  if contains main $branches
    update_main
  else
    update_master
  end

  if begin [ $branchname = "master" ]; or [ $branchname = "main" ]; end
    echo "Cannot delete master or main branch"
  else
    git push --delete origin $branchname
    git branch -D $branchname
  end
end
