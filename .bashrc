# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
 
umask 022

# disable coredumps by default
ulimit -c 0

# User specific aliases and functions
case "$TERM" in
    screen) export TERM=screen-256color;;
    #xterm-color|*-256color) color_prompt=yes;;
esac

export PS1="[\[\e[33m\]\A\[\e[0m\]] \[\e[0;36m\]\u@\H\[\e[0m\]:\W\$ ";
export EDITOR=vim
alias ls="ls -at --color"
alias tmux="tmux -2"

PATH=$HOME/.local/bin${PATH:+:${PATH}}
CPATH=$HOME/.local/include${CPATH:+:${CPATH}}
LD_LIBRARY_PATH=$HOME/.local/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#LDFLAGS="-L$HOME/.local/lib -rdynamic ${LDFLAGS}"

alias rm='rm -i'
alias ls='ls --color -a'
export PIN_ROOT=$HOME/pin-kit
export WORKSPACE=/projectnb/ec513/students/${USER}/
source /projectnb/ec513/materials/HW6/spec-2017/sourceme
cd $WORKSPACE
