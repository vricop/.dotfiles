export ZSH="/Users/$USER/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH" # Fix broken python in macOS Monterey
ZSH_THEME="refined"
export CLICOLOR=1 # Enable ls with colors
export TERM=xterm-256color
export EDITOR="nvim"
export BAT_THEME="Catppuccin Mocha"
export CONFIG="$HOME/.config"
export REPOS="$HOME/Repos"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Default opts
export FZF_DEFAULT_OPTS='
  --info=inline --padding=2 --reverse --border-label=""
  --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
  --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
  --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
  --prompt="󰍉 " --marker="󰄬 " --pointer="󰅂 " --separator="─"
  --scrollbar="┃"'

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,.next,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

w() {
    dir="${REPOS}/work"
    cd "${dir}" || { echo "Failed to navigate to ${dir}"; return 1; }
    
    # Use ls to list files/directories and fzf to select one
    project=$(\ls | fzf)
    
    # Check if a project was selected
    if [ -n "$project" ]; then
      # Open the selected project with nvim
      cd "$project" && nvim
    else
      echo "No project selected"
    fi
}

s() {
    dir="${REPOS}/side"
    cd "${dir}" || { echo "Failed to navigate to ${dir}"; return 1; }
    
    # Use ls to list files/directories and fzf to select one
    project=$(\ls | fzf)
    
    # Check if a project was selected
    if [ -n "$project" ]; then
      # Open the selected project with nvim
      cd "$project" && nvim
    else
      echo "No project selected"
    fi
}

c() {
    dir="${REPOS}/courses"
    cd "${dir}" || { echo "Failed to navigate to ${dir}"; return 1; }
    
    # Use ls to list files/directories and fzf to select one
    project=$(\ls | fzf)
    
    # Check if a project was selected
    if [ -n "$project" ]; then
      # Open the selected project with nvim
      cd "$project" && nvim
    else
      echo "No project selected"
    fi
}

# TODO: Remove x86 version
# Brew with both ARM64 and x86 versions. This set like this so that I can use
# Apple's Game Porting Toolkit. Run under rossetta, which has to be installed
# using x86 brew version
if [ "$(arch)" = "arm64" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)" # Current version
else
  eval "$(/usr/local/bin/brew shellenv)"    # x86 version
fi
 
for file in ~/zshrc/*; do
  source $file
done
