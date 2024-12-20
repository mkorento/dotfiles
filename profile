if [ -d "$HOME/bin" ] ; then
    PATH=$PATH:$HOME/bin
    MANPATH=$MANPATH:$HOME/share/man
    if [ -d "$HOME/bin/bin" ] ; then
        PATH=$PATH:$HOME/bin/bin
        MANPATH=$MANPATH:$HOME/bin/share/man
    fi

fi

if [[ -d "$HOME/.local/bin" ]]; then
    PATH=$PATH:$HOME/.local/bin
fi

if [ "$TERM" = "xterm" ]; then
    TERM=xterm-256color
fi

if [ -d "$HOME/scripts" ]; then
    PATH=$PATH:$HOME/scripts
fi

if [ -d "$HOME/tmpscripts" ]; then
    PATH=$PATH:$HOME/tmpscripts
fi

if [ -d "$HOME/clips" ]; then
    PATH=$PATH:$HOME/clips
fi

unset RUBYOPT
if [ -d "$HOME/.rbenv/bin" ]; then
    PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if [ -d "$HOME/.pyenv/bin" ]; then
    PYENV_ROOT=$HOME/.pyenv; export PYENV_ROOT
    PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi

EDITOR=vim; export EDITOR
PAGER=/usr/bin/less; export PAGER

# Get color support for 'less'
GROFF_NO_SGR=1; export GROFF_NO_SGR
LESS="--RAW-CONTROL-CHARS"; export LESS

LANG=en_US.utf8; export LANG

BROWSER='/home/mika/bin/firefox-dev'; export BROWSER

export PATH
export MANPATH

ANDROID_HOME='/mnt/levy/Android'
ANDROID_USER_HOME='/mnt/levy/Android/.android'
ANDROID_SDK_HOME='/mnt/levy/Android'
export ANDROID_HOME
export ANDROID_USER_HOME
export ANDROID_SDK_HOME

black="\033[30m"; export black
darkred="\033[31m"; export darkred
darkgreen="\033[32m"; export darkgreen
darkyellow="\033[33m"; export darkyellow
darkblue="\033[34m"; export darkblue
darkmagenta="\033[35m"; export darkmagenta
darkcyan="\033[36m"; export darkcyan
gray="\033[37m"; export gray
darkgray="\033[90m"; export darkgray
red="\033[91m"; export red
green="\033[92m"; export green
yellow="\033[93m"; export yellow
blue="\033[94m"; export blue
magenta="\033[95m"; export magenta
cyan="\033[96m"; export cyan
white="\033[97m"; export white
reset="\033[0m"; export reset

if [ -e "$TMUX" ]; then
    ls --color=auto
fi

alias tmux="tmux -2"

# /home/mika/tmpscripts/set_keyb

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . $HOME/.bashrc
    fi
fi

if [ -z "$DISPLAY" ] && [ "$(tty)" = /dev/tty1 ] && [ "$(id -u)" -ne 0 ]; then
    startx && exit
fi

# vim: ft=sh
