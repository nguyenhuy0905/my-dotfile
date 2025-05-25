return {
    "mfussenegger/nvim-lint",
    event = "BufEnter",
    config = function()
        require("lint").linters_by_ft = {
            bash = { "shellcheck" },
            c = { "clang-tidy" },
            cpp = { "clang-tidy" },
            rust = { "clippy" },
        }
    end,
}
