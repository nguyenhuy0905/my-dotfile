# My dotfiles

## What's in here?

- Dotfiles for my following programs
  - Neovim
  - Zsh
  - Tmux
  - kitty
  - hyprland
  - wob
  - atuin
  - Wallpapers I use.
  - and some more

- For VS Code, since their extensions.json file contains some sensitive
info (aka, info about my directory structure), I will take the list of
extensions I currently have instead.
  - These extensions can be installed via the [convenience script](./vscode-install-extensions.sh)

> [!NOTE]
> As of now, some of the extensions in the script cannot be installed using
> the VS Code version shipped by package managers (eg, `pacman`).
> It is suspected that these extensions are only available in the proprietary
> version of VS Code.

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
