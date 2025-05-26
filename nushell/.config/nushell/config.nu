# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"
$env.PROMPT_INDICATOR = ""
$env.STARSHIP_SHELL = "nu"
$env.config.show_banner = false
if "~/.local/share/bob/nvim-bin" not-in $env.PATH {
  $env.PATH = $env.PATH | prepend "~/.local/share/bob/nvim-bin"
}

# cmake stuff
$env.CC = "gcc"
$env.CXX = "g++"
$env.CMAKE_LINKER_TYPE = "mold"
$env.CMAKE_EXPORT_COMPILE_COMMANDS = "ON"
$env.CMAKE_C_COMPILER_LAUNCHER = "ccache"
$env.CMAKE_CXX_COMPILER_LAUNCHER = "ccache"
$env.COMP_WORDBREAKS = ":"
$env.MANPAGER = "nvim +Man!"

# cargo stuff
$env.RUSTC_WRAPPER = "sccache"
$env.CARGO_TARGET_x86_LINUX_GNU_LINKER = "gold"
$env.RUSTFLAGS = "-C link-arg=-fuse-ld=mold"

def --wrapped fzf [...rest] {
  (FZF_DEFAULT_OPTS="
    --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
    --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
    --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
    --color=selected-bg:#494d64
    --multi" ^fzf ...$rest)
}

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
source ./catppuccin_macchiato.nu
