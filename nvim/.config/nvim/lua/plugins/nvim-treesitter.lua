return {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        local ret = {
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
            -- textobjects
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["at"] = "@call.outer",
                        ["it"] = "@call.inner",
                        ["ac"] = "@comment.outer",
                        ["ic"] = "@comment.inner",
                        ["is"] = "@class.inner",
                        ["as"] = "@class.outer",
                        ["az"] = {
                            query = "@fold",
                            query_group = "folds",
                        },
                        ["ip"] = "@parameter.inner",
                        ["ap"] = "@parameter.outer",
                    },
                },
                move = {
                    enable = true,
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]s"] = "@class.outer",
                        ["]t"] = "@call.outer",
                        ["]z"] = {
                            query = "@fold",
                            query_group = "folds",
                            desc = "Goto next fold @fold",
                        },
                        ["]c"] = "@comment.outer",
                        ["]p"] = "@parameter.inner",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]S"] = "@class.outer",
                        ["]Z"] = {
                            query = "@fold",
                            query_group = "folds",
                            desc = "Goto previous fold @fold",
                        },
                        ["]P"] = "@parameter.inner",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[s"] = "@class.outer",
                        ["[z"] = {
                            query = "@fold",
                            query_group = "folds",
                        },
                        ["[p"] = "@parameter.inner",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[S"] = "@class.outer",
                        ["[Z"] = {
                            query = "@fold",
                            query_group = "folds",
                        },
                        ["[P"] = "@parameter.inner",
                    },
                },
            },
        }
        -- more keymaps
        local ts_repeat = require("nvim-treesitter.textobjects.repeatable_move")
        vim.keymap.set(
            { "n", "x", "o" },
            ";",
            ts_repeat.repeat_last_move_next,
            { desc = "Repeat last TS query, next" }
        )
        vim.keymap.set(
            { "n", "x", "o" },
            ",",
            ts_repeat.repeat_last_move_previous,
            { desc = "Repeat last TS query, previous" }
        )
        require("nvim-treesitter.configs").setup(ret)
    end,
}
