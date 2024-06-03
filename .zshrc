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

open-work() {
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

open-side() {
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

open-course() {
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
 
# Load all config files
for file in ~/zshrc/*; do
  source $file
done
