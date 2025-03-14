# dotfiles

A dotfiles repository for configuring my UNIX systems.

It contains install scripts for macOS and Ubuntu. Each script uses
[stow](https://www.gnu.org/software/stow/) to symlink the dotfiles to the
appropriate locations.

The top-level includes packages. Each of the script installs packages relevant
to the system.

## Installation

Fork this repository on Github and check out your fork anywhere on the system. My prefered location is
`${DEV_DIR}/<organization>`, where `${DEV_DIR}` is my primary the development
directory. For macOS, I prefer `export DEV_DIR=~/Developer` (as it comes with nice icone in Finder). The `<organization>` would be similar to the GitHub user/organization
name.

```sh
git clone https://github.com/kizivat/dotfiles.git ~/${DEV_DIR}/<organization>
```

### Private Submodule

This repository uses a private git submodule for personal configurations. You'll need to:

1. Fork this repository
2. Create your own private repository for sensitive configs
3. Replace the submodule with your own

```bash
# Go to the forked repository
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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/opt/homebrew/bin/brew shellenv)"
```

After this, you'll need to install stow through Homebrew to use this dotfiles repo.

```sh
brew install stow
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

If your git submodules were private, you'll now need to authenticate with GitHub
to install the private dotfiles.

If you're using 1Password, you need to set it up using the app's GUI and turn on
the "Use the SSH agent" option in the 1Password `Settings > Developer` menu.

To use install the private dotfiles, you'll now need to initialize the submodules.

```sh
git submodule update --init --recursive
```

Now you can reinstall the dotfiles together with the private ones.

```sh
./macos
```

### Ubuntu

The following command will install the dotfiles on a Ubuntu system.

```sh
./ubuntu
```
