local conform = require("conform")
local masonpath = vim.fn.expand("~") .. "/.local/share/nvim/mason/"

conform.setup({
  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
    cmake = { "cmake_format" },
    lua = { "stylua" },
    haskell = { "ormolu" },
    python = { "ruff_fix", "ruff_format" },
    plaintex = { "chktex" },
  },
})

conform.formatters.stylua = {
  command = masonpath .. "stylua",
}
