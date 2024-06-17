local CMD = vim.cmd
-- i like 4-tabs
CMD("set expandtab")
CMD("tnoremap <C-n> <C-\\><C-n>")
CMD("set tabstop=4")
CMD("set softtabstop=4")
CMD("set shiftwidth=4")
CMD("set number")
CMD("set relativenumber")
-- color
CMD("set termguicolors")
CMD.colorscheme("tokyonight-storm")
-- treesitter
CMD("set foldmethod=expr")
CMD("set foldexpr=nvim_treesitter#foldexpr()")
CMD("set nofoldenable")
