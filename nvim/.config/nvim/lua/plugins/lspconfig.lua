MASONPATH = vim.fn.stdpath("data") .. "/mason/bin/"

local lspconfig = require("lspconfig")

-- copied from NvChad :)

local on_attach = function(client, bufnr)
    client.bufnr = bufnr
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, {
    offsetEncoding = { "utf-16" },
    general = {
        positionEncodings = { "utf-16" },
    },
})
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

-- the actual setup
-- a table of 2 strings, the first is the config name, the second is the binary name in masonpath
local default_list = {
    "lua_ls",
    "cmake",
    "bashls",
    "marksman",
    "html",
    "clangd",
}

-- init default list

for _, server in ipairs(default_list) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        -- offsetEncoding = "utf-16",
    })
end

-- lspconfig["ccls"].setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     init_options = {
--         highlight = {
--             lsRanges = true,
--         }
--     },
-- })

require("ufo").setup({})
