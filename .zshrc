export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/zsh"

ZSH_THEME="lukas"

# automatically update every 13 days
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

HIST_STAMPS="yyyy-mm-dd"

plugins=(brew docker eza fzf git git-auto-fetch golang ssh)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Configure pnpm
export PNPM_HOME="/Users/lukas/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$PATH:/Users/lukas/.local/bin:$(go env GOPATH)/bin"
eval "$(zoxide init zsh)"

source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-downd

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

