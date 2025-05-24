return {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "dockerfile",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "json",
            "lua",
            "make",
            "markdown",
            "rust"
        },
        sync_install = true,
    }
}
