local M = {
    "mfussenegger/nvim-dap",
    version = "*",
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
                name = "Launch (GDB)",
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
            {
                name = "Launch (LLDB)",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input({
                        prompt = "Path to executable: ",
                        default = vim.fn.getcwd(0),
                        completion = "file",
                    })
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }
        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = {
            {
                name = "Launch (GDB)",
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
            -- do I really want LLDB for this one?
        }
        -- some aesthetics
        -- copied from catppuccin config
        local sign = vim.fn.sign_define

        sign(
            "DapBreakpoint",
            { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" }
        )
        sign("DapBreakpointCondition", {
            text = "●",
            texthl = "DapBreakpointCondition",
            linehl = "",
            numhl = "",
        })
        sign(
            "DapLogPoint",
            { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" }
        )
    end,
}

return M
