local function reload_workspace(bufnr)
    local clients =
        vim.lsp.get_clients({ bufnr = bufnr, name = "rust_analyzer" })
    for _, client in ipairs(clients) do
        vim.notify("Reloading Cargo Workspace")
        client:request("rust-analyzer/reloadWorkspace", nil, function(err)
            if err then
                error(tostring(err))
            end
            vim.notify("Cargo workspace reloaded")
        end, 0)
    end
end

vim.lsp.config["rust-analyzer"] = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "Cargo.lock" },
    before_init = function(init_params, _)
        init_params.initializationOptions = {
            diagnostics = {
                completion = {
                    fullFunctionSignature = true,
                    limit = 50,
                },
            },
        }
    end,
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    on_attach = function()
        vim.api.nvim_buf_create_user_command(0, "LspCargoReload", function()
            reload_workspace(0)
        end, { desc = "Reload current cargo workspace" })
    end,
}
