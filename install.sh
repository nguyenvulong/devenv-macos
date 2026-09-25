#!/usr/bin/env bash
#
# Set up the dotfiles in this repository on macOS.
#
#   ./install.sh              install packages and link configs
#   ./install.sh --dry-run    show what would happen without changing anything
#
# Existing files are moved to ~/.dotfiles-backup/<timestamp>/ before linking.
# Running the script again is safe: links that are already correct are skipped.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# Paths relative to both the repository and $HOME
LINKS=(
  .config/fish
  .config/ghostty
  .config/nvim
  .config/sketchybar
  .config/starship.toml
  .vimrc
)

DRY_RUN=0
SKIP_BREW=0
SET_SHELL=0

usage() {
  cat <<EOF
Usage: $(basename "$0") [options]

Options:
  -n, --dry-run   Print the actions without making changes
      --no-brew   Skip Homebrew and 'brew bundle'
      --shell     Set fish as the login shell
  -h, --help      Show this help
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
  -n | --dry-run) DRY_RUN=1 ;;
  --no-brew) SKIP_BREW=1 ;;
  --shell) SET_SHELL=1 ;;
  -h | --help)
    usage
    exit 0
    ;;
  *)
    echo "Unknown option: $1" >&2
    usage >&2
    exit 1
    ;;
  esac
  shift
done

info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33mwarning:\033[0m %s\n' "$*" >&2; }

run() {
  if [ "$DRY_RUN" -eq 1 ]; then
    printf '    [dry-run] %s\n' "$*"
  else
    "$@"
  fi
}

install_packages() {
  if ! command -v brew >/dev/null 2>&1; then
    if [ -x /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      info "Installing Homebrew"
      if [ "$DRY_RUN" -eq 1 ]; then
        printf '    [dry-run] install Homebrew\n'
        return
      fi
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  fi

  info "Installing packages from Brewfile"
  run brew bundle install --file="$REPO_DIR/Brewfile"
}

link() {
  local rel="$1"
  local src="$REPO_DIR/$rel"
  local dest="$HOME/$rel"

  if [ ! -e "$src" ]; then
    warn "missing in repository, skipping: $rel"
    return
  fi

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "    ok       $dest"
    return
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "    backup   $dest -> $BACKUP_DIR/$rel"
    run mkdir -p "$(dirname "$BACKUP_DIR/$rel")"
    run mv "$dest" "$BACKUP_DIR/$rel"
  fi

  echo "    link     $dest -> $src"
  run mkdir -p "$(dirname "$dest")"
  run ln -s "$src" "$dest"
}

link_dotfiles() {
  info "Linking dotfiles"
  for rel in "${LINKS[@]}"; do
    link "$rel"
  done
}

set_login_shell() {
  local fish_path
  fish_path="$(command -v fish || true)"
  if [ -z "$fish_path" ]; then
    warn "fish is not installed, not changing the login shell"
    return
  fi

  info "Setting fish as the login shell"
  if ! grep -qx "$fish_path" /etc/shells; then
    if [ "$DRY_RUN" -eq 1 ]; then
      printf '    [dry-run] add %s to /etc/shells\n' "$fish_path"
    else
      echo "$fish_path" | sudo tee -a /etc/shells >/dev/null
    fi
  fi
  if [ "${SHELL:-}" != "$fish_path" ]; then
    run chsh -s "$fish_path"
  fi
}

main() {
  if [ "$(uname -s)" != "Darwin" ]; then
    warn "these dotfiles target macOS; continuing anyway"
  fi

  [ "$SKIP_BREW" -eq 1 ] || install_packages
  link_dotfiles
  [ "$SET_SHELL" -eq 0 ] || set_login_shell

  info "Done"
  if [ -d "$BACKUP_DIR" ]; then
    echo "    Previous files were saved to $BACKUP_DIR"
  fi
  cat <<EOF

Next steps:
  - Start Sketchybar:  brew services start sketchybar
  - Open Neovim once to install plugins:  nvim
  - Restart your terminal
EOF
}

main
