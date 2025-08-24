# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sunny/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

alias ls='lsd'
alias grep='grep --color=auto'
alias warpon='warp-cli connect'
alias warpoff='warp-cli disconnect && sudo systemctl restart systemd-resolved'
alias clear-cache='sudo rm -rf /var/cache/* ~/.cache/yay/ ~/.cache/winetricks/ ~/.cache/zen ~/.cache/firefox'
alias remove-unused='sudo pacman -Qdtq | sudo pacman -Rns -'
alias update-mirrors='rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist'
alias update-chaotic='rate-mirrors chaotic-aur | sudo tee /etc/pacman.d/chaotic-mirrorlist'
alias vi='nvim'
alias vim='nvim'

if [ -d "/home/sunny/.local/bin" ] && [[ ":$PATH:" != *":/home/sunny/.local/bin:"* ]]; then
    PATH="${PATH:+"$PATH:"}/home/sunny/.local/bin"
fi

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
