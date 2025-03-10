local harpoon = require("harpoon")

harpoon:setup({})

-- im too lazy, imma just set up keybinds here

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add item to list" })
vim.keymap.set("n", "<leader>tt", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
  { desc = "Open harpoon window" })

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
