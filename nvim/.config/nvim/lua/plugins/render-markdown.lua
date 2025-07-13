return {
    "MeanderingProgrammer/render-markdown.nvim",
    version = "*",
    ft = { "markdown" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.nvim",
    },
    opts = {
        completions = {
            blink = {
                enabled = true,
            },
        },
    },
}
