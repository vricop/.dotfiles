# Enable zsh vi mode
bindkey -v
export KEYTIMEOUT=1

# Open nvim with Control+V
open-nvim() { nvim }
zle -N open-nvim

bindkey '^V' open-nvim

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history-char
bindkey -M menuselect 'k' vi-up-line-or-history-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history-char
bindkey -M menuselect 'up' vi-up-line-or-history-char
bindkey -M menuselect 'right' vi-forward-char

# Fix backspace bug when switching modes
bindkey '^?' backward-delete-char

# Enable dynamic cursor for vi-mode plugin
# 0/1 Blinking block
# 2 Solid block
# 3 Blinking underline
# 4 Solid underline
# 5 Blinking line
# 6 Solid line 
VI_MODE_SET_CURSOR=true
VI_MODE_CURSOR_NORMAL=2
VI_MODE_CURSOR_VISUAL=2
VI_MODE_CURSOR_INSERT=6
VI_MODE_CURSOR_OPPEND=2
