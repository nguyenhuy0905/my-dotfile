-- plugin-agnostic keymaps
vim.keymap.set("x", "/", "<Esc>/\\%V", { desc = "Search in selected area" })
vim.keymap.set(
    "x",
    "?",
    "<Esc>?\\%V",
    { desc = "Search in selected area (backwards)" }
)
vim.keymap.set("x", "s", ":s/\\%V", { desc = "Replace in selected area" })

vim.keymap.set(
    "x",
    "<A-j>",
    ":m '>+1<CR>gv=gv",
    { desc = "Move selection down 1 line" }
)
vim.keymap.set(
    "x",
    "<A-k>",
    ":m '<-2<CR>gv=gv",
    { desc = "Move selection up 1 line" }
)
