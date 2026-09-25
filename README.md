# Development environment for macOS users (zsh edition)

## Introduction

My personal dotfiles for setting up a development environment on macOS.

> This is the **zsh** branch. It is no longer actively maintained; the
> [main branch](https://github.com/nguyenvulong/devenv-macos) uses fish and gets new updates.

- Terminal
  - [cmux](https://www.cmux.dev/), the Ghostty-based terminal for AI coding agents, or
  - [Warp](https://app.warp.dev/referral/REQYP5), for built-in AI features, or
  - [Ghostty](https://ghostty.org), the elegant Zig-based terminal
- Shell: Zsh (the macOS default) with the Starship prompt, autosuggestions and syntax highlighting
- Neovim (with LazyVim) and vim
- Sketchybar

| Shell                                                        | Neovim                                                       | Tmux                                                              | LazyGit                                                       |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ----------------------------------------------------------------- | ------------------------------------------------------------- |
| <img src="./assets/shell-1.png" width="200" height="150" />  | <img src="./assets/neovim-1.png" width="200" height="150" /> | <img src="./assets/tmux-1.png" width="200" height="150" />        | <img src="./assets/lazygit-1.png" width="200" height="150" /> |
| **Shell**                                                    | **Neovim**                                                   | **VS Code + Tmux**                                                | **Warp**                                                      |
| <img src="./assets/shell-2.png" width="200" height="150" />  | <img src="./assets/neovim-2.png" width="200" height="150" /> | <img src="./assets/vscode_tmux-1.png" width="200" height="150" /> | <img src="./assets/warp-1.png" width="200" height="150" />    |

## Getting started

### 1. Install Homebrew

If you don't have Homebrew yet:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone the repository

```bash
git clone --branch zsh https://github.com/nguyenvulong/devenv-macos.git ~/devenv-macos
cd ~/devenv-macos
```

### 3. Run the install script

```bash
./install.sh            # install Homebrew packages and link the configs
./install.sh --dry-run  # preview what would change
```

The script installs everything in the `Brewfile` and symlinks `.zshrc`, `ghostty`, `nvim`, `sketchybar`,
`starship.toml` and `.vimrc` into your home directory. Existing files are moved to
`~/.dotfiles-backup/<timestamp>/` first, and running it again is safe. Run `./install.sh --help` for all options.

### 4. (Optional) Manage packages yourself

If you'd rather not use the script, install the packages with Homebrew Bundle:

```bash
brew bundle install
```

To regenerate the Brewfile from your current packages:

```bash
brew bundle dump --force
```

### 5. Start using zsh

Zsh is already the default shell on macOS, so just open a new terminal (or run `exec zsh`).
If you changed your login shell before, switch back with `chsh -s /bin/zsh`.

`~/.zshrc` sets up:

- Prompt: [Starship](https://starship.rs), configured in `~/.config/starship.toml`
- Plugins from Homebrew: zsh-autosuggestions, zsh-syntax-highlighting and zsh-completions
- fzf key bindings: `Ctrl-R` searches history, `Ctrl-T` finds files, `Alt-C` changes directory
- Node version switching with fnm (reads `.nvmrc` / `.node-version` when you `cd`)
- A large shared history with timestamps (`history` shows them)
- Aliases: `ls`/`ll`/`l`/`tree` (eza), `cat` (bat), `v`/`vim` (Neovim)

Put machine-specific settings (API keys, extra `PATH` entries, work aliases) in `~/.zshrc.local`.
It is loaded at the end of `~/.zshrc` and is not part of this repository.

### 6. Configure Neovim

The Neovim configuration uses LazyVim as the base with additional customizations:

- Package manager: lazy.nvim
- Theme: tokyonight-moon
- LSP support for multiple languages
- Various coding and UI enhancements
- Extra plugins: undotree (`<leader>U`), rainbow_csv, markdown-preview
- Clipboard: system clipboard locally, OSC 52 over SSH

Plugins are installed automatically the first time you start `nvim`. Plugin versions are pinned in
`lazy-lock.json`; run `:Lazy restore` to install exactly those versions, or `:Lazy update` to upgrade them
and commit the updated lock file.

### 7. Start Sketchybar

The Sketchybar config is already linked by the install script, so just start the service:

```bash
brew services start sketchybar
```

To hide the default macOS menu bar, enable **System Settings → Control Center → Automatically hide and show the menu bar → Always**.

## Credits

The configurations build upon these amazing projects:

- [Neovim](https://github.com/neovim/neovim) - Hyperextensible Vim-based text editor
- [LazyVim](https://github.com/LazyVim/LazyVim) - Neovim config for the lazy
- [Ghostty](https://ghostty.org) - GPU-accelerated cross-platform terminal emulator
- [Sketchybar](https://github.com/FelixKratz/SketchyBar) - A highly customizable macOS status bar replacement
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) and [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [Starship](https://starship.rs) - A minimal, blazing-fast, and infinitely customizable prompt for any shell

Special thanks to these individuals for sharing the config files and writing.

- Michael Bao: [tcmmichaelb139/.dotfiles](https://github.com/tcmmichaelb139/.dotfiles)
- Dusty Phillips: [LazyVim for Ambitious Developers](https://lazyvim-ambitious-devs.phillips.codes)

## License

This project is licensed under the [MIT License](./LICENSE).
