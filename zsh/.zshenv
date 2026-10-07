# The only zsh file in $HOME. Everything else lives in $ZDOTDIR, so installers
# that blindly append to ~/.zshrc write to a file zsh never reads.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
