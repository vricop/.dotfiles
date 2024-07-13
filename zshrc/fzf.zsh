# Default opts
export FZF_DEFAULT_OPTS='
  --info=inline --padding=2 --reverse --border-label=""
  --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
  --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
  --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
  --prompt="󰍉  " --marker="󰄬 " --pointer="󰅂 " --separator="─"
  --scrollbar="┃"
  --height 100%'

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,.next,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

source <(fzf --zsh)

open-project(){
  dir="${REPOS}/work"
  result="${dir}/$(\ls $dir | fzf)"
  cd $result && nvim
}

zle -N open-project
bindkey '^X' open-project
