return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release"
                .. " -DCMAKE_POLICY_VERSION_MINIMUM=3.5"
                .. " && cmake --build build --config Release",
        },
    },
    config = function()
        local ts = require("telescope")
        local builtin = require("telescope.builtin")
        ts.setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--follow",
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })
        ts.load_extension("fzf")
        -- keymaps
        vim.keymap.set(
            { "n" },
            "<Leader>ff",
            builtin.find_files,
            { desc = "Telescope find files (.ignore)" }
        )
        vim.keymap.set({ "n" }, "<Leader>fa", function()
            builtin.find_files({ hidden = true, no_ignore = true })
        end, { desc = "Telescope find all files" })
        vim.keymap.set(
            { "n" },
            "<Leader>gf",
            builtin.git_files,
            { desc = "Telescope git files" }
        )
        vim.keymap.set({ "n" }, "<Leader>fc", function()
            builtin.find_files({ cwd = require("telescope.utils").buffer_dir() })
        end, { desc = "Telescope find files in buffer cwd" })
        vim.keymap.set(
            { "n" },
            "<Leader>gl",
            builtin.live_grep,
            { desc = "Telescope live grep" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>h",
            builtin.help_tags,
            { desc = "Telescope help tags" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>jl",
            builtin.jumplist,
            { desc = "Telescope jump list" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>bf",
            builtin.buffers,
            { desc = "Telescope buffers" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>dg",
            builtin.diagnostics,
            { desc = "Telescope diagnostics" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>qf",
            builtin.quickfix,
            { desc = "Telescope quickfix list" }
        )
        vim.keymap.set(
            { "n" },
            "<Leader>gs",
            builtin.git_status,
            { desc = "Telescope git status" }
        )
    end,
}
