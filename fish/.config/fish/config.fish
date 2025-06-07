# set nvim as manpager
set -gx MANPAGER 'nvim +Man!'
set -gx PAGER 'bat'

# env
set -gx EDITOR "nvim"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$XDG_CONFIG_HOME/.local/share"
set -gx XDG_CACHE_HOME "$XDG_CONFIG_HOME/cache"
set -gx PATH "$PATH:/usr/local/go/bin:$HOME/.local/bin:$HOME/.config/local/share/nvim/mason/bin"


# cmake stuff
set -gx CMAKE_BUILD_TYPE 'Debug'
set -gx CMAKE_C_COMPILER 'gcc'
set -gx CMAKE_CXX_COMPILER 'g++'
set -gx CMAKE_GENERATOR 'Ninja'
set -gx CMAKE_EXPORT_COMPILE_COMMANDS 'ON'
set -gx CMAKE_LINKER_TYPE 'mold'
set -gx CMAKE_C_COMPILER_LAUNCHER 'ccache'
set -gx CMAKE_CXX_COMPILER_LAUNCHER 'ccache'

set -gx CC 'gcc'
set -gx CXX 'g++'

# cargo stuff
set -gx RUSTC_WRAPPER 'sccache'
set -gx CARGO_TARGET_x86_LINUX_GNU_LINKER 'mold'
set -gx RUSTFLAGS '-C link-args=-fuse-ld=mold'

# fcitx stuff
set -gx XMODIFIERS "@im=fcitx"
set -gx QT_IM_MODULE "fcitx"
set -gx SDL_IM_MODULE "fcitx"
set -gx GLFW_IM_MODULE "ibus"

# fzf looks
set -gx FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    source "$XDG_CONFIG_HOME/fish/fzf.fish"
    fish_vi_key_bindings insert
    fastfetch
end
