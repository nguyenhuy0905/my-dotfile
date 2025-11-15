return {
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    config = function ()
        vim.lsp.config('clangd', {
            cmd = {
                'clangd',
                '--clang-tidy',
                '-j=8',
                '--malloc-trim',
                '--background-index',
                '--pch-storage=memory',
            }
        })
    end,
    version = "*",
}
