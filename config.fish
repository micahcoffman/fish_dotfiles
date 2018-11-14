# Source in Expel specific variables that should not be in github
source ~/expel_fish_profile

# Init pyenv
status --is-interactive; and source (pyenv init -|psub)

# Add local bin to path
set -U fish_user_paths /usr/local/bin $fish_user_paths

# Golang setup
set GOROOT '/usr/local/bin/go'
set GOPATH '/Users/micahcoffman/go'
set -U fish_user_paths $GOPATH/bin $fish_user_paths

