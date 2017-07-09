# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#load compl.
if which brew &> /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# tab completion for SSH hostnames
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

test -r /sw/bin/init.sh && . /sw/bin/init.sh
