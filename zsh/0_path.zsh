# path, the 0 in the filename causes this to load first

PATH=$HOME/anaconda/bin:$PATH

pathAppend() {
  # Only adds to the path if it's not already there
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    PATH=$PATH:$1
  fi
}

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

pathAppend "./bin"
pathAppend "$HOME/.local/bin"
pathAppend "$HOME/.yadr/bin"
pathAppend "$HOME/.yadr/bin/yadr"
pathAppend "./node_modules/.bin"
pathAppend "$HOME/Development/flutter/flutter/bin"
pathAppend "$HOME/Development/blockchain/open-source/fabric-samples/bin"
