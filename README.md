# Development environment for macOS users

## Introduction

My personal dotfiles for setting up a development environment on macOS.

- Terminal
  - [cmux](https://www.cmux.dev/), the Ghostty-based terminal for AI coding agents, or
  - [Warp](https://app.warp.dev/referral/REQYP5), for built-in AI features, or
  - [Ghostty](http://ghostty.org), the elegant Zig-based terminal
- Shell
  - Fish
  - Zsh (default shell for macOS, see the [zsh branch](https://github.com/nguyenvulong/devenv-macos/tree/zsh))
- Neovim (with LazyVim) and vim
- Sketchybar

| Sketchybar                                                   | Warp                                                         | Neovim, LazyGit                                                   | Tmux                                                          |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ----------------------------------------------------------------- | ------------------------------------------------------------- |
| <img src="./assets/shell-1.png" width="200" height="150" />  | <img src="./assets/neovim-1.png" width="200" height="150" /> | <img src="./assets/tmux-1.png" width="200" height="150" />        | <img src="./assets/lazygit-1.png" width="200" height="150" /> |
| <img src="./assets/neovim-2.png" width="200" height="150" /> | <img src="./assets/shell-2.png" width="200" height="150" />  | <img src="./assets/vscode_tmux-1.png" width="200" height="150" /> | <img src="./assets/warp-1.png" width="200" height="150" />    |

## Getting started

### 1. Install Homebrew

If you don't have Homebrew yet:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone the repository

```bash
git clone https://github.com/nguyenvulong/devenv-macos.git ~/devenv-macos
cd ~/devenv-macos
```

### 3. Install the packages

All required packages are managed through Homebrew Bundle:

```bash
brew bundle install
```

To regenerate the Brewfile from your current packages:

```bash
brew bundle dump --force
```

### 4. Link the dotfiles

Symlink the configs into your home directory (back up any existing files first):

```bash
mkdir -p ~/.config
for dir in fish ghostty nvim sketchybar; do
  ln -sfn ~/devenv-macos/.config/$dir ~/.config/$dir
done
ln -sf ~/devenv-macos/.config/starship.toml ~/.config/starship.toml
ln -sf ~/devenv-macos/.vimrc ~/.vimrc
```

### 5. Set up fish as your shell

After the install, just execute `fish` and confirm the settings for the first time.
Make sure to check the configuration in `~/.config/fish/config.fish` and `~/.config/starship.toml`,
then you're good to go.

To set fish as a login shell:

```bash
echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/fish"
```

Then restart your terminal.

### 6. Configure Neovim

The Neovim configuration uses LazyVim as the base with additional customizations:

- Package manager: lazy.nvim
- Theme: tokyonight-moon
- LSP support for multiple languages
- Various coding and UI enhancements

Plugins are installed automatically the first time you start `nvim`.

### 7. Start Sketchybar

The Sketchybar config is already linked in step 4, so just start the service:

```bash
brew services start sketchybar
```

To hide the default macOS menu bar, enable **System Settings → Control Center → Automatically hide and show the menu bar → Always**.

## Credits

The configurations builds upon these amazing projects:

- [Neovim](https://github.com/neovim/neovim) - Hyperextensible Vim-based text editor
- [LazyVim](https://github.com/LazyVim/LazyVim) - Neovim config for the lazy
- [Ghostty](https://ghostty.org) - GPU-accelerated cross-platform terminal emulator
- [Sketchybar](https://github.com/FelixKratz/SketchyBar) - A highly customizable macOS status bar replacement
- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) - A delightful community-driven framework for Zsh
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - A fast and feature-rich Zsh theme
- [Starship](http://starship.rs) - A minimal, blazing-fast, and infinitely customizable prompt for any shell

Special thanks to these individuals for sharing the config files and writing.

- KevinSilvester: [wezterm-config](https://github.com/KevinSilvester/wezterm-config)
- Michael Bao: [tcmmichaelb139/.dotfiles](https://github.com/tcmmichaelb139/.dotfiles)
- Dusty Phillips: [LazyVim for Ambitious Developers](https://lazyvim-ambitious-devs.phillips.codes)

## License

This project is licensed under the MIT.