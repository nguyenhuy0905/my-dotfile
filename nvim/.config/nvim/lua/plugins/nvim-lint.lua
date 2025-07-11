return {
    "mfussenegger/nvim-lint",
    version = "*",
    event = "BufEnter",
    config = function()
        require("lint").linters_by_ft = {
            bash = { "shellcheck" },
            c = { "clang-tidy" },
            cpp = { "clang-tidy" },
            rust = { "clippy" },
        }
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                -- try_lint without arguments runs the linters defined in `linters_by_ft`
                -- for the current filetype
                require("lint").try_lint()
            end,
        })
    end,
}
