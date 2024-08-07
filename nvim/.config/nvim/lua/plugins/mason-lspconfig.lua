require("mason-lspconfig").setup({
    ensure_installed = {
        -- lua
        "lua_ls",
        -- low levels
        "rust_analyzer",
        "cmake",
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
    },
})
