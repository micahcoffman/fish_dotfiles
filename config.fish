source ~/expel_fish_profile

# Init pyenv
# status --is-interactive; and source (pyenv init -|psub)

# Add local bin to path
set -x PATH /usr/local/bin $PATH

# Golang setup
set -x GOROOT '/usr/local/bin/go'
set -x GOPATH '/Users/micahcoffman/go'
set -x PATH $GOPATH/bin $PATH

