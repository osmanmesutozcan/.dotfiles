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


# Aliases
# --------------------------------------------------------------------------------
alias vim=nvim
alias vi=nvim

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

alias ls="ls --color=always"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep="grep --color=always"
alias egrep="egrep --color=always"

# recursive directory list
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

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
test -e ~/.dotfiles/aliases.sh && \
   source ~/.dotfiles/aliases.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

PATH="/Users/osmanmesutozcan/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/osmanmesutozcan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/osmanmesutozcan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/osmanmesutozcan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/osmanmesutozcan/perl5"; export PERL_MM_OPT;
