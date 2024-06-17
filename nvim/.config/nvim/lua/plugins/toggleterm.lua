require("toggleterm").setup({
    size = function(term)
        if term.direction == "vertical" then
            return vim.o.columns * 0.4
        elseif term.direction == "horizontal" then
            return 20
        elseif term.direction == "float" then
            return 20
        end
    end,
    border = "single",
    shell = vim.o.shell,
})
