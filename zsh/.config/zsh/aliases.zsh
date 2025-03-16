# Navigation
alias ls="ls --color=auto"
alias l="ls -lah"

alias dev="cd ${DEV_DIR}"

for dir in ${DEV_DIR}/*; do
  if [ -d "$dir" ]; then
    alias_name=$(basename "$dir")
    alias "${alias_name}"="cd $dir"
  fi
done

# File editing
alias c="code"
alias cr="code --reuse-window"
alias ca="code --add"

alias v="nvim"

# Git
# Prompts for your GitHub repos you want to clone
# and clones them into the current directory
alias ghc='gh-clone'

gh-clone() {
  # Get all repos and filter out already cloned ones
  local all_repos=$(gh repo list --limit 1000 --json name,owner,isFork --jq '.[] | select(.isFork == false) | "\(.owner.login)/\(.name)"')
  
  echo "$all_repos" | while read -r repo; do
    local org=$(echo "$repo" | cut -d'/' -f1)
    local repo_name=$(echo "$repo" | cut -d'/' -f2)
    local target_path="${DEV_DIR}/${org}/${repo_name}"
    
    # Only include repositories that don't already exist locally
    if [ ! -d "$target_path" ]; then
      # Get additional info for display
      local desc=$(gh repo view "$repo" --json description --jq '.description')
      if [ ${#desc} -gt 60 ]; then
        desc="${desc:0:57}..."
      fi
      echo "$repo (${desc:-No description})"
    fi
  done | fzf --multi --bind 'space:toggle' --header 'Select repositories to clone (SPACE to select, ENTER to confirm)' | sed 's/ (.*//' | while read -r repo; do
    # Extract organization/username from the repo
    local org=$(echo "$repo" | cut -d'/' -f1)
    local repo_name=$(echo "$repo" | cut -d'/' -f2)
    
    # Create organization directory if it doesn't exist
    local target_dir="${DEV_DIR}/${org}"
    mkdir -p "$target_dir"
    
    echo "Cloning $repo into $target_dir..."
    gh repo clone "$repo" "$target_dir/$repo_name"
  done
}
