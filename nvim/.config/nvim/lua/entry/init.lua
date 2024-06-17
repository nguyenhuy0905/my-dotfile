require("lazy").setup({
    {
        import = "entry.alwayson", cond = true
    },
    {
        import = "entry.novscode", cond = (function() return not vim.g.vscode end)
    },
    {
        import = "entry.vscode", cond = (function() return vim.g.vscode end)
    },
})
