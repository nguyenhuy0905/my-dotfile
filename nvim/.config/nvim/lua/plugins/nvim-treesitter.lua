return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "cmake",
            "cpp",
            "dockerfile",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "hyprlang",
            "json",
            "lua",
            "make",
            "markdown",
            "nu",
            "rust",
        },
        sync_install = true,
        auto_install = true,
        highlight = {
            enable = true,
            -- true to disable
            disable = function(_, buf)
                local max_filesize = 100 * 1024 -- 100KB
                local ok, stats =
                    pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
                return false
            end,
        },
    },
}
