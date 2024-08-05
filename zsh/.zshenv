. "$HOME/.cargo/env"
export ZDOTDIR="$HOME"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export PATH=$PATH:/usr/local/go/bin:$HOME/.local/bin:$HOME/.config/local/share/nvim/mason/bin
export EDITOR=vim
export KEYTIMEOUT=10

# my CMake options
export CMAKE_GENERATOR=Ninja
export CMAKE_BUILD_TYPE=Debug
export CMAKE_CXX_COMPILER=clang++
export CMAKE_C_COMPILER=clang
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

export CC=clang
export CXX=clang++

# auto config files
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env
. "$HOME/.atuin/bin/env"
