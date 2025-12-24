# Development environment for macOS users

## Introduction

My personal dotfiles for setting up a development environment on macOS

- Terminal
  - [Warp](https://app.warp.dev/referral/REQYP5), for built-in AI features, or
  - [Ghostty](http://ghostty.org), the elegant Zig-based terminal, or
  - [WezTerm](https://wezterm.org), for multiplexing enthusiasts
- Shell
  - Fish
  - Zsh (default shell for macOS, check zsh branch)
- Neovim (with LazyVim) and vim
- Sketchybar

| Sketchybar                                                   | WezTerm, Warp                                                | Neovim, LazyGit                                                   | Tmux                                                          |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ----------------------------------------------------------------- | ------------------------------------------------------------- |
| <img src="./assets/shell-1.png" width="200" height="150" />  | <img src="./assets/neovim-1.png" width="200" height="150" /> | <img src="./assets/tmux-1.png" width="200" height="150" />        | <img src="./assets/lazygit-1.png" width="200" height="150" /> |
| <img src="./assets/neovim-2.png" width="200" height="150" /> | <img src="./assets/shell-2.png" width="200" height="150" />  | <img src="./assets/vscode_tmux-1.png" width="200" height="150" /> | <img src="./assets/warp-1.png" width="200" height="150" />    |

## Prerequisites

Install Homebrew if you haven't already

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

All required packages are managed through Homebrew Bundle. To install all dependencies:

```bash
cd devenv-macos
brew bundle install
```

To create a new Brewfile with your current packages:

```bash
brew bundle dump --force
```

Make sure to use your username in `.config/fish/config.fish` and `~/.config/fish/fish_variables`.

## Components

### Fish

After `brew bundle install`, just execute `fish` and confirm the settings for the first time.
Make sure to check the configuration in `~/.config/fish/config.fish` and `~/.config/starship.toml`,
then you're good to go.

In order to set fish as a login shell

```
sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish
```

Then restart your terminal.

### Neovim

The Neovim configuration uses LazyVim as the base with additional customizations:

- Package manager: lazy.nvim
- Theme: tokyonight-moon
- LSP support for multiple languages
- Various coding and UI enhancements

Follow the instruction from [LazyVim for Ambitious Developers](https://lazyvim-ambitious-devs.phillips.codes).

### Sketchybar

Customize your MacOS's menu bar.

```bash
mkdir -p ~/.config/sketchybar/plugins
cp $(brew --prefix)/share/sketchybar/examples/sketchybarrc ~/.config/sketchybar/sketchybarrc
cp -r $(brew --prefix)/share/sketchybar/examples/plugins/ ~/.config/sketchybar/plugins/
```

## Credits

The configurations builds upon these amazing projects:

- [Neovim](https://github.com/neovim/neovim) - Hyperextensible Vim-based text editor
- [LazyVim](https://github.com/LazyVim/LazyVim) - Neovim config for the lazy
- [WezTerm](https://github.com/wez/wezterm) and [Ghostty](https://ghostty.org) - GPU-accelerated cross-platform terminal emulators
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
