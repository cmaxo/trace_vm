# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# User specific aliases and functions
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
CLEAR="\[\033[00m\]"

PS1="$RED\u@\h$CLEAR:$BLUE\w$CLEAR $YELLOW\$(parse_git_branch)$CLEAR \$ "

set -o vi

alias h=history
alias tmux='tmux -2'
alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -a --color'
alias grep='grep --color=tty'

export EDITOR=vi

activate () {
    if [ -f /opt/l2l/$1/pyenv/bin/activate ]; then
        . /opt/l2l/$1/pyenv/bin/activate
        export PS1=($1)$PS1
    fi
}

export PATH=$PATH:/usr/local/go/bin

export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh
