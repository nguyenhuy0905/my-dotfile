local M = {
    "stevearc/conform.nvim",
    event = "BufEnter",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
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
