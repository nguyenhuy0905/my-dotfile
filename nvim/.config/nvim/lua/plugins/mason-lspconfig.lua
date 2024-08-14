require("mason-lspconfig").setup({
    ensure_installed = {
        -- lua
        "lua_ls",
        -- low levels
        "rust_analyzer",
        "cmake",
        "neocmake",
        -- web friends
        "html",
        "cssls",
        "marksman",
        "lemminx",
        -- java and friends
        -- C# on Neovim is somewhat crippled though
        "omnisharp",
        -- bash
        "bashls",
        -- general purpose
        "efm",
        -- snek
        "ruff",
        "ruff_lsp",
        -- refactoring
        "ast_grep"
    },
})
