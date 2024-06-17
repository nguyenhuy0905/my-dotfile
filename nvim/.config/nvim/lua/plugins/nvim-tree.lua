require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = false,
        },
        change_dir = {
            global = true,
        },
    },
    filters = {
        enable = true,
        git_ignored = false,
    },
})
