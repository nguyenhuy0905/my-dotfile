require("dashboard").setup({
  config = {
    shortcut = {
      { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
    },
    footer = {
      "✨ Another day on Neovim ✨",
    },
  },
})
