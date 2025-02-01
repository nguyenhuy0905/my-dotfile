. "$HOME/.cargo/env"
export ZDOTDIR="$HOME"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export PATH=$PATH:/usr/local/go/bin:$HOME/.local/bin:$HOME/.config/local/share/nvim/mason/bin
export EDITOR=nvim
export KEYTIMEOUT=10
export MANPAGER=nvimpager

# my CMake options
export CMAKE_GENERATOR=Ninja
export CMAKE_BUILD_TYPE=Debug
export CMAKE_CXX_COMPILER=g++
export CMAKE_C_COMPILER=gcc
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

export CC=gcc
export CXX=g++

export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx   
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

# being conservative.
export HISTSIZE=250
export SAVEHIST=250

# auto config files
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env
. "$HOME/.atuin/bin/env"
