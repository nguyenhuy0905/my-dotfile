return {
    'echasnovski/mini.nvim',
    version = false,
    config = function ()
        local gen_loader = require('mini.snippets').gen_loader
        local miniclue = require('mini.clue')
        local gen_clues = miniclue.gen_clues
        -- local function get_all_snips(path)
        --     local ret = {}
        --     -- so, if there's only lua.json, we return that.
        --     if vim.fn.filereadable(path..'.json') then
        --         table.insert(ret, path..'.json')
        --         return ret
        --     end
        --     -- or, if lua is a directory with more snippet json files,
        --     local all_child_paths = vim.split(vim.fn.glob(path..'/*'), '\n', {trimempty = true})
        --     for _, child_path in ipairs(all_child_paths) do
        --         if string.find(child_path, ".json") ~= nil then
        --             table.insert(ret, child_path)
        --         else
        --             for _, childchild_path in ipairs(get_all_snips(child_path)) do
        --                 table.insert(ret, childchild_path)
        --             end
        --         end
        --     end
        --     return ret
        -- end
        -- TODO: if you don't use friendly-snippets, change the dir
        local friendly_snip_dir = vim.env.XDG_DATA_HOME.."/nvim/lazy/friendly-snippets/"
        -- text editing
        require('mini.ai').setup({})
        require('mini.basics').setup({
            options = {
                basics = true,
                extra_ui = true,
            }
        })
        require('mini.comment').setup({})
        require('mini.completion').setup({})
        require('mini.extra').setup({})
        require('mini.operators').setup({})
        require('mini.surround').setup({})
        require('mini.pairs').setup({})
        require('mini.snippets').setup({
            snippets = {
                gen_loader.from_lang(),
            },
        })
        -- general workflow
        require('mini.bracketed').setup({})
        require('mini.clue').setup({
            triggers = {
            -- leader
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },
            -- windows
                { mode = 'n', keys = '<C-w>' },
                -- registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                -- marks
                { mode = 'n', keys = "'" },
                { mode = 'x', keys = "'" },
                -- g - comment-related stuff
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },
                -- z
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
                -- s - surround
                { mode = 'n', keys = 's' },
                -- [ and ] - moving with brackets
                { mode = 'n', keys = '[' },
                { mode = 'n', keys = ']' },
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
        require('mini.pick').setup({})
        require('mini.git').setup({})
        require('mini.jump2d').setup({})
        -- appearances
        require('mini.hipatterns').setup({
            highlighters = {
                   -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme = {
                    pattern = '%f[%w]()FIXME()%f[%W]',
                    group = 'MiniHipatternsFixme'
                },
                hack  = {
                    pattern = '%f[%w]()HACK()%f[%W]',
                    group = 'MiniHipatternsHack'
                },
                todo  = {
                    pattern = '%f[%w]()TODO()%f[%W]',
                    group = 'MiniHipatternsTodo'
                },
                note  = {
                    pattern = '%f[%w]()NOTE()%f[%W]',
                    group = 'MiniHipatternsNote'
                },
            },
            hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        })
        require('mini.icons').setup({})
        require('mini.statusline').setup({})
    end,
}
