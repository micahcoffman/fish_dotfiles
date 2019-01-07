function search
  grep --exclude-dir={vendor,tf,.git} -rnw . -e $argv
end
