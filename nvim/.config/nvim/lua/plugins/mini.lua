return {
    "echasnovski/mini.nvim",
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
        require("mini.extra").setup({})
        require("mini.operators").setup({})
        require("mini.surround").setup({})
        require("mini.pairs").setup({})
        -- general workflow
        require("mini.bracketed").setup({
            file = { suffix = "" },
        })
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
        require("mini.statusline").setup({
            content = {
                active = function()
                    --- @return string
                    local function get_git_status()
                        local stat =
                            vim.b[vim.api.nvim_get_current_buf()].minigit_summary
                        -- if stat.repo is nil, this is not a git repo
                        if not stat or not stat.repo or not stat.head_name then
                            return ""
                        end

                        local ret = "%#Keyword#󰘬 " .. stat.head_name
                        return ret
                    end
                    --- @return string
                    local function get_git_diff()
                        local diff =
                            vim.b[vim.api.nvim_get_current_buf()].minidiff_summary
                        if not diff then
                            return ""
                        end
                        local ret = ""
                        if diff.add and diff.add > 0 then
                            ret = ret
                                .. "%#DiagnosticVirtualLinesOk# "
                                .. diff.add
                        end
                        if diff.delete and diff.delete > 0 then
                            ret = ret
                                .. " %#DiagnosticVirtualLinesError# "
                                .. diff.delete
                        end
                        if diff.change and diff.change > 0 then
                            ret = ret
                                .. " %#DiagnosticVirtualLinesWarn# "
                                .. diff.change
                        end
                        return ret
                    end
                    --- @return string
                    local function get_filename()
                        if vim.bo.buftype == "terminal" then
                            return "%t"
                        end
                        return "%t%m%r"
                    end
                    --- @return string
                    local function get_file_info()
                        local ftype = vim.bo.filetype
                        local icon, hl, is_default =
                            MiniIcons.get("filetype", ftype)
                        if is_default then
                            icon = ""
                        end
                        return (
                            "%#"
                            .. hl
                            .. "#"
                            .. icon
                            .. "%#MiniStatuslineFilename#"
                        )
                            .. " "
                            .. ftype
                    end
                    --- @return string
                    local function get_diagnostics()
                        local diag_list = vim.diagnostic.count(0)
                        local ret = ""

                        local count = diag_list[vim.diagnostic.severity.ERROR]
                        if count then
                            ret = ret
                                .. "%#DiagnosticVirtualLinesError# "
                                .. count
                        end
                        count = diag_list[vim.diagnostic.severity.WARN]
                        if count then
                            ret = ret
                                .. "%#DiagnosticVirtualLinesWarn#  "
                                .. count
                        end
                        count = diag_list[vim.diagnostic.severity.HINT]
                        if count then
                            ret = ret
                                .. "%#DiagnosticVirtualLinesHint#  "
                                .. count
                        end
                        count = diag_list[vim.diagnostic.severity.INFO]
                        if count then
                            ret = ret
                                .. "%#DiagnosticVirtualLinesWarn#  "
                                .. count
                        end
                        return ret
                    end
                    local mode, mode_hl =
                        MiniStatusline.section_mode({ trunc_width = 50 })
                    -- HACK: maybe I should use the table-like approach like mini does.
                    -- This is literally setting the highlight group again and again.
                    vim.api.nvim_set_hl(0, "StatuslineSeparator", {
                        fg = vim.fn.synIDattr(vim.fn.hlID(mode_hl), "bg"),
                        bg = vim.fn.synIDattr(
                            vim.fn.hlID("MiniStatuslineFilename"),
                            "bg"
                        ),
                    })
                    local search = "%#StatuslineSeparator#%#"
                        .. mode_hl
                        .. "#  %l:%c"
                    return MiniStatusline.combine_groups({
                        {
                            hl = mode_hl,
                            strings = { mode, "%#StatuslineSeparator#" },
                        },
                        {
                            hl = "MiniStatuslineFilename",
                            strings = {
                                get_git_status(),
                                get_git_diff(),
                            },
                        },
                        "%<",
                        {
                            hl = "MiniStatuslineFilename",
                            strings = { get_filename() },
                        },
                        "%=",
                        {
                            hl = "MiniStatuslineFilename",
                            strings = {
                                get_diagnostics(),
                            },
                        },
                        {
                            hl = "MiniStatuslineFilename",
                            strings = {
                                get_file_info(),
                            },
                        },
                        {
                            hl = "MiniStatuslineFilename",
                            strings = {
                                search,
                            },
                        },
                    })
                end,
            },
        })
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
