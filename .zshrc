export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export CLICOLOR=1 # Enable ls with colors
export TERM=xterm-256color
export EDITOR="nvim"
export BAT_THEME="Catppuccin Mocha"
export CONFIG="$HOME/.config"
export REPOS="$HOME/Repos"
export EXA_ICON_SPACING=2

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

# Load all config files
for file in ~/zshrc/*; do
  source $file
done
