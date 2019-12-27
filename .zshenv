export PATH="/usr/local/bin":$PATH
# node
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
# ruby 
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# dokku
alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'

