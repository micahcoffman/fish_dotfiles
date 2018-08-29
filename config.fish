set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

source ~/expel_fish_profile

status --is-interactive; and source (pyenv init -|psub)

set -U fish_user_paths /usr/local/bin $fish_user_paths

set GOPATH '/Users/micahcoffman/go'
set -U fish_user_paths $GOPATH/bin $fish_user_paths

alias cdgo="cd /Users/micahcoffman/go/src/github.com/expel-io"

function update_master --wraps git
  git checkout master
  git fetch origin
  git reset --hard origin/master
end

function delete_branch --wraps git --argument-names 'branchname'
  if test -n "$branchname"
    if [ "$branchname" != "master" ]
      git checkout master
      git fetch origin
      git reset --hard origin/master
      git push --delete origin $branchname
      git branch -D $branchname
    end
  else
    echo "usage: delete_branch <branchname>"
  end
end
