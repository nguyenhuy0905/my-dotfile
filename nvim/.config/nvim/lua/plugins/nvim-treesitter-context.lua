return {
    "nvim-treesitter/nvim-treesitter-context",
    version = "*",
    lazy = true,
    opts = {
        enable = true,
        multiwindow = true,
        max_lines = 2,
        line_numbers = true,
        trim_scope = "outer",
        mode = "cursor",
    },
}
