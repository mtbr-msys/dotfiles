if [ "$(uname)" = 'Darwin' ]; then
	setopt no_global_rcs
	export PATH="/usr/local/bin":$PATH
	export PATH="/usr/local/sbin:$PATH"
	export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
	export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
elif [ "$WSL_DISTRO_NAME" ]; then
	export PATH="/mnt/c/Program Files/Microsoft VS Code/bin:$PATH"
fi
# node
export PATH="$HOME/.nodenv/bin:$PATH"
if which nodenv > /dev/null; then
	eval "$(nodenv init -)";
fi

# ruby 
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then
	eval "$(rbenv init -)";
fi

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then
	eval "$(pyenv init -)";
fi

# dokku
alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'
