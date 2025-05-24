return {
    "mfussenegger/nvim-lint",
    event = "InsertEnter",
    config = function()
        require("lint").linters_by_ft = {}
    end,
}
