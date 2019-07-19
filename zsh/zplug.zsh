export ZPLUG_HOME="${HOME}/.zplug"

if [[ ! -d "${ZPLUG_HOME}" ]]; then
  echo "Installing zplug"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  # zplug.sh domain has expired
  # curl -sL --proto-redir -all,https https://zplug.sh/installer | zsh
  source "${ZPLUG_HOME}/init.zsh"
  zplug update
else
  source "${ZPLUG_HOME}/init.zsh"
fi

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/fasd",   from:oh-my-zsh
zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-autosuggestions"

# theme
# zplug "mafredri/zsh-async", on:sindresorhus/pure
# zplug "sindresorhus/pure", use:pure.zsh, defer:3, as:theme

zplug "b4b4r07/emoji-cli"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

if command -v rbenv &> /dev/null; then
  eval "$(rbenv init - --no-rehash zsh)"
fi