export XDG_CONFIG_HOME="${HOME}/.config"

# History
HISTSIZE=50000
HISTFILE="${HOME}/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

source "$XDG_CONFIG_HOME/zsh/path.zsh"
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$XDG_CONFIG_HOME/zsh/exports.zsh"
source "$XDG_CONFIG_HOME/zsh/completions.zsh"

# Check /opt/homebrew exists
eval "$(brew shellenv)"

# Homebrew
export HOMEBREW_BUNDLE_NO_LOCK=1

# Prompt
eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/oh-my-posh/custom.toml)"
# eval "$(oh-my-posh init zsh)" # default theme

# zinit
export ZINIT_HOME="${HOMEBREW_PREFIX}/opt/zinit"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no

# `fzf` setup
## Set up fzf  key bindings and fuzzy completion
source <(fzf --zsh)

# Navigation

setopt auto_cd 		# change dir without `cd`
