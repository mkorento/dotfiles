# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
if [ -z "$PS1" ]; then return; fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth; export HISTCONTROL

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000

HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# uncomment for a colored prompt, if the terminal has the capability
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

branch () {
    if [ -d .git ]; then

        BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/ ' | cut -c-10)

        echo -ne "$BRANCH"
    fi
}

if [ "$color_prompt" = yes ]; then
    if [ "$(id -u)" == "0" ]; then
        PS1='\[\033[01;07;31m\]\u@\h\[\033[0;1;31m\] \w \$(branch)\$ \[\033[00m\]'
    else
        PS1="\[\033[36m\]\u@\h \[\033[36m\]\w \$(branch)\[\033[36m\]\$ \[\033[00m\]"
    fi
else
    PS1='\u@\h:\w$ '
fi
export PS1
unset color_prompt force_color_prompt

alias ls="ls --color=always"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias r="ls -latru"
alias o="ls -latru"
alias cdr="cd"

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=always'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ -f "$HOME/.git_aliases" ]; then
    . "$HOME/.git_aliases"
fi

if [ -f "$HOME/.aliases" ]; then
    . "$HOME/.aliases"
fi

if [ -f "$HOME/.less_colors" ]; then
    . "$HOME/.less_colors"
fi

cd () { builtin cd "$@" && ls -latru; }

if [ -n "$TMUX" ]; then
    ls --color=auto -latru
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f "/etc/bash_completion" ] && ! shopt -oq posix; then
    . "/etc/bash_completion"
fi

stty -ixon
stty -ixoff

check_disk_usage

if [ -f "/var/log/notifications/errors" ]; then
    echo -n '\033[1;37;41m'
    cat "/var/log/notifications/errors"
    echo -n '\033[00m'
fi

/home/mika/tmpscripts/set_wide_resolution
