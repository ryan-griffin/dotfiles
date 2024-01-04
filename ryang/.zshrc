alias ls="eza --icons=auto"
alias cat="bat --paging=never"
alias less="bat --paging=always"
alias grep="rg --no-line-number"

HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

plugins=(
    zsh-autocomplete/zsh-autocomplete.plugin.zsh
    zsh-autosuggestions/zsh-autosuggestions.zsh
    fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
    zsh-autopair/autopair.zsh
)
for plugin in "${plugins[@]}"; do
    source "/usr/share/zsh/plugins/$plugin"
done

eval "$(starship init zsh)"
