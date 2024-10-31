if [ "$(uname)" = 'Darwin' ]; then
	setopt no_global_rcs
	export PATH="/usr/local/bin":$PATH
	export PATH="/usr/local/sbin:$PATH"
	export PATH="/usr/local/opt/openssl/bin:$PATH"
	export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
	export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
	export PATH=$HOME/.homebrew_$(uname -m)/bin:$PATH
	export HOMEBREW_CACHE=$HOME/.homebrew_$(uname -m)/cache
	export PATH="$HOME/.rd/bin:$PATH"

	if [ -z "$SSH_AUTH_SOCK" ]; then
	# Check for a currently running instance of the agent
	RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
	if [ "$RUNNING_AGENT" = "0" ]; then
			# Launch a new instance of the agent
			ssh-agent -s &> $HOME/.ssh/ssh-agent
	fi
	eval `cat $HOME/.ssh/ssh-agent` > /dev/null
	ssh-add --apple-use-keychain ~/.ssh/id_ed25519 2> /dev/null
	fi
	
elif [ "$WSL_DISTRO_NAME" ]; then
	export PATH="/mnt/c/Program Files/Microsoft VS Code/bin:$PATH"
	export LESSCHARSET='utf-8'
	if [ -z "$SSH_AUTH_SOCK" ]; then
	# Check for a currently running instance of the agent
	RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
	if [ "$RUNNING_AGENT" = "0" ]; then
			# Launch a new instance of the agent
			ssh-agent -s &> $HOME/.ssh/ssh-agent
	fi
	eval `cat $HOME/.ssh/ssh-agent` > /dev/null
	ssh-add ~/.ssh/id_ed25519 2> /dev/null
	fi
fi

#JAVA
export JENV_ROOT="$HOME/.jenv_$(uname -m)"
export PATH="$JENV_ROOT/bin:$PATH"
if which jenv > /dev/null; then
	eval "$(jenv init -)"
fi

# node
export NODENV_ROOT="$HOME/.nodenv_$(uname -m)"
export PATH="$NODENV_ROOT/bin:$PATH"
if which nodenv > /dev/null; then
	eval "$(nodenv init -)";
fi

# ruby 
export RBENV_ROOT="$HOME/.rbenv_$(uname -m)/"
export PATH="$RBENV_ROOT/bin:$PATH"
if which rbenv > /dev/null; then
	eval "$(rbenv init -)";
fi

# python
export PYENV_ROOT="$HOME/.pyenv_$(uname -m)"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then
	eval "$(pyenv init --path)";
fi

# php
export PHPENV_ROOT="$HOME/.phpenv_$(uname -m)"
export PATH="$PHPENV_ROOT/bin:$PATH"
if which phpenv > /dev/null; then
	eval "$(phpenv init -)"
fi


# bin
if [ -d "$HOME/bin_$(uname -m)" ] ; then
    PATH="$HOME/bin_$(uname -m):$PATH"
fi

# dokku
alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'

#DEVKIT
export DEVKITPRO=/opt/devkitpro
export DEVKITPPC=$DEVKITPRO/devkitPPC
export PATH=$DEVKITPPC/bin:$DEVKITPRO/tools/bin:$PATH

#THEOS
export THEOS=~/theos

#Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
