local M = {
    "stevearc/conform.nvim",
    event = "BufEnter",
    opts = {
        formatters_by_ft = {
            c = { "clang-format" },
            cpp = { "clang-format" },
            lua = { "stylua" },
            rust = { "rustfmt" },
        },
    },
    format_on_save = {},
}

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

return M
