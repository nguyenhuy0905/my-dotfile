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

require("lazy").setup({
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
    {
        import = "entry.alwayson",
        cond = true,
    },
})
require("core.mappings")
require("core.options")
require("core.cmd")
