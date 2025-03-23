require("bufferline").setup({
  options = {
    mode = "buffers",
    numbers = "ordinal",
    themable = true,
    indicator = {
      style = "icon",
    },
    diagnostics = "nvim_lsp",
    separator_style = "slant"
  }
})
