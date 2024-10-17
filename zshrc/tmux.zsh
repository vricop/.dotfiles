# Tmux session fuzzy finder
export to() {
  tmux a -t $(tmux ls | sed 's|:.*||' | fzf --prompt='Select session  : ')
}
