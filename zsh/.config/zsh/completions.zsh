autoload -Uz compinit
compinit

# 1Password completions
eval "$(op completion zsh)"; compdef _op op

# Homebrew completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Add deno completions to search path
if [[ ":$FPATH:" != *":$HOME/completions:"* ]]; then export FPATH="$HOME/completions:$FPATH"; fi

[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
