source ~/expel_fish_profile

# Add local bin to path
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH

# Golang setup
set -x GOROOT '/usr/local/opt/go/libexec'
set -x GOPATH '/Users/micahcoffman/go'
set -x GOOS 'linux'
set -x PATH $GOPATH/bin $GOROOT/bin $PATH


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/micahcoffman/google-cloud-sdk/path.fish.inc' ]; . '/Users/micahcoffman/google-cloud-sdk/path.fish.inc'; end

# Enable VIM mode by default
fish_vi_key_bindings
