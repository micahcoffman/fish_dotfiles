source ~/expel_fish_profile

# Add local bin to path
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH

set -x PATH $HOME/.local/bin $PATH

# Golang setup
set -x GOROOT '/usr/local/opt/go/libexec'
set -x GOPATH '/Users/micahcoffman/go'
set -x PATH $GOPATH/bin $GOROOT/bin $PATH

set -x FLUX_FORWARD_NAMESPACE 'flux'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/micahcoffman/google-cloud-sdk/path.fish.inc' ]; . '/Users/micahcoffman/google-cloud-sdk/path.fish.inc'; end
set -g fish_user_paths "/usr/local/opt/go/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths
