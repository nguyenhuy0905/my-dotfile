local null_ls = require("null-ls")

local format = null_ls.builtins.formatting
local diags = null_ls.builtins.diagnostics
local ca = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        -- CODE ACTIONS
        ca.gitsigns,
        -- FORMATTERS
        format.stylua,
        format.markdownlint,
        -- LINTERS
        -- universal
        diags.codespell,
        -- markdown
        diags.vale,
        diags.markdownlint,
        -- cmake
        diags.cmake_lint.with({
            command = "cmakelint",
            args = { "$FILENAME" },
        }),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})