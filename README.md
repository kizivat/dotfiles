# dotfiles

A dotfiles repository for configuring my UNIX systems.

It contains install scripts for macOS and Ubuntu. Each script uses
[stow](https://www.gnu.org/software/stow/) to symlink the dotfiles to the
appropriate locations.

The top-level includes packages. Each of the script installs packages relevant
to the system.

## Installation

Check out the repository anywhere on the system. My prefered location is
`${DEV_DIR}/<organization>`, where `${DEV_DIR}` is my primary the development
directory. The `<organization>` would be similar to the GitHub user/organization
name.

### Private Submodule

This repository uses a private git submodule for personal configurations. You'll need to:

1. Fork this repository
2. Create your own private repository for sensitive configs
3. Replace the submodule with your own

```bash
# Clone your fork
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles

# Remove the existing submodule reference
git submodule deinit -f -- dotfiles-private
rm -rf .git/modules/dotfiles-private
git rm -f dotfiles-private

# Add your own private repository as a submodule
git submodule add https://github.com/yourusername/your-private-dotfiles.git dotfiles-private
git commit -m "Replace private dotfiles submodule with my own"
```

### macOS

Installing the dotfiles on clean macOS system requires having [Homebrew](https://brew.sh).
Install Homebrew with the following command:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

The following command will install the dotfiles on a macOS system.

```sh
./macos
```

Aerospace recomends the below to get around windows showing too small in Expose.
It groups the windows by application is an O.K. work around for me.

```sh
defaults write com.apple.dock expose-group-apps -bool true && killall Dock
```

#### Homebrew

After bootstrapping the system with the `macos` script, you can install the
packages from the `Brewfile` with the following command:

```sh
brew bundle install -g
```

### Ubuntu

The following command will install the dotfiles on a Ubuntu system.

```sh
./ubuntu
```
