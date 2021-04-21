# Path to your oh-my-zsh installation.
export ZSH="/Users/yhuggler/.oh-my-zsh"
export LC_ALL=en_US.UTF-8

# Initialize Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_MODE="nerfont-complete"

# Aliases
alias v="nvim"

# Git
alias gcmsg="git commit -m"
alias gco="git checkout"
alias gstat="git status"
alias gaa="git add ."

alias work="./.dotfiles/start_working.sh"

export LD_LIBRARY_PATH=/usr/local/lib

export VISUAL=nvim
export EDITOR="$VISUAL"

plugins=(
  git 
  nvm 
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yhuggler/.sdkman"
[[ -s "/Users/yhuggler/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yhuggler/.sdkman/bin/sdkman-init.sh"
