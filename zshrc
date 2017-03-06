export ZSH=/Users/osmanmesutozcan/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git npm warhol)
source $ZSH/oh-my-zsh.sh

export EDITOR="vim"                                                                             # Set default editor.
export LANG=en_US                                                                               # Set locale.
export GOPATH=$HOME                                                                             # Set GOPATH.

alias zshconfig="vim ~/.dotfiles/zshrc"
alias vimconfig="vim ~/.dotfiles/vimrc"
alias vim="mvim -v"
alias vi="mvim -v"

alias ":Q"="clear"
alias ":q"="clear"

# less syntax highlighting (brew install source-highlight)
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads RSVM
[[ -s /Users/osmanmesutozcan/.rsvm/rsvm.sh ]] && . /Users/osmanmesutozcan/.rsvm/rsvm.sh

########## Handy scripts ##########
# mkdir, cd into it
mkcd() {
  mkdir -p "$*"
  cd "$*"
}

# move file to trash
sfr() {
  mv -v "$*" $HOME/.Trash
}
