return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        local miniclue = require("mini.clue")
        local gen_clues = miniclue.gen_clues
        -- text editing
        require("mini.ai").setup({})
        require("mini.basics").setup({
            options = {
                basics = false,
                extra_ui = true,
            },
        })
        require("mini.comment").setup({})
        require("mini.extra").setup({})
        require("mini.operators").setup({})
        require("mini.surround").setup({})
        require("mini.pairs").setup({})
        -- general workflow
        require("mini.bracketed").setup({})
        require("mini.clue").setup({
            triggers = {
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
        require("mini.pick").setup({})
        require("mini.git").setup({})
        require("mini.jump").setup({})
        require("mini.jump2d").setup({})
        -- appearances
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
        require("mini.notify").setup({})
        require("mini.statusline").setup({})

        MiniIcons.tweak_lsp_kind()

        -- some nice keymaps

        -- pickers
        vim.keymap.set(
            { "n" },
            "<Leader>ff",
            MiniPick.builtin.files,
            { desc = "MiniPick files" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>gf",
            MiniExtra.pickers.git_files,
            { desc = "MiniPick git files" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>h",
            MiniPick.builtin.help,
            { desc = "MiniPick help" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>gl",
            MiniPick.builtin.grep_live,
            { desc = "MiniPick live grep" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>gr",
            MiniPick.builtin.grep,
            { desc = "MiniPick grep" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>bf",
            MiniPick.builtin.buffers,
            { desc = "MiniPick live grep" }
        )
    end,
}
