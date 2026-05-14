alias ls="eza --icons=auto --group-directories-first"
alias cat="bat --paging=never"
alias less="bat --paging=always"
alias grep="rg --no-line-number"

HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

eval "$(dircolors -b)"

plugins=(
	fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
	zsh-autocomplete/zsh-autocomplete.plugin.zsh
	zsh-autosuggestions/zsh-autosuggestions.zsh
	zsh-autopair/autopair.zsh
)
for plugin in "${plugins[@]}"; do
	source "/usr/share/zsh/plugins/$plugin"
done

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

builtin zstyle ':completion:*:*:*:*' completer \
    _expand _complete _prefix _correct _ignored

eval "$(starship init zsh)"
