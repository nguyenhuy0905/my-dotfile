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
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
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
    enabled = false,
  },
  {
    'saghen/blink.cmp',
    version = "1.*",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "xzbdmw/colorful-menu.nvim",
    },
    config = function()
      require("plugins.blink")
    end
  },
  {
    "xzbdmw/colorful-menu.nvim",
    config = function()
      require("plugins.color-menu")
    end
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
    enabled = true,
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
    enabled = false,
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
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    -- set up in lspconfig
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        filetypes_denylist = {
          "NvimTree",
        },
      })
    end,
  },
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
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugins.notify")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.noice")
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("plugins.bufferline")
    end
  }
}
