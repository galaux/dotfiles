. ~/.config/env.sh
. ~/.config/aliases.sh
[[ -e ~/.config/zshrc.local ]] && . ~/.config/zshrc.local
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

setopt prompt_subst #allow function calls in prompt
#autoload -Uz cdr
#autoload -U promptnl
autoload -Uz vcs_info
autoload -U colors && colors

prompt_prev_cmd() {
  if [[ $? == 0 ]]; then
    echo ""
  else
    echo "%F{red}✗%f"
  fi
}

prompt_pwd_wrapper() {
  echo "%F{blue}%~%f"
}

root_user_display() {
  echo "%F{red}%n%f"
}

regular_user_display() {
  echo "%F{white}%n%f"
}

host_display() {
  echo "@%F{red}$(hostname -s)%f"
}

prompt_user_host_wrapper() {
  if [[ -z "$SSH_CLIENT" ]]; then
    if [[ $UID != 0 ]]; then
      echo ""
    else
      echo "$(root_user_display) "
    fi
  else
    if [[ $UID != 0 ]]; then
      echo "$(regular_user_display)$(host_display) "
    else
      echo "$(root_user_display)$(host_display) "
    fi
  fi
}

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr "%F{red}●%f"
# Used if there is a special action going on in your current repository;
# like an interactive rebase or a merge conflict.
zstyle ':vcs_info:*' actionformats             \
  "%F{red}%b%F{blue}|%F{green}%a%f "
# Used when actionformats is not used (which is most of the time).
zstyle ':vcs_info:*' formats                   \
  "%F{grey}%b%f %m%u%c "
# Some backends replace %b in the formats and actionformats styles above,
# not only by a branch name but also by a revision number.
# This style lets you modify how that string should look.
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat \
#  "%b%F{1}:%F{3}%r"

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%F{grey}${vcs_info_msg_0_}%f "
  fi
}

_before=0
_elapsed=-1
ELAPSED_THRESHOLD=3

prompt_elapsed() {
  if [[ $_elapsed -gt $ELAPSED_THRESHOLD ]]; then
    echo " $(date -u -d @${_elapsed} +%T)"
  fi
}

RPROMPT=$'$(prompt_prev_cmd)$(prompt_elapsed)'

PROMPT=$'
$(prompt_pwd_wrapper) $(prompt_user_host_wrapper)$(vcs_info_wrapper)
❯ '

function preexec() {
  _before=$SECONDS
}

function precmd() {
  if [[ -z ${_before+x} ]]; then
    _elapsed=0
  else
    _elapsed=$(($SECONDS-$_before))
  fi
  unset _before
}

# ─────────────────────────────────────────────────────────────────────────────

# append history list to the history file; this is the default but we make sure
# because it's required for share_history.
setopt append_history

# import new commands from the history file also in other zsh-session
setopt share_history

# save each command's beginning timestamp and the duration to the history file
setopt extended_history

# If a new command line being added to the history list duplicates an older
# one, the older command is removed from the list
setopt histignorealldups

# remove command lines from the history list when the first character on the
# line is a space
setopt histignorespace

# if a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd

# in order to use #, ~ and ^ for filename generation grep word
# *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
# don't forget to quote '^', '~' and '#'!
setopt extended_glob

# display PID when suspending processes as well
setopt longlistjobs

# try to avoid the 'zsh: no matches found...'
setopt nonomatch

# report the status of backgrounds jobs immediately
setopt notify

# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all

# not just at the end
setopt completeinword

# Don't send SIGHUP to background processes when the shell exits.
setopt nohup

# make cd push the old directory onto the directory stack.
setopt auto_pushd

# avoid "beep"ing
setopt nobeep

# don't push the same dir twice.
setopt pushd_ignore_dups

# * shouldn't match dotfiles. ever.
#setopt noglobdots

# use zsh style word splitting
setopt noshwordsplit

# don't error out when unset parameters are used
setopt unset

## Completions
autoload -U compinit
compinit -C

# Autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select
# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Variables
export EDITOR=/usr/bin/nvim
CDPATH=".:${HOME}"

# Disable Ctrl+s
stty -ixon

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000 # useful for setopt append_history

# dirstack handling
DIRSTACKFILE="$HOME/.cache/zsh_dirs_hist"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi

chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

# Remove duplicate entries
setopt pushdignoredups

# This reverts the +/- operators.
setopt pushdminus

set -o emacs
# Vim-style word movement: Alt+[w|b]
#bindkey "\ew" forward-word
#bindkey "\eb" backward-word
#
#bindkey "\eh" backward-char
#bindkey "\el" forward-char
#
## Vim-style home/end: Alt+[h|l]
#bindkey "\ei" beginning-of-line
#bindkey "\ea" end-of-line
#
## Alt+r/s instead of Ctrl+r/s
##bindkey "\er" history-incremental-search-backward
##bindkey "\es" history-incremental-search-forward
#
#bindkey "\ed" backward-kill-word
#bindkey "\ep" yank
#
## Vim-style history search: Alt+[j|k]
#bindkey "\ek" up-line-or-search
#bindkey "\ej" down-line-or-search
#
#bindkey "\e." insert-last-word
#
#bindkey '^R' history-incremental-search-backward

autoload -z edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Set arrows to browse through history with context
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

# Enable aws-cli completion
autoload -Uz bashcompinit
bashcompinit -i
complete -C aws_completer aws
