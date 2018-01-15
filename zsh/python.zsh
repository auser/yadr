# Virtualenv/VirtualenvWrapper
# export WORKON_HOME=$HOME/.virtualenvs
# export PYTHONSTARTUP=~/.pythonrc

export PYENV_ROOT="$HOME/.pyenv"
export ANACONDA_ROOT="$HOME/anaconda"
export DEFAULT_PYTHON="$ANACONDA_ROOT/envs/default/bin"
export PATH="$ANACONDA_ROOT/bin:$PATH"
#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

source activate default

# eval (env _PIPENV_COMPLETE=source-zsh pipenv)
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# eval "$(pyenv virtualenv-init -)"
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# virtualenv aliases
# http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
# alias v='workon'
# alias v.deactivate='deactivate'
# alias v.mk='mkvirtualenv --no-site-packages'
# alias v.mk_withsitepackages='mkvirtualenv'
# alias v.rm='rmvirtualenv'
# alias v.switch='workon'
# alias v.add2virtualenv='add2virtualenv'
# alias v.cdsitepackages='cdsitepackages'
# alias v.cd='cdvirtualenv'
# alias v.lssitepackages='lssitepackages'
#
# export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH