local masonpath = vim.fn.expand "~" .. "/.local/share/nvim/mason/packages/"
local dap = require("dap")
-- configure debug adapters
dap.adapters.codelldb = {
    type = "server",
    host = '127.0.0.1',
    port = "${port}",
    executable = {
        command = masonpath .. "codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
    },
}

-- configure C, CPP and Rust DAP
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
