# prompt
autoload -U colors && colors
PROMPT="%{$fg[blue]%}%~ %{$fg[green]%}❯ %{$reset_color%}"

# aliases
alias ls='exa --icons --git'
alias cat="bat"
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'

# keybinds
bindkey '^H' backward-kill-word # ctrl + backspace
bindkey '^[[1;5C' forward-word # ctrl + right arrow
bindkey '^[[1;5D' backward-word # ctrl + left arrow

# history
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# plugins
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
