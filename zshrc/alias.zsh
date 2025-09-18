alias config="$CONFIG"
alias dotfiles="$HOME/.dotfiles"
alias nvimconfig="$CONFIG/nvim"

# NPM
alias run="npm run"
alias build="npm run build"
alias start="npm start"
alias dev="npm run dev"
alias format="npm run format"
alias test="npm run test"
alias prod="npm run build && npm start"
alias i="npm i"
alias ci="npm ci"
alias pack="npm pack --pack-destination"
alias clean="rm -rf node_modules && npm ci"

alias -s {js,jsx,ts,html,css,scss,sass,json,md,txt,php,yml,vue}=$EDITOR

# Neovim distros
alias nvchad="NVIM_APPNAME='nvchad' nvim"
alias lvim="NVIM_APPNAME=lvim nvim"

# Better commands
alias ls="eza \
  --color=always \
  --icons=always \
  --long \
  --no-filesize \
  --no-permissions \
  --no-time \
  --no-user \
  -stype \
  -G \
  -w80 \
"
alias rm="trash -F"
alias cat="bat"
alias mkdir"mkdir -p -v"
alias mv="mv -i"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias tree="tree -C"

# Manage zshrc
alias reload-zshrc='source ~/.zshrc && reset && zsh'
alias edit-zshrc="$EDITOR ~/.zshrc"
alias edit-aliases="nvim ~/zshrc/alias.zsh"

alias lasttag='git describe --abbrev=0 --tags'

# Projects
alias side="$REPOS/side"
alias work="$REPOS/work"
alias packages="$REPOS/packages"
alias courses="$REPOS/courses/"
alias s=side
alias w=work
alias c=courses

# Project folders
alias components="$REPOS/work/components/storybook"
alias testing="$REPOS/work/components/testing"
alias tokens="$REPOS/work/tokens"
