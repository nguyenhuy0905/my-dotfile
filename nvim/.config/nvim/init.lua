require("config.lazy")
require("config.colorscheme")
require("config.netrw")
require("config.keymaps")
require("config.statusline")
-- config.options required in config.lazy already

vim.lsp.enable({
    "lua_ls",
    "clangd",
    "rust_analyzer",
})
