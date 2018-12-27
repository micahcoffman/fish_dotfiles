function update_master --description 'updates master branch'
  git checkout master
  git pull --rebase origin master
end

