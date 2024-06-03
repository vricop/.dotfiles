alias config="$CONFIG"
alias dotfiles="$HOME/.dotfiles"

# NPM
alias run="npm run"
alias build="run build"
alias start="npm start"
alias dev="run dev"
alias test="run test"
alias prod="build && start"
alias i="npm i"
alias ci="npm ci"
alias pack="npm pack --pack-destination"

# Repo folders
# alias work="${REPOS}/work/ && ls"
# alias side="${REPOS}/side && ls"
# alias courses="${REPOS}/courses && ls"

alias -s {js,jsx,ts,html,css,scss,sass,json,md,txt,php,yml,vue}=$EDITOR

# Neovim distros
alias nvchad="NVIM_APPNAME='nvchad' nvim"
alias lvim="NVIM_APPNAME=lvim nvim"

# Better commands
alias ls="eza --icons=always --color=always --git --no-filesize --no-user --no-time --long --no-permissions --tree --level=1"
alias rm="trash -F"
alias cat="bat"
alias mkdir"mkdir -p -v"
alias mv="mv -i"
alias vi="nvim"
alias vim="nvim"
alias tree="tree -C $@"

# Manage zshrc
alias reload-zshrc='source ~/.zshrc && reset && zsh'
alias edit-zshrc="$EDITOR ~/.zshrc"

# Git aliases
alias gs="git status"
alias gco="git checkout"
alias gsw="git switch"
alias gsw-t="git switch --track"
alias gsw-c="git switch -c"
alias gb="git branch"
alias gc="git commit"
alias lasttag='git describe --abbrev=0 --tags'
alias gsl="git log --oneline | fzf --preview=\"echo {1} | cut -d ' ' -f 1 | xargs -I '#' sh -c 'git show --color=always #'\" | delta"
