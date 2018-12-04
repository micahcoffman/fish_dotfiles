set -x normal (set_color normal)
set -x magenta (set_color magenta)
set -x yellow (set_color yellow)
set -x green (set_color green)
set -x red (set_color red)
set -x gray (set_color -o black)

# Fish git prompt
set -x __fish_git_prompt_showdirtystate 'yes'
set -x __fish_git_prompt_showstashstate 'yes'
set -x __fish_git_prompt_showuntrackedfiles 'yes'
set -x __fish_git_prompt_showupstream 'yes'
set -x __fish_git_prompt_color_branch yellow
set -x __fish_git_prompt_color_upstream_ahead green
set -x __fish_git_prompt_color_upstream_behind red

# Status Chars
set -x __fish_git_prompt_char_dirtystate '⚡'
set -x __fish_git_prompt_char_stagedstate '→'
set -x __fish_git_prompt_char_untrackedfiles '☡'
set -x __fish_git_prompt_char_stashstate '↩'
set -x __fish_git_prompt_char_upstream_ahead '+'
set -x __fish_git_prompt_char_upstream_behind '-'

function fish_prompt
  set -x last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

