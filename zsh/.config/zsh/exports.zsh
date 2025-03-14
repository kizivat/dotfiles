if [[ "$OSTYPE" == "darwin"* ]]; then
    export DEV_DIR="${HOME}/Developer"
    
    # Configure 1Password as SSH agent on macOS
    OP_SSH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    if [ -S "$OP_SSH_SOCK" ]; then
        export SSH_AUTH_SOCK="$OP_SSH_SOCK"
        # Verify 1Password SSH agent is working
        if ssh-add -l 2>&1 | grep -q "The agent has no identities"; then
            echo "⚠️  1Password SSH agent enabled but no identities found."
            echo "   - Open 1Password → Settings → Developer → Use the SSH agent"
            echo "   - Add SSH keys to 1Password and mark them as 'Allow using key for SSH'"
        fi
    fi
else
    export DEV_DIR="${HOME}/dev"
    
    # Configure 1Password as SSH agent on Linux
    OP_SSH_SOCK="$HOME/.1password/agent.sock"
    if [ -S "$OP_SSH_SOCK" ]; then
        export SSH_AUTH_SOCK="$OP_SSH_SOCK"
    fi
fi

## Use the CLI fd to respect ignore files (like '.gitignore'),
## display hidden files, and exclude the '.git' directory.
export FZF_DEFAULT_COMMAND='fd . --hidden --exclude ".git"'

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
fpath[1,0]="/opt/homebrew/share/zsh/site-functions";
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"; export PATH;
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
