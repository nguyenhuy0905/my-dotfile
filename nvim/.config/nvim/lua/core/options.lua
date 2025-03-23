local CMD = vim.cmd
vim.lsp.set_log_level("off")
-- i like 2-tabs
vim.o.expandtab = true
CMD("tnoremap <C-n> <C-\\><C-n>")
vim.o.tabstop = 4
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.number = true
vim.o.relativenumber = true
-- color
vim.o.termguicolors = true
vim.o.shell = "nu"
-- colorscheme is set in bufferline plugin.
-- it seems that's the only way that plugin is obedient.
-- vim.cmd.colorscheme("catppuccin-mocha")
-- treesitter
CMD("set foldmethod=expr")
CMD("set foldexpr=nvim_treesitter#foldexpr()")
CMD("set nofoldenable")

-- folding
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- lsp
vim.diagnostic.config({
  -- the nvim GUI Neovide doesn't seem to render virtual lines.
  virtual_lines = true,
  virtual_text = false,
})

-- font
vim.o.guifont = "FiraCode Nerd Font,JetBrainsMono Nerd Font:h16"
-- I like it blurry
vim.o.winblend = 10
vim.o.pumblend = 10

if vim.g.neovide then
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.0
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.1
  vim.g.neovide_cursor_vfx_mode = "torpedo"
  -- one blink lasts 0.75s with 0.45s off and 0.3s on.
  local all_cfg = "a:blinkwait750-blinkoff450-blinkon300-Cursor/lCursor";
  -- normal, visual, command-line insert: block.
  -- insert, command-line insert, visual with "selection": thin bar.
  -- replace, command-line replace, thin flat plate.
  -- operator-pending: half-sized block.
  local cursor_shape_cfg = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50";
  vim.o.guicursor = all_cfg .. ',' .. cursor_shape_cfg;
end

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
