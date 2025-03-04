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

$env.config.show_banner = false
$env.PATH = $env.PATH | prepend "~/.local/share/bob/nvim-bin"

# cmake stuff
$env.CC = "gcc"
$env.CXX = "g++"
$env.CMAKE_LINKER_TYPE = "mold"
$env.CMAKE_EXPORT_COMPILE_COMMANDS = "ON"
$env.CMAKE_C_COMPILER_LAUNCHER = "ccache"
$env.CMAKE_CXX_COMPILER_LAUNCHER = "ccache"

# Overwrite the default man to use batman.
# When `pg` is present, `pg_or_pgnum` is the page number and takes an int, and
# `pg` is the page name.
# Otherwise, `pg_or_pgnum` is the page name.
def man [pg_or_pgnum, pg?: string] {
  match $pg {
    null => {BAT_THEME='Catppuccin Macchiato' MANROFFOPT='-c' BATMAN_IS_BEING_PAGER='yes' ^batman $pg_or_pgnum}
    _ =>  {BAT_THEME='Catppuccin Macchiato' MANROFFOPT='-c' BATMAN_IS_BEING_PAGER='yes' ^batman $pg_or_pgnum $pg}
  }
}
# overwrite fzf for colorscheme
def fzf [...opts] {
  FZF_DEFAULT_OPTS="
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
--color=selected-bg:#494d64
--multi" ^fzf ...$opts
}

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
# source ~/.local/share/atuin/init.nu
source ($nu.default-config-dir | path join "navi-integration.nu")
source ./catppuccin_macchiato.nu
