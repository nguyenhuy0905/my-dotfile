local zenmode = require("zen-mode")
zenmode.setup({
  opts = {
    plugins = {
      options = {
        showcmd = true,
      },
      gitsigns = { enabled = true },
      tmux = { enabled = true },
    },
  },
})
