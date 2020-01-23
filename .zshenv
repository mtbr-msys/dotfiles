export PATH="/usr/local/bin":$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# node
export PATH="$HOME/.ndenv/bin:$PATH"
if which ndenv > /dev/null; then
  eval "$(ndenv init -)";
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
