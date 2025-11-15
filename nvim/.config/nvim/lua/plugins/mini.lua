return {
    "nvim-mini/mini.nvim",
    -- url = "https://github.com/nguyenhuy0905/mini.nvim",
    -- dir = vim.fn.getenv("HOME") .. "/code/build-from-src/mini.nvim",
    dependencies = {
        -- mini.snippets and mini.completions
        "rafamadriz/friendly-snippets",
    },
    version = "*",
    config = function()
        local miniclue = require("mini.clue")
        local gen_clues = miniclue.gen_clues
        -- text editing
        require("mini.align").setup({})
        require("mini.basics").setup({
            options = {
                basics = false,
                extra_ui = true,
            },
            mappings = {
                basics = false,
            },
        })
        require("mini.comment").setup({})
        -- there's builtin autocomplete already.
        -- require("mini.completion").setup({})
        require("mini.extra").setup({})
        require("mini.surround").setup({})
        -- :h matchpairs
        -- require("mini.pairs").setup({})
        require("mini.snippets").setup({
            snippets = {
                -- global

                require("mini.snippets").gen_loader.from_file(
                    vim.fn.stdpath("data")
                        .. "/lazy/friendly-snippets/snippets/global.json"
                ),
                require("mini.snippets").gen_loader.from_file(
                    vim.fn.stdpath("data")
                        .. "/lazy/friendly-snippets/snippets/license.json"
                ),
                require("mini.snippets").gen_loader.from_file(
                    vim.fn.stdpath("data")
                        .. "/lazy/friendly-snippets/snippets/loremipsum.json"
                ),

                -- some languages have completions for the language itself and its docs.
                function(context)
                    local path = vim.fn.stdpath("data")
                        .. "/lazy/friendly-snippets/snippets"
                    local comp_file = vim.fn.glob(
                        "`find "
                            .. path
                            .. " -type f -name '"
                            .. context.lang
                            .. ".json'`"
                    )
                    return MiniSnippets.gen_loader.from_file(comp_file)
                end,
                function(context)
                    local path = vim.fn.stdpath("data")
                        .. "/lazy/friendly-snippets/snippets"
                    local comp_file = vim.fn.glob(
                        "`find "
                            .. path
                            .. " -type f -name '"
                            .. context.lang
                            .. "doc.json'`"
                    )
                    return MiniSnippets.gen_loader.from_file(comp_file)
                end,
            },
        })
        -- general workflow
        require("mini.clue").setup({
            triggers = {
                -- auto completion
                { mode = "i", keys = "<C-x>" },
                -- leader
                { mode = "n", keys = "<Leader>" },
                { mode = "x", keys = "<Leader>" },
                -- windows
                { mode = "n", keys = "<C-w>" },
                -- registers
                { mode = "n", keys = '"' },
                { mode = "x", keys = '"' },
                -- marks
                { mode = "n", keys = "'" },
                { mode = "x", keys = "'" },
                -- g - comment-related stuff
                { mode = "n", keys = "g" },
                { mode = "x", keys = "g" },
                -- z
                { mode = "n", keys = "z" },
                { mode = "x", keys = "z" },
                -- v
                { mode = "n", keys = "v" },
                { mode = "x", keys = "v" },
                -- s - surround
                { mode = "n", keys = "s" },
                -- [ and ] - moving with brackets
                { mode = "n", keys = "[" },
                { mode = "n", keys = "]" },
            },
            clues = {
                gen_clues.builtin_completion(),
                gen_clues.windows(),
                gen_clues.registers(),
                gen_clues.marks(),
                gen_clues.g(),
                gen_clues.z(),
            },
            window = {
                config = {
                    width = 50,
                },
                delay = 10,
            },
        })
        require("mini.diff").setup({})
        require("mini.files").setup({
            options = {
                use_as_default_explorer = false,
            },
            windows = {
                preview = true,
            },
        })
        require("mini.git").setup({})
        require("mini.jump").setup({
            mappings = {
                repeat_jump = ";",
            },
        })
        require("mini.jump2d").setup({})
        -- appearances
        -- neovide has all these eye candies built-in
        if not vim.g.neovide then
            require("mini.animate").setup({
                -- newer versions of kitty terminal supports cursor animation
                -- already
                cursor = {
                    enable = false,
                },
                scroll = {
                    timing = require("mini.animate").gen_timing.exponential({
                        easing = "out",
                        duration = 5,
                    }),
                },
                resize = {
                    timing = require("mini.animate").gen_timing.exponential({
                        easing = "out",
                        duration = 5,
                    }),
                },
                open = {
                    timing = require("mini.animate").gen_timing.exponential({
                        easing = "out",
                        duration = 5,
                    }),
                },
                close = {
                    timing = require("mini.animate").gen_timing.exponential({
                        easing = "out",
                        duration = 5,
                    }),
                },
            })
        end
        require("mini.hipatterns").setup({
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = {
                    pattern = "%f[%w]()FIXME()%f[%W]",
                    group = "MiniHipatternsFixme",
                },
                hack = {
                    pattern = "%f[%w]()HACK()%f[%W]",
                    group = "MiniHipatternsHack",
                },
                todo = {
                    pattern = "%f[%w]()TODO()%f[%W]",
                    group = "MiniHipatternsTodo",
                },
                note = {
                    pattern = "%f[%w]()NOTE()%f[%W]",
                    group = "MiniHipatternsNote",
                },
            },
            hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        })
        require("mini.icons").setup({})
        require("mini.indentscope").setup({
            draw = {
                delay = 10,
                animation = require("mini.indentscope").gen_animation.none(),
            },
            options = {
                try_as_border = true,
            },
        })
        require("mini.misc").setup({})
        require("mini.notify").setup({})
        require("mini.pick").setup({})
        -- keymaps
        vim.keymap.set(
            { "n" },
            "<Leader>ff",
            MiniPick.builtin.files,
            { desc = "Mini pick files" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>gf",
            MiniExtra.pickers.git_files,
            { desc = "Mini pick git files" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>h",
            MiniPick.builtin.help,
            { desc = "Mini pick help" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>dg",
            MiniExtra.pickers.diagnostic,
            { desc = "Mini pick diagnostic" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>gl",
            MiniPick.builtin.grep_live,
            { desc = "Mini pick grep live" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>bf",
            MiniPick.builtin.buffers,
            { desc = "Mini pick buffers" }
        )
        vim.keymap.set({ "n" }, "<Leader>fe", function()
            MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        end, { desc = "Mini file explorer" })
    end,
}
