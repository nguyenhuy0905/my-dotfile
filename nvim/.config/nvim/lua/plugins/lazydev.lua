return {
    "folke/lazydev.nvim",
    version = "*",
    ft = "lua",
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
