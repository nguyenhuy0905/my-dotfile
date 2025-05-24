require("config.lazy")
require("config.colorscheme")
-- config.options required in config.lazy already

-- start LSPs
local enabled_lsp = {
    'luals',
}

for _, server in pairs(enabled_lsp) do
    vim.lsp.enable(server)
end
