# General
# --------------------------------------------------------------------------------
branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\j\[$(tput setaf 4)\]\[$(tput setaf 5)\]\$(branch)\[$(tput setaf 2)\] \W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"

export EDITOR=nvim

# Aliases
# --------------------------------------------------------------------------------
alias vim=nvim
alias vi=nvim

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

mkcd () { mkdir -p $1 && cd $1; }
trash () { command mv "$@" ~/.Trash; }

# recursive directory list
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

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
