#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# history file options
export HISTCONTROL=ignorespace:ignoredups
 
# append to history file
shopt -s histappend

# review substitution result
shopt -s histverify
 
# check window size after each command
shopt -s checkwinsize
 
# auto-completion
if [[ -f /etc/bash_completion ]]; then
  . /etc/bash_completion
fi
 
# disallow messages from other users
mesg n

# add $HOME/bin to path
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi


# prompt
GREEN="\[\033[32m\]"
BLACK="\[\033[0;39m\]"
WHITE="\[\033[33m\]"
YELLOW="\[\033[35m\]"
export PS1="$GREEN\u$BLACK@$WHITE\h $YELLOW\W$BLACK\$ "

# aliases
alias ls='ls -ph --color=auto'
alias l='ls -l'
alias ll='l -a'
alias t='tree -ph'
alias tt='t -a'
alias vim='vim -p'
alias vi='vim'
alias vif='vi `find ./ -name \!#:1`'
alias open='xdg-open'
alias tmux='TERM=screen-256color tmux'

# default editor
export EDITOR="vim"

# TERM variable
if [[ -z $TMUX ]]; then
  export TERM=xterm-256color
fi

# colors
[[ -f ~/.bashrc_colors ]] && . ~/.bashrc_colors

# local changes
[[ -f ~/.bashrc_local ]] && . ~/.bashrc_local

