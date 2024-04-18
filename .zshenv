if [ "$(uname)" = 'Darwin' ]; then
	setopt no_global_rcs
	export PATH="/usr/local/bin":$PATH
	export PATH="/usr/local/sbin:$PATH"
	export PATH="/usr/local/opt/openssl/bin:$PATH"
	export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
	export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
	export PATH=$HOME/.homebrew/bin:$PATH
	export HOMEBREW_CACHE=$HOME/.homebrew/cache
elif [ "$WSL_DISTRO_NAME" ]; then
	export PATH="/mnt/c/Program Files/Microsoft VS Code/bin:$PATH"
	export LESSCHARSET='utf-8'
fi

#JAVA
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then
	eval "$(jenv init -)"
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
	eval "$(pyenv init --path)";
fi

# php
export PATH="$HOME/.phpenv/bin:$PATH"
if which phpenv > /dev/null; then
	eval "$(phpenv init -)"
fi


# bin
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
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
