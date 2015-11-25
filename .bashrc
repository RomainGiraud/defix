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
 
# disallow messages from other users
mesg n

# add $HOME/bin to path
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi
 
# bash auto-completion
if [[ -f /etc/bash_completion ]]; then
  . /etc/bash_completion
fi

# git auto-completion
if [[ -f /usr/share/git/completion/git-completion.bash ]]; then
  . /usr/share/git/completion/git-completion.bash
fi

# prompt
GREEN="\[\033[32m\]"
BLACK="\[\033[0;39m\]"
WHITE="\[\033[33m\]"
YELLOW="\[\033[35m\]"
#export PS1="$GREEN\u$BLACK@$WHITE\h $YELLOW\W$BLACK\$ "
PROMPT_START="$YELLOW\w$BLACK"
PROMPT_END="$BLACK> "
export PROMPT_COMMAND=''
export PS1="$PROMPT_START$PROMPT_END"

# git prompt
if [[ -f /usr/share/git/completion/git-prompt.sh ]]; then
  . /usr/share/git/completion/git-prompt.sh

  export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch
  export GIT_PS1_SHOWCOLORHINTS=1

  export PROMPT_COMMAND='__git_ps1 "$PROMPT_START" "$PROMPT_END"'
fi

if ( [[ "$TERM" =~ ^xterm* ]] \
     || [[ "$TERM" =~ ^screen* ]] \
     || [[ "$TERM" =~ ^rxvt* ]] ) \
   && hash plompt 2>/dev/null; then

  function _update_ps1() {
    export PS1="$(plompt $?)"
  }
  export PROMPT_COMMAND="_update_ps1;"
fi

# aliases
alias ls='ls -ph --color=auto --group-directories-first'
alias l='ls -l'
alias ll='l -a'
alias t='tree -ph'
alias tt='t -a'
alias vim='vim -p'
alias vi='vim'
alias vif='vi `find ./ -name \!#:1`'
alias open='xdg-open'
alias grep='grep --color=auto'
alias g='grep -ir'
alias f='find ./ -iname'
alias rebash='source ~/.bashrc'
alias sudo='sudo -E'

function ff()
{
  find ./ -iname "*$1*"
}

# default pager
export PAGER='vimpager'
export MANPAGER='vimpager'

# default editor
export EDITOR="vim"

# enable coredump
ulimit -H -c unlimited
ulimit -S -c unlimited

# local changes
[[ -f ~/.bashrc_local ]] && . ~/.bashrc_local

