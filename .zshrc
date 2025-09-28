export ZSH="$HOME/.oh-my-zsh"

# Path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/17/bin
export PATH="$HOME/.dotfiles/bin:$PATH"

# env vars
export XDG_CONFIG_HOME=$HOME/.config
export CLICOLOR=1 # Enable ls with colors
export TERM="xterm-ghostty"
export EDITOR="nvim"
export VISUAL="nvim"
export BAT_THEME="Catppuccin Mocha"
export CONFIG="$HOME/.config"
export REPOS="$HOME/Repos"
export EXA_ICON_SPACING=2
export ATAC_KEY_BINDINGS="$CONFIG/atac/vim_key_bindings.toml"

# Add deno completions to search path
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
  export FPATH="$HOME/.zsh/completions:$FPATH"; 
fi

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
  . $file
done

eval "$(starship init zsh)"
# eval $(ssh-agent)
. "$HOME/.deno/env"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# opencode
export PATH=$HOME/.opencode/bin:$PATH

# MyInvestor nvm config
. "$HOME/.dotfiles/zshrc/myinvestor.zsh"
