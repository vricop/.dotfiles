export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export CLICOLOR=1 # Enable ls with colors
export TERM=xterm-256color
export EDITOR="nvim"
export BAT_THEME="Catppuccin Mocha"
export CONFIG="$HOME/.config"
export REPOS="$HOME/Repos"

ZSH_THEME="refined"

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

op() {
  dir="${REPOS}/$1"
  
  cd "${dir}" || { echo "Failed to navigate to ${dir}"; return 1; }
  
  # Use ls to list files/directories and fzf to select one
  project=$(\ls | fzf)
  
  # Check if a project was selected
  [ -n "$project" ] && cd "$project" && nvim || echo "No project selected"
}

# Load all config files
for file in ~/zshrc/*; do
  source $file
done
