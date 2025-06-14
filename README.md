# My dotfiles

![nice example](./example.png)

## What's in here?

- Dotfiles for my following programs
  - Neovim
  - Zsh (unused)
  - Tmux (unused)
  - kitty
  - hyprland
  - wob
  - atuin (unused)
  - Wallpapers I use.
  - and some more

## Wallpaper credits

- [Skirk](https://www.pixiv.net/en/artworks/114284093)
- The fastfetch and hyprlock shogun images are from Hoyoverse's Paimon Paintings.

## Dependencies

- These are (NeoVim) stuff that cannot be download through Lazy and/or Mason.
  - clang/clang++
    - While clangd can be downloaded with Mason, you can also use your package
    manager to download.
  - clang-tools-extra
  - rustup

- These are the stuff that need more configuration than just cloning and `stow`ing
this repository:
  - git (obviously).
  - wob (create a socket and bind wob to it) (available on wob's GitHub page).
  - zsh-syntax-highlighting.
    - Do check the `source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`.
    - Your zsh-syntax-highlighting install may be in a different directory.
  - For hyprland, you're likely going to need to install hyprpaper and hyprlock separately.
  - Similarly, swaylock may need to be installed separately from sway.
