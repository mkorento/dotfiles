if [ -d "$HOME/bin" ] ; then
    PATH=$PATH:$HOME/bin
    MANPATH=$MANPATH:$HOME/share/man
    if [ -d "$HOME/bin/bin" ] ; then
        PATH=$PATH:$HOME/bin/bin
        MANPATH=$MANPATH:$HOME/bin/share/man
    fi
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

if [ -d "$HOME/heroku/bin" ]; then
    PATH="$HOME/heroku/bin:$PATH"
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

LC_ALL=en_US.utf8; export LC_ALL
LANG=en_US.utf8; export LANG

if [ "$(id -u)" != "0" ]; then
    if [ -f "$HOME/.gpg-agent-info" ]; then
        kill -s 0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null

        if [ "$?" -eq 0 ]; then
            GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info | cut -c 16-`;
            export GPG_AGENT_INFO
        else
            rm "$HOME/.gpg-agent-info" >/dev/null 2>&1
            eval $(gpg-agent --daemon --write-env-file "$HOME/.gpg-agent-info")
        fi
    else
        eval $(gpg-agent --daemon --write-env-file "$HOME/.gpg-agent-info")
    fi
fi

PATH=/usr/non-portage/bin:$PATH
BROWSER='/usr/bin/google-chrome-stable'; export BROWSER
if [ "$TERM" = "rxvt-unicode-256color" ]; then
    TERM=rxvt-unicode-256color-noit; export TERM
fi

export PATH
export MANPATH

black="\033[30m"; export black
red="\033[31m"; export red
green="\033[32m"; export green
yellow="\033[33m"; export yellow
blue="\033[34m"; export blue
magenta="\033[35m"; export magenta
cyan="\033[36m"; export cyan
white="\033[37m"; export white
reset="\033[0m"; export reset

stty -ixon
stty -ixoff

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . $HOME/.bashrc
    fi
fi

if [ -z "$DISPLAY" ] && [ "$(tty)" = /dev/tty1 ] && [ "$(id -u)" -ne 0 ]; then
    (startx &)
    exit
fi

# vim: ft=sh
