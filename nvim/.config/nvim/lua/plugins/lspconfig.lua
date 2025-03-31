MASONPATH = vim.fn.stdpath("data") .. "/mason/bin/"

local lspconfig = require("lspconfig")

-- copied from NvChad :)

local on_attach = function(client, bufnr)
  client.bufnr = bufnr
end

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}


-- the actual setup
-- a table of 2 strings, the first is the config name, the second is the binary name in masonpath
local default_list = {
  "lua_ls",
  -- "cmake",
  "neocmake",
  "bashls",
  "marksman",
  "html",
  "ruff",
  "ast_grep",
  "hyprls",
  "texlab",
  "racket_langserver",
  "nushell"
}

-- init default list

for _, server in ipairs(default_list) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- offsetEncoding = "utf-16",
  })
end

require('lspconfig')['hls'].setup {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

lspconfig["clangd"].setup {
  cmd = {
    "clangd",
    "-j=8",
    "--malloc-trim",
    "--background-index",
    "--pch-storage=memory",
    "--experimental-modules-support",
    "--clang-tidy"
  }
}

-- lspconfig["ccls"].setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     init_options = {
--         highlight = {
--             lsRanges = true,
--         }
--     },
-- })

vim.g.rustaceanvim = {
  server = {
    capabilities = capabilities,
    -- on_attach = function (client, bufnr)
    --     vim.keymap.set("n", "<leader>ca", function ()
    --         vim.cmd.RustLsp("codeAction")
    --         print("Rust code action triggered.")
    --     end,
    --     { silent = true, buffer = bufnr })
    -- end,
    on_attach = on_attach,
    default_settings = {
      ["rust-analyzer"] = {
        diagnostic = {
          enable = true,
        },
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        }
      }
    }
  }
}

require("ufo").setup({})
