local conform = require("conform")
local masonpath = vim.fn.expand "~" .. "/.local/share/nvim/mason/"

conform.setup({
    formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
    }
})

conform.formatters.stylua = {
    command = masonpath .. "stylua",
}
