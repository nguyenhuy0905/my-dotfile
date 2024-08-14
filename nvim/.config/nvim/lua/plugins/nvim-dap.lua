local masonpath = vim.fn.stdpath("data") .. "/mason/bin/"
local dap = require("dap")
-- configure debug adapters
dap.adapters.codelldb = {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
        command = masonpath .. "codelldb",
        args = { "--port", "${port}" },
        env = { "LSAN_OPTIONS=verbosity=1:log_threads=1" }
    },
}
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" },
}

-- configure C, CPP and Rust DAP
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        stopAtBeginningOfMainSubprogram = false,
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
