# create the pane with irssi's nicklist
function irssi_nickpane() {
  tmux renamew irssi                                              # name the window
  # tmux -q setw main-pane-width $(( $(tput cols) - 21))            # set the main pane width to the total width-20
  # tmux splitw -v "cat ~/.irssi/nicklistfifo"                      # create the window and begin reading the fifo
  tmux -q selectl main-vertical                                   # assign the layout
  tmux selectw -t irssi                                           # select window 'irssi'
  tmux selectp -t 0                                               # select pane 0
}

# irssi wrapper
function irssi() {
  irssi_nickpane
  $(which irssi)                                                  # launch irssi
}

# repair running irssi's nicklist pane
function irssi_repair() {
  tmux selectw -t irssi
  tmux selectp -t 0
  tmux killp -a                                                   # kill all panes
  irssi_nickpane
}
