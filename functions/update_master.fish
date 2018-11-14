function update_master --wraps git
  git checkout master
  git pull --rebase origin master
end

