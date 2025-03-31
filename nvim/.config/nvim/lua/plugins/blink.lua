local blink = require("blink.cmp")
blink.setup({
  keymap = {
    preset = "default",
    -- default mapping:
    -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    -- ['<C-e>'] = { 'hide' },
    -- ['<C-y>'] = { 'select_and_accept' },
    --
    -- ['<Up>'] = { 'select_prev', 'fallback' },
    -- ['<Down>'] = { 'select_next', 'fallback' },
    -- ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    -- ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
    --
    -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    -- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    --
    -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
    -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    --
    -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
  },
  completion = {
    menu = {
      draw = {
        columns = { { "kind_icon" }, { "label", gap = 1 } },
        components = {
          label = {
            text = function (ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function (ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end
          }
        }
      }
    }
  },
  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
  snippets = {
    preset = "luasnip",
  },
})
