local M = {
    "mfussenegger/nvim-dap",
    config = function()
        -- DAP setup
        local dap = require("dap")
        dap.adapters.lldb = {
            type = "executable",
            command = "/usr/bin/lldb-dap",
            name = "lldb",
        }
        dap.adapters.gdb = {
            type = "executable",
            command = "/usr/bin/gdb",
            args = { "--interpreter=dap" },
        }
        dap.adapters.rustgdb = {
            type = "executable",
            command = "/usr/bin/rust-gdb",
            args = { "--interpreter=dap" },
        }
        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input({
                        prompt = "Path to executable: ",
                        default = vim.fn.getcwd(0),
                        completion = "file",
                    })
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
            },
        }
        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = {
            {
                name = "Launch",
                type = "rustgdb",
                request = "launch",
                program = function()
                    return vim.fn.input({
                        prompt = "Path to executable: ",
                        default = vim.fn.getcwd(0),
                        completion = "file",
                    })
                end,
                cwd = "${workspaceFolder}",
            },
        }
    end,
}

return M
