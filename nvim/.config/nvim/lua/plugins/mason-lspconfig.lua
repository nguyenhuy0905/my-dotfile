require("mason-lspconfig").setup({
  ensure_installed = {
    -- lua
    "lua_ls",
    -- low levels
    "rust_analyzer",
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
    -- bighead
    "texlab"
  },
})
