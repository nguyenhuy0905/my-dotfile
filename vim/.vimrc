call plug#begin()

" List your plugins here
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'

call plug#end()
set t_Co=256
set guifont="FiraCode Nerd Font\ 16"
colorscheme catppuccin_mocha
