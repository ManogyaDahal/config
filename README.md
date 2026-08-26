# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a Stow "package" mirroring `$HOME`.

```
.
├── alacritty
├── archive/xorg     #unused Xorg stuffs
├── foot
├── hypr-omarchy
├── lazydocker
├── lazygit
├── mpv
├── nvim              # git submodule
├── ranger
├── scripts           # -> ~/.local/bin
├── stow-ify.sh        # migrates ~/.config/<dir> into this repo's Stow layout
├── tmux
└── zathura
```
## Clone

nvim is tracked as a submodule, so clone recursively:

```bash
git clone --recurse-submodules git@github.com:ManogyaDahal/config.git ~/config
```

Already cloned without it?

```bash
git submodule update --init --recursive
```

## Install (symlink everything)

```bash
cd ~/config
stow -t "$HOME" alacritty foot hypr-omarchy lazydocker lazygit mpv nvim ranger scripts tmux zathura
```

Install a single package:

```bash
stow -t "$HOME" nvim
```

## Uninstall / re-link

```bash
stow -D -t "$HOME" nvim     # remove symlinks
stow -R -t "$HOME" nvim     # restow (unlink + relink, e.g. after moving files)
```

## Adding a new package

Use `stow-ify.sh` to migrate an existing `~/.config/<dir>` into this repo and symlink it back:

```bash
./stow-ify.sh <dirname>
```

## nvim submodule workflow

Edit and push normally from inside the submodule:

```bash
cd ~/config/nvim/.config/nvim
git add . && git commit -m "..." && git push
```

Then bump the pointer in the parent repo:

```bash
cd ~/config
git add nvim/.config/nvim
git commit -m "bump nvim submodule"
git push
```

## Notes

- `archive/xorg` holds retired Xorg configs (dwm, dmenu, slstatus, picom, redshift, `.xinitrc`) — kept for reference, never stowed.
- Conflicts on install (e.g. an existing real file at `~/.config/foo`) will make `stow` refuse and list the offending file — remove/back it up, then re-run.
