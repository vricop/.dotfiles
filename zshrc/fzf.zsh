export FZF_DEFAULT_COMMAND="find . -type f"

export FZF_DEFAULT_OPTS="
  --info inline --padding 2 --reverse
  --color bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
  --color fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
  --color marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
  --prompt '󰍉  ' --marker '󰄬 ' --pointer ' ' --separator '─'
  --scrollbar '┃'
  --height 100%
"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --walker-skip '.git,.next,node_modules,target,.Trash'
  --preview 'bat -n --color 'always' {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target,.Trash
  --preview 'tree -L 1 -C {}'
"

source <(fzf --zsh)
