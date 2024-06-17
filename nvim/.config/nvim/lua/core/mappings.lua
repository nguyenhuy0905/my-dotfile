-- a setup like this file trades some lazy-loading for the
-- convenience of having all keymaps inside one file

local builtin = require("telescope.builtin")
local map = vim.keymap.set
-- universal
-- run formatter
map({ "n", "v" }, "<leader>fm", vim.lsp.buf.format, { desc = "Format current file" })
-- save all buffers, close all buffers, then quit
map({ "n", "v" }, "<leader>wqa", function()
    vim.cmd("wa!|%bd!|qa!")
end, { desc = "Save all buffers and quit" })
-- enter command mode without holding shift
map({ "n", "v" }, ";", ":", {})
-- telescope
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "List buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Show all help tags" })
-- nvim tree
if not vim.g.vscode then
    map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvim tree toggle" })
end
-- toggleterm
if not vim.g.vscode then
    map("n", "<A-h>", "<cmd>ToggleTerm<CR>", { desc = "Toggleterm toggle horizontal term" })
    map("n", "<A-v>", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggleterm toggle vertical term" })
    map("n", "<A-i>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggleterm toggle floating term" })
end
-- lspconfig
if not vim.g.vscode then
    map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP Go to declaration" })
    map("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to definition" })
    map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP Go to implementation" })
    map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "LSP Show signature help" })
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "LSP Add workspace folder" })
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "LSP Remove workspace folder" })
end
-- gitsigns
if not vim.g.vscode then
    --[[ local gitsigns = require("gitsigns") ]]
    local gitsignscmd = function(cmd)
        return "<cmd>Gitsigns " .. cmd .. "<CR>"
    end
    map("n", "<leader>hs", gitsignscmd("stage_hunk"))
    map("n", "<leader>hr", gitsignscmd("reset_hunk"))
    map("v", "<leader>hs", function()
        gitsignscmd("stage_hunk {vim.fn.line('.'), vim.fn.line('v')}")
    end)
    map("v", "<leader>hr", function()
        gitsignscmd("reset_hunk {vim.fn.line('.'), vim.fn.line('v')}")
    end)
    map("n", "<leader>hS", gitsignscmd("stage_buffer"))
    map("n", "<leader>hu", gitsignscmd("undo_stage_hunk"))
    map("n", "<leader>hR", gitsignscmd("reset_buffer"))
    map("n", "<leader>hp", gitsignscmd("preview_hunk"))
    map("n", "<leader>hb", function()
        gitsignscmd("blame_line{full=true}")
    end)
    map("n", "<leader>tb", gitsignscmd("toggle_current_line_blame"))
    map("n", "<leader>hd", gitsignscmd("diffthis"))
    map("n", "<leader>hD", function()
        gitsignscmd("diffthis('~')")
    end)
    map("n", "<leader>td", gitsignscmd("toggle_deleted"))
end
-- luasnip
if not vim.g.vscode then
    local ls = require("luasnip")

    map({ "i" }, "<C-K>", function()
        ls.expand()
    end, { silent = true })
    map({ "i", "s" }, "<C-L>", function()
        ls.jump(1)
    end, { silent = true })
    map({ "i", "s" }, "<C-J>", function()
        ls.jump(-1)
    end, { silent = true })

    map({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, { silent = true })
end
-- lspsaga
if not vim.g.vscode then
    map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "LSPSaga code action" })
    map({ "n", "v" }, "<leader>ol", "<cmd>Lspsaga outline<CR>", { desc = "LSPSaga outline" })
    map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "LSPSaga rename" })
end
-- dap
if not vim.g.vscode then
    map({ "i", "n", "v" }, "<F5>", "<cmd>DapContinue<CR>", { desc = "DAP start or continue a debug session" })
    map({ "i", "n", "v" }, "<F6>", "<cmd>DapStepInto<CR>", { desc = "DAP step into" })
    map({ "i", "n", "v" }, "<F7>", "<cmd>DapStepOver<CR>", { desc = "DAP step over" })
    map({ "i", "n", "v" }, "<F8>", "<cmd>DapStepOut<CR>", { desc = "DAP step out" })
    map({ "i", "n", "v" }, "<F9>", "<cmd>DapTerminate<CR>", { desc = "DAP terminate current debug session" })
    map({ "n", "v" }, "<leader>b", "<cmd>DapToggleBreakpoint<CR>", { desc = "DAP toggle breakpoint" })
end
-- barbar
if not vim.g.vscode then
    map({ "n", "v" }, "<leader>q", "<cmd>BufferClose<CR>", { desc = "Close current buffer" })
    map({ "n", "v" }, "<Tab>", "<cmd>BufferNext<CR>", { desc = "Goto next buffer" })
    map({ "n", "v" }, "<S-Tab>", "<cmd>BufferPrevious<CR>", { desc = "Goto previous buffer" })
end
-- trouble
if not vim.g.vscode then
    map({ "n", "v" }, "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle trouble panel" })
    map({ "n", "v" }, "<leader>td", "<cmd>Trouble todo toggle<cr>", { desc = "Toggle todo panel" })
end
-- neotest
if not vim.g.vscode then
    map({ "i", "n", "v" }, "<F1>", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Neotest run nearest test" })
    map(
        { "i", "n", "v" },
        "<F2>",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
        { desc = "Neotest run nearest test" }
    )
    map(
        { "i", "n", "v" },
        "<F3>",
        "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
        { desc = "Neotest run and debug test" }
    )
    map({ "i", "n", "v" }, "<F4>", "<cmd>lua require('neotest').run.stop()<cr>", { desc = "Neotest stop" })
end
-- tmux
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Navigate to left window" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Navigate to below window" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Navigate to above window" })
map("n", "<C-j>", "<cmd>TmuxNavigateRight<CR>", { desc = "Navigate to right window" })
