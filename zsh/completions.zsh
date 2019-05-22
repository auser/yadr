fpath[1,0]=~/.zsh/completion/
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
