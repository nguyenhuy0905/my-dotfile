return {
    "Saghen/blink.cmp",
    event = "InsertEnter",
    opts = {
        signature = { enabled = true },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            per_filetype = {
                lua = { inherit_defaults = true, "lazydev" },
            },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
    },
    version = "1.*",
}
