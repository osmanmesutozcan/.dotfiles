# Osman Mesut Ozcan <osmanmesutozcan@gmail.com>


# General
# --------------------------------------------------------------------------------
# sane defaults fron ubuntu
HISTCONTROL=ignoredups:ignorespace
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export EDITOR=nvim

shopt -s histappend
shopt -s checkwinsize

if [[ `uname` == 'Darwin' ]]; then
    export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
else
    export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
fi
export LESS=' -R '

test -e ~/.dircolors && \
   eval `dircolors -b ~/.dircolors`

branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\j\[$(tput setaf 4)\]\[$(tput setaf 5)\]\$(branch)\[$(tput setaf 2)\] \W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"


# lib exports
export OPENNI2_INCLUDE=/usr/local/include/ni2
export OPENNI2_REDIST=/usr/local/lib/ni2


# Aliases
# --------------------------------------------------------------------------------
alias tODM="ssh -i ~/.ssh/opendronemap.pem \
    ubuntu@ec2-54-202-141-113.us-west-2.compute.amazonaws.com"

alias vim=nvim
alias vi=vim

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

alias ls="ls --color=always"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep="grep --color=always"
alias egrep="egrep --color=always"

alias tmux="TERM=screen-256color-bce tmux"

# recursive directory list
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' \
    -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

mkcd () { mkdir -p $1 && cd $1; }
trash () { command mv "$@" ~/.Trash; }
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
     else
         echo "'$1' is not a valid file"
     fi
}


# Source
# --------------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Platform specific configs.
if [[ `uname` == 'Darwin' ]]; then
    test -e ~/.dotfiles/bash_macos.sh && \
       source ~/.dotfiles/bash_macos.sh
fi
