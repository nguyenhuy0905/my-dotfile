vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.lsp.set_log_level("off")
vim.opt.shell = "fish"
vim.o.history = 250

vim.opt.completeopt = { "menuone", "popup", "fuzzy", "preview", "noselect" }

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(
                true,
                client.id,
                ev.buf,
                { autotrigger = true }
            )
        end
    end,
})
