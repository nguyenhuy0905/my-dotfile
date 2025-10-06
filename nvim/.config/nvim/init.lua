require("config.lazy")
require("config.colorscheme")
require("config.netrw")
require("config.keymaps")
-- config.options required in config.lazy already

-- vim.lsp.enable({
--     "lua_ls",
--     "clangd",
--     "rust_analyzer",
-- })

-- LSP-related keymaps
vim.keymap.set({ "n" }, "grn", vim.lsp.buf.rename, { desc = "LSP rename" })
vim.keymap.set(
    { "n" },
    "gra",
    vim.lsp.buf.code_action,
    { desc = "LSP code action" }
)
vim.keymap.set(
    { "n" },
    "grr",
    vim.lsp.buf.references,
    { desc = "LSP list all references" }
)
vim.keymap.set(
    { "n" },
    "gri",
    vim.lsp.buf.implementation,
    { desc = "LSP list all implementations" }
)
vim.keymap.set(
    { "n" },
    "gO",
    vim.lsp.buf.document_symbol,
    { desc = "LSP list buffer symbols" }
)
vim.keymap.set(
    { "i" },
    "<C-s>",
    vim.lsp.buf.signature_help,
    { desc = "LSP signature help" }
)
vim.keymap.set(
    { "n" },
    "gd",
    vim.lsp.buf.definition,
    { desc = "LSP goto definition" }
)
vim.keymap.set(
    { "n" },
    "gD",
    vim.lsp.buf.declaration,
    { desc = "LSP goto declaration" }
)
vim.keymap.set({ "n" }, "<Leader>ex", function()
    if not pcall(function()
        vim.cmd("Rexplore")
    end) then
        vim.cmd("Explore")
    end
end, { desc = "Open netrw" })
