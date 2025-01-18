BUFOPEN = { "BufReadPre", "BufNewFile" }

return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = BUFOPEN,
        config = function()
            require("plugins.treesitter")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = BUFOPEN,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "neovim/nvim-lspconfig",
        event = BUFOPEN,
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("plugins.lspconfig")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("plugins.mason-lspconfig")
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("plugins.toggleterm")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        event = BUFOPEN,
        config = function()
            require("plugins.nvim-cmp")
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
                { plugins = { "nvim-dap-ui" }, types = true },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.lualine")
        end,
    },
    {
        "mfussenegger/nvim-dap",
        cmd = { "DapContinue", "DapToggleBreakpoint" },
        dependencies = { "rcarriga/nvim-dap-ui" },
        config = function()
            require("plugins.nvim-dap")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        cmd = { "DapContinue", "DapToggleBreakpoint" },
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require("plugins.nvim-dapui")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.gitsigns")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        event = BUFOPEN,
        config = function()
            require("plugins.luasnip")
        end,
    },
    {
        "nvimdev/lspsaga.nvim",
        event = BUFOPEN,
        config = function()
            require("plugins.lspsaga")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons",     -- optional
        },
    },
    {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        config = function()
            require("plugins.trouble")
        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "wakatime/vim-wakatime",
        lazy = false,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins.autopairs")
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("plugins.nvim-surround")
        end,
    },
    {
        "nvim-neotest/neotest",
        lazy = true,
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- adapters
            "alfaix/neotest-gtest",
        },
        config = function()
            require("plugins.neotest")
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        ft = { "cmake" },
        config = function()
            require("plugins.null-ls")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
        },
        -- set up in lspconfig
    },
    -- problematic plugin.
    -- {
    --     "RRethy/vim-illuminate",
    --     config = function()
    --         require("illuminate").configure({
    --             filetypes_denylist = {
    --                 "NvimTree",
    --             },
    --         })
    --     end,
    -- },
    {
        "luukvbaal/statuscol.nvim",
        config = function()
            require("plugins.statuscol")
        end,
    },
    {
        "stevearc/conform.nvim",
        event = BUFOPEN,
        config = function()
            require("plugins.conform")
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = BUFOPEN,
        config = function()
            require("plugins.nvim-lint")
        end,
    },
    {
        "jackguo380/vim-lsp-cxx-highlight",
        enabled = false,
        event = VeryLazy,
        ft = { "c", "cpp", "objc", "objcpp", "cuda" },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = false,
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        -- setup alongside telescope
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function()
            require("plugins.harpoon")
        end
    },
    {
        "folke/zen-mode.nvim",
        event = BUFOPEN,
        config = function()
            require("plugins.zen-mode")
        end
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })
        end,
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },
}
