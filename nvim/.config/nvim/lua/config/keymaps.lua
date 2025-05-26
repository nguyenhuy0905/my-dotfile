-- plugin-agnostic keymaps
vim.keymap.set("x", "/", "<Esc>/\\%V", { desc = "Search in selected area" })
vim.keymap.set(
    "x",
    "?",
    "<Esc>?\\%V",
    { desc = "Search in selected area (backwards)" }
)
