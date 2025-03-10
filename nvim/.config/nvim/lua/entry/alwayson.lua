return {
  -- colorschemes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("colorscheme.catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("colorscheme.tokyonight")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("colorscheme.kanagawa")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.telescope")
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("plugins.which-key")
    end,
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.mason")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = BUFOPEN,
    main = "ibl",
    config = function()
      require("plugins.ibl")
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = BUFOPEN,
    config = function()
      require("plugins.comment")
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("plugins.leap")
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = BUFOPEN,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.todo-comments")
    end,
  },
  {
    "danymat/neogen",
    config = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("plugins.neoscroll")
    end,
  },
}
