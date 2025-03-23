-- setup as needed by lazy
vim.g.mapleader = " "
-- download lazy.nvim if needed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.cmd [[

let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c " Disable the input method when exiting insert mode and save the state
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif " 2 means that the input method was opened in the previous state, and the input method is started when entering the insert mode

]]

require("lazy").setup({
  {
    import = "colorscheme.init",
    cond = true,
  },
  {
    import = "entry.alwayson",
    cond = function()
      return true
    end,
  },
  {
    import = "entry.novscode",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    import = "entry.vscode",
    cond = function()
      return vim.g.vscode
    end,
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
})

require("core.options")
require("core.mappings")
require("core.cmd")
