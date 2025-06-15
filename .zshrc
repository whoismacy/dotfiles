# currently using oh-my-posh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export PATH="$HOME/.fzf/bin:$PATH"
export FZF_DEFAULT_OPTS="--color=fg:#ffffff,bg:#1c1c1c,hl:#ff0000,fg+:#ffffff,bg+:#3c3c3c,hl+:#00ff00,info:#00ff00,prompt:#ff0000,pointer:#00ff00,marker:#ff0000,spinner:#00ff00"

#Directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

#Add in Powerlevel 10k
# zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

#Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Load Completions
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History
HISTSIZE=15000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#Aliases
alias cat="batcat"
alias ls='ls --color'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias sc='shellcheck'
alias tmuxconf='vim ~/.tmux.conf'
alias valgrind='valgrind --show-leak-kinds=all --leak-check=full --track-origins=yes'
alias ..='z ..'
alias py='python3'
alias i3cf='vim ~/.config/i3/config'
alias y='yazi'
alias kittyconf='vim ~/.config/kitty/kitty.conf'
alias e='eza --icons=always'
alias pipes='pipes -R -f13 -p2 -t8'
alias yt='yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b"'
alias tpdf='termpdf.py'
alias gcc='gcc -Wall -Wextra -Wpedantic'
alias aria2c='aria2c --seed-time=0'
alias n='nvim'
alias v='vim'
alias 'git log'='git log --oneline --graph --all';

# Shell Integrations
eval "$(fzf --zsh)"

# use vim keybindings in the terminal
set -o vi

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Set vim as the default app to open the man pages.
# export MANPAGER='vim +Man!'

# necessary for running deno
. "/home/shrmrm/.deno/env"

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# necessary for zoxide
 eval "$(zoxide init zsh)"

 # starship -necessary
 if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
    "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
  zle -N zle-keymap-select ""
fi
eval "$(starship init zsh)"

 # adding .local/bin to path
 export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/home/shrmrm/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

# adding nvim to path
export PATH="$PATH:/opt/nvim/"
