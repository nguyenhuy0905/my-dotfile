return {  -- colorschemes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1001,
    config = function()
      require("colorscheme.catppuccin")
      vim.cmd.colorscheme("catppuccin")
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
}
