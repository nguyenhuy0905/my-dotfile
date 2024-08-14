require("neotest").setup({
    adapters = {
        require("neotest-gtest").setup({
        }),
        require("rustaceanvim.neotest")
    },
})
