local M = {
    "mason-org/mason.nvim",
    version = "*",
    opts = {},
}

-- these are stuff I don't already have local
local install_list = {
    "stylua",
    "cspell",
    "lua-language-server",
}

vim.api.nvim_create_user_command("MasonInstallListed", function(_)
    local counter = 0
    local registry = require("mason-registry")
    for _, item in ipairs(install_list) do
        if not registry.is_installed(item) then
            vim.cmd("MasonInstall " .. item)
            counter = counter + 1
        end
        if counter == 0 then
            print("All packages listed already installed!")
        end
    end
end, {})

return M
