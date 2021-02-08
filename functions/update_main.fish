function update_main --description 'updates main branch'
  git checkout main
  git pull --rebase origin main
end
