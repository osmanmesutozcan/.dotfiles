# Osman Mesut Ozcan <osmanmesutozcan@gmail.com>

# General
# --------------------------------------------------------------------------------
# sane defaults fron ubuntu
TERM=xterm-256color
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

shopt -s histappend
shopt -s checkwinsize

test -e ~/.dircolors && \
   eval `dircolors -b ~/.dircolors`

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-256color) color_prompt=yes;;
esac

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

branch_parse() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\j\[$(tput setaf 4)\]\[$(tput setaf 5)\]\$(branch_parse)\[$(tput setaf 2)\] \W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"

export EDITOR=nvim

# Go
# export PATH=$PATH:/usr/local/go/bin
# export GOPATH=$(go env GOPATH)
# export PATH=$PATH:$GOPATH/bin

# Aliases
# --------------------------------------------------------------------------------
alias emd="emacs -nw --daemon"
alias em="emacsclient -nw -c"

alias vim=nvim
alias vi=vim

# Fixing myself.
alias :q="clear"
alias :Q="clear"

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

alias ls="ls --color=always"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

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

docker_rm_all () {
    for c in `docker ps -a | awk '{ print $1 }'`; do
        if [[ "$c" == "CONTAINER" ]];then
            echo "Removing all in 2 seconds. Last chance to cancel.";
            sleep 2;
        else
            docker rm -f $c;
        fi
    done
}

docker_kill_all () {
    for c in `docker ps | awk '{ print $1 }'`; do
        if [[ "$c" == "CONTAINER" ]];then
            echo "Removing all in 2 seconds. Last chance to cancel.";
            sleep 2;
        else
            docker kill $c;
        fi
    done
}

docker_bash () {
    docker exec -ti $1 bash;
}

# Source
# --------------------------------------------------------------------------------
if [ -f ~/.dotfiles/bash_aliases ]; then
    . ~/.dotfiles/bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Temp
# --------------------------------------------------------------------------------
alias awscli="/Users/osmanmesutozcan/.pyenv/versions/productreview/bin"
echo -ne "\e]12;#00ff00\a"
