# Homebrew first: prepends its bin dirs and sets HOMEBREW_*, FPATH, MANPATH, INFOPATH.
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv zsh)"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.lmstudio/bin"
