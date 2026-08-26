#!/usr/bin/env bash
# stow-ify.sh — migrate a ~/.config/<dirname> into the dotfiles repo's Stow layout
set -euo pipefail

DOTFILES_DIR="$HOME/config"      # your dotfiles repo root
SRC_CONFIG="$HOME/.config"

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <dirname>" >&2
    exit 1
fi

dirname="$1"
src="$SRC_CONFIG/$dirname"
pkg_dir="$DOTFILES_DIR/$dirname"
dest_parent="$pkg_dir/.config"
dest="$dest_parent/$dirname"

# 1. Confirm it actually exists in ~/.config
if [[ ! -d "$src" ]]; then
    echo "Error: '$src' not found." >&2
    exit 1
fi

# 2. Don't clobber an existing package dir
if [[ -e "$dest" ]]; then
    echo "Error: '$dest' already exists. Aborting." >&2
    exit 1
fi

# 3. Create the Stow-shaped skeleton and move the real config in
mkdir -p "$dest_parent"
mv "$src" "$dest"
echo "Moved: $src -> $dest"

# 4. Re-link it back into place with stow, so ~/.config/<dirname> still works
if command -v stow >/dev/null 2>&1; then
    (cd "$DOTFILES_DIR" && stow -t "$HOME" "$dirname")
    echo "Stowed '$dirname' -> symlinked back to $src"
else
    echo "Warning: stow not installed — '$dirname' moved but not symlinked back." >&2
fi
