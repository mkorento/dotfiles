#!/bin/zsh
autoload zmv
stty -ixon

autoload -U promptinit
promptinit

autoload -U colors
colors

autoload -U compinit
compinit

autoload -Uz vcs_info

zmodload zsh/complist

zstyle ':vcs_info:*' actionformats '%b:%a'
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git

zstyle ':completion:*:descriptions' format ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' special-dirs true

# Some functions, like _apt and _dpkg, are very slow.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# if  you  want  the  number  of  errors  allowed by _approximate to increase
# with the length of what you have typed so far
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# Ignore completion functions for commands you don’t have
zstyle ':completion:*:functions' ignored-patterns '_*'

# Completing process IDs with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# If you end up using a directory  as  argument,  this  will  remove  the
# trailing slash (useful in ln)
zstyle ':completion:*' squeeze-slashes true

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z-_}={A-Z_-}'

# generate descriptions with magic
zstyle ':completion:*' auto-description 'specify: %d'

# Don't prompt for a huge list, page it
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Don't prompt for a huge list, menu it
zstyle ':completion:*:default' menu 'select=0'

# color code completion
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

# Don't complete stuff already on the line
zstyle ':completion::*:(rm|vi|vim):*' ignore-line true

# Don't complete directory we are already in (../here)
zstyle ':completion:*' ignore-parents parent pwd


# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# No more annoying pushd messages
setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# this will ignore multiple directories for the stack
setopt PUSHD_IGNORE_DUPS

# 10 second wait if you do something that will delete everything
setopt RM_STAR_WAIT

# use magic
setopt ZLE

# disable Ctrl-s
setopt NO_FLOW_CONTROL

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB
setopt RC_EXPAND_PARAM
setopt PROMPT_CR
setopt PROMPT_SP
setopt PROMPT_SUBST
setopt NO_BEEP

setopt menu_complete
setopt autocd
setopt extendedglob
setopt multios
setopt auto_pushd

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt HIST_NO_STORE
setopt HIST_VERIFY
disable r

export HISTSIZE=10000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export KEYTIMEOUT=10
export PROMPT_EOL_MARK=""

export LESS_TERMCAP_mb=$(printf "\e[1;31m");
export LESS_TERMCAP_md=$(printf "\e[1;31m");
export LESS_TERMCAP_me=$(printf "\e[0m");
export LESS_TERMCAP_se=$(printf "\e[0m");
export LESS_TERMCAP_so=$(printf "\e[1;41;33m");
export LESS_TERMCAP_ue=$(printf "\e[0m");
export LESS_TERMCAP_us=$(printf "\e[1;32m");
export LESS_TERMCAP_mb=$(printf "\e[1;38;5;74m");

if [ -d "$HOME/.zsh" ]; then
    if [ -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
        source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    fi
fi

if [ -f "$HOME/.functions" ]; then
    source "$HOME/.functions"
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    if [ -d "$HOME/.oh-my-zsh/plugins/git" ]; then
        source "$HOME/.oh-my-zsh/plugins/git/git.plugin.zsh"
    fi
fi

alias ls="ls --color=always"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias r="ls -latr"
alias o="ls -latr"
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
    source "$HOME/.aliases"
fi

cd () { builtin cd "$@" && ls; }

if [ -n "$TMUX" ]; then
    ls --color=auto
fi

for c in cp rm chmod chown rename; do
    alias $c="$c -v"
done

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins ' ' magic-space
bindkey -M vicmd '\e' noop
bindkey -M vicmd v edit-command-line
bindkey -M vicmd "q" push-line
bindkey -M vicmd '!' edit-command-output
bindkey -M vicmd "j" vi-down-line-or-history-and-BOL
bindkey -M vicmd "k" vi-up-line-or-history-and-BOL
bindkey -M vicmd "." repeat-last-action

# select autocompletion suggestion with pressing enter once
bindkey -M menuselect '^M' .accept-line

# Incremental search
bindkey -M vicmd "/" history-incremental-search-forward
bindkey -M vicmd "?" history-incremental-search-backward

bindkey -M viins "^R" history-incremental-search-forward
bindkey -M viins "^N" history-incremental-search-backward

bindkey -M isearch '^R' history-incremental-search-backward
bindkey -M isearch '^N' history-incremental-search-forward

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Rebind the insert key
bindkey '\e[2~' overwrite-mode

# Rebind the delete key
bindkey '\e[3~' delete-char

bindkey '^[[Z' reverse-menu-complete
bindkey '^T' gosmacs-transpose-chars

# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/
typeset -Ag FX FG BG
FX=(
reset "%{[00m%}"
bold "%{[01m%}" no-bold "%{[22m%}"
italic "%{[03m%}" no-italic "%{[23m%}"
underline "%{[04m%}" no-underline "%{[24m%}"
blink "%{[05m%}" no-blink "%{[25m%}"
reverse "%{[07m%}" no-reverse "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

normal_mode_colour='%F{012}'
vi_mode_colour='%F{11}'
prompt_char_color="$normal_mode_colour"

if [ `id -u` -eq 0 ]; then
    PROMPT='$BG[009]$FG[016]%n@%m%{$reset_color%} %F{009}${PWD/$HOME/~} \
$(get-git-branch)$prompt_char_color$%f '
else
    PROMPT='%F{012}%n@%m%{$reset_color%} %F{012}${PWD/$HOME/~} \
$(get-git-branch)$prompt_char_color$%f '
fi

if [ -d "./venv" ]; then
    VIRTUAL_ENV_DISABLE_PROMPT="true"; export VIRTUAL_ENV_DISABLE_PROMPT
    . ./venv/bin/activate
fi

get-git-branch() {
    BRANCH_COLOR="%F{002}"

    command git diff-index --quiet HEAD 2> /dev/null
    if [ "$?" -ne 0 ]; then
        BRANCH_COLOR="%F{001}"
    fi

    BRANCH="${vcs_info_msg_0_}"
    if [ -n "$BRANCH" ]; then
        if [ ${#BRANCH} -gt 20 ]; then
            BRANCH=`echo $BRANCH | cut -c 1-14`
        fi
    fi
    echo "$BRANCH_COLOR$BRANCH%f"
}

precmd() {
    vcs_info
}

zle-keymap-select() {
  if [ "$KEYMAP" = "vicmd" ]; then
      prompt_char_color="$vi_mode_colour"
  else
      prompt_char_color="$normal_mode_colour"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

zle-line-finish() {
  prompt_char_color="$normal_mode_colour"
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode
# indicator, while in fact you would be in INS mode Fixed by catching SIGINT
# (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything
# else depends on it, we will not break it Thanks Ron!
TRAPINT() {
  prompt_char_color="$normal_mode_colour"
  return $(( 128 + $1 ))
}

repeat-last-action() {
    zle kill-whole-line
    zle up-history
    zle accept-line
}
zle -N repeat-last-action

vi-up-line-or-history-and-BOL() {
    zle vi-up-line-or-history
    zle beginning-of-line
}
zle -N vi-up-line-or-history-and-BOL

vi-down-line-or-history-and-BOL() {
    zle vi-down-line-or-history
    zle beginning-of-line
}
zle -N vi-down-line-or-history-and-BOL

expand-or-complete-with-dots() {
    echo -n "\e[31m...\e[0m"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "\t" expand-or-complete-with-dots

stripped-edit-command-line() {
    local tmpfile=${TMPPREFIX:-/tmp/zsh}ecl$$

    print -R - "$PREBUFFER$BUFFER" >$tmpfile
    exec </dev/tty
    ${=${EDITOR:-vi}} $tmpfile
    print -Rz - "$(<$tmpfile)"

    command rm -f $tmpfile
    zle send-break
}
zle -N edit-command-line stripped-edit-command-line

sneak_forward_f() {
    if [[ $sneak_on -eq 0 ]]; then
        sneak_on=1
        orig_region_highlight=("${region_highlight[@]}")
    fi

    : ${STYLE:="fg=0,bg=yellow"}

    region_highlight=("${orig_region_highlight[@]}")

    if [[ $# -ge 2 ]]; then
        sneak_a=$1
        sneak_b=$2
    else
        read -ks 1 sneak_a
        read -ks 1 sneak_b
    fi

    if [[ $# -eq 3 ]]; then
        #pass
    else
        forward_sneak=1
    fi

    local target_i=$CURSOR

    # correct the starting point
    (( target_i=$target_i+1 ))

    # if <this> and <this+1> contains a matching pair, ignore it and advance
    # parwise.
    # if ^ not, then move one forward and then pairwise scan
    if [[ ${BUFFER[target_i]} == "$sneak_a" ]] && [[ ${BUFFER[(($target_i+1))]} == "$sneak_b" ]]; then
        (( target_i=$target_i+2 ))
    else
        (( target_i=$target_i+1 ))
    fi

    # scan for matching pairs
    unset hits
    set -A hits
    while (($target_i < $#BUFFER)); do
        if [[ ${BUFFER[$target_i]} == "$sneak_a" ]] && [[ ${BUFFER[(($target_i+1))]} == "$sneak_b" ]]; then
            local temp=$target_i

            # subtract one for use in CURSOR assignment
            (( temp=$temp-1 ))

            hits+=($temp)

            # pairwise advancement
            (( target_i=target_i+1 ))
        fi

        (( target_i++ ))

    done

    if [[ $#hits -gt 0 ]]; then

        local i=1
        while (($i <= $#hits)); do
            local start_idx=${hits[$i]}

            local end_idx=$start_idx
            (( end_idx=$end_idx+2 ))

            region_highlight+=( "$start_idx $end_idx $STYLE" )
            (( i++ ))
        done
        CURSOR=${hits[1]}
        shift hits
    fi
}
zle -N sneak_forward sneak_forward_f
bindkey -M vicmd "s" sneak_forward

sneak_backward_f() {
    if [[ $sneak_on -eq 0 ]]; then
        sneak_on=1
        orig_region_highlight=("${region_highlight[@]}")
    fi

    : ${STYLE:="fg=0,bg=yellow"}

    region_highlight=("${orig_region_highlight[@]}")

    if [[ $# -ge 2 ]]; then
        sneak_a=$1
        sneak_b=$2
    else
        read -ks 1 sneak_a
        read -ks 1 sneak_b
    fi

    if [[ $# -eq 3 ]]; then
        #pass
    else
        forward_sneak=0
    fi

    local target_i=$CURSOR

    # correct the starting point
    # (( target_i=$target_i+1 ))

    # if <this> and <this+1> contains a matching pair, ignore it and advance
    # parwise.
    # if ^ not, then move one forward and then pairwise scan
    # if [[ ${BUFFER[target_i]} == "$sneak_a" ]] && [[ ${BUFFER[(($target_i+1))]} == "$sneak_b" ]]; then
    #     (( target_i=$target_i+2 ))
    # else
    #     (( target_i=$target_i+1 ))
    # fi

    # scan for matching pairs
    unset hits
    set -A hits
    while (($target_i >= 0)); do
        if [[ ${BUFFER[$target_i]} == "$sneak_b" ]] && [[ ${BUFFER[(($target_i-1))]} == "$sneak_a" ]]; then
            local temp=$target_i

            # subtract one to get to the right  starting place
            (( temp=$temp-1 ))

            # subtract one for use in CURSOR assignment
            (( temp=$temp-1 ))

            hits+=($temp)

            # pairwise advancement
            (( target_i=target_i-1 ))
        fi

        (( target_i-- ))

    done

    if [[ $#hits -gt 0 ]]; then

        local i=1
        while (($i <= $#hits)); do
            local start_idx=${hits[$i]}

            local end_idx=$start_idx
            (( end_idx=$end_idx+2 ))

            region_highlight+=( "$start_idx $end_idx $STYLE" )
            (( i++ ))
        done
        CURSOR=${hits[1]}
        shift hits
    fi
}
zle -N sneak_backward sneak_backward_f
bindkey -M vicmd "H" sneak_backward

new-repeat-find_f() {
    if [[ $sneak_on -eq 1 ]]; then
        if [[ $forward_sneak -eq 1 ]]; then
            sneak_forward_f $sneak_a $sneak_b
        else
            sneak_backward_f $sneak_a $sneak_b
        fi
    else
        zle vi-repeat-find
    fi

}
zle -N new-repeat-find new-repeat-find_f
bindkey -M vicmd ";" new-repeat-find

new-rev-repeat-find_f() {
    if [[ $sneak_on -eq 1 ]]; then
        if [[ $forward_sneak -eq 1 ]]; then
            sneak_backward_f $sneak_a $sneak_b skip
        else
            sneak_forward_f $sneak_a $sneak_b skip
        fi
    else
        zle vi-rev-repeat-find
    fi

}
zle -N new-rev-repeat-find new-rev-repeat-find_f
bindkey -M vicmd "," new-rev-repeat-find

new-find-next-char_f() {
    if [[ $sneak_on -eq 1 ]]; then
        unset sneak_on
        region_highlight=("${orig_region_highlight[@]}")

        # redisplay command-line?
        # zle -cR ''
    fi

    zle vi-find-next-char
}
zle -N new-find-next-char new-find-next-char_f
bindkey -M vicmd "f" new-find-next-char

new-find-next-char-skip_f() {
    if [[ $sneak_on -eq 1 ]]; then
        unset sneak_on
        region_highlight=("${orig_region_highlight[@]}")

        # redisplay command-line?
        # zle -cR ''
    fi

    zle vi-find-next-char-skip
}
zle -N new-find-next-char-skip new-find-next-char-skip_f
bindkey -M vicmd "t" new-find-next-char-skip

new-find-prev-char_f() {
    if [[ $sneak_on -eq 1 ]]; then
        unset sneak_on
        region_highlight=("${orig_region_highlight[@]}")

        # redisplay command-line?
        # zle -cR ''
    fi

    zle vi-find-prev-char
}
zle -N new-find-prev-char new-find-prev-char_f
bindkey -M vicmd "F" new-find-prev-char

new-find-prev-char-skip_f() {
    if [[ $sneak_on -eq 1 ]]; then
        unset sneak_on
        region_highlight=("${orig_region_highlight[@]}")

        # redisplay command-line?
        # zle -cR ''
    fi

    zle vi-find-prev-char-skip
}
zle -N new-find-prev-char-skip new-find-prev-char-skip_f
bindkey -M vicmd "T" new-find-prev-char-skip

insert_setsid() {
    zle beginning-of-line; zle -U "setsid ";
}
zle -N insert-setsid insert_setsid
bindkey "^s" insert-setsid

edit-command-output() {
    BUFFER=$(eval $BUFFER)
    CURSOR=0
}
zle -N edit-command-output

emit-space() {
    zle -U " ";
}
zle -N emit-space
bindkey "^_" emit-space

noop() { }
zle -N noop

url-encode() {
    echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

gos() {
    $BROWSER "http://www.google.com/search?q=\
        `url-encode "${(j: :)@}"`" > /dev/null 2>&1
}

_ag() {
  if (( CURRENT == 2 )); then
    compadd $(cut -f 1 tags .git/tags tmp/tags 2>/dev/null | grep -v '!_TAG')
  fi
}
compdef _ag ag

GPG_TTY=$(tty); export GPG_TTY

if [ -f "/var/log/notifications/error" ]; then
    echo '\033[00;41mERRORS!\033[00m'
fi
