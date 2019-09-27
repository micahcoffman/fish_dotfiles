source ~/expel_fish_profile

# Add local bin to path
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH

# Golang setup
set -x GOROOT '/usr/local/opt/go@1.12/libexec'
set -x GOPATH '/Users/micahcoffman/go'
set -x PATH $GOPATH/bin $GOROOT/bin $PATH

set -x FLUX_FORWARD_NAMESPACE 'flux'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/micahcoffman/google-cloud-sdk/path.fish.inc' ]; . '/Users/micahcoffman/google-cloud-sdk/path.fish.inc'; end
set -g fish_user_paths "/usr/local/opt/go@1.12/bin" $fish_user_paths
