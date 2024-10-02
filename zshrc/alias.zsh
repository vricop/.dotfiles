alias config="$CONFIG"
alias dotfiles="$HOME/.dotfiles"
alias nvimconfig="$CONFIG/nvim"

# NPM
alias run="npm run"
alias build="npm run build"
alias start="npm start"
alias dev="npm run dev"
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
alias ls="eza --icons=always --color=always --git --no-filesize --no-user --no-time --long --no-permissions -G"
alias rm="trash -F"
alias cat="bat"
alias mkdir"mkdir -p -v"
alias mv="mv -i"
alias vi="nvim"
alias vim="nvim"
alias tree="tree -C"
alias zellij="zellij -l welcome"

# Manage zshrc
alias reload-zshrc='source ~/.zshrc && reset && zsh'
alias edit-zshrc="$EDITOR ~/.zshrc"
alias edit-aliases="nvim ~/zshrc/alias.zsh"

# Git aliases
alias gl="git log"
alias glol="git log --oneline"
alias gs="git status"
alias gco="git checkout"
alias gsw="git switch"
alias gsw-t="git switch --track"
alias gsw-c="git switch -c"
alias gb="git branch"
alias gc="git commit"
alias lasttag='git describe --abbrev=0 --tags'
alias gsl="git log --oneline | fzf --preview=\"echo {1} | cut -d ' ' -f 1 | xargs -I '#' sh -c 'git show --color=always #'\" | delta"
alias gst="git stash"
alias gstp="git stash push -u"
alias gstpm="git stash push -u --message"

# Projects
alias side="${REPOS}/side"
alias work="${REPOS}/work"
alias courses="${REPOS}/courses/"
alias s=side
alias w=work
alias c=courses

# Project folders
alias tokens="${REPOS}/work/kiwi-tokens"
alias tokens-ios="${REPOS}/work/kiwi-ios"
alias transforms="${REPOS}/work/sd-internal-transforms"
alias components="${REPOS}/work/@components"
alias config="$"
