source ~/expel_fish_profile

# Add local bin to path
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH

# Golang setup
set -x GOROOT '/usr/local/opt/go/libexec'
set -x GOPATH '/Users/micahcoffman/go'
set -x PATH $GOPATH/bin $GOROOT/bin $PATH

