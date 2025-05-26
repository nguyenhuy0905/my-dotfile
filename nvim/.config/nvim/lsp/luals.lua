-- the only issue is it doesn't show the config options when you call setup({})
local function luals_libs()
    local ret = {
        vim.env.VIMRUNTIME,
    }
    for _, plugin in ipairs(require("lazy").plugins()) do
        table.insert(ret, plugin.dir .. "/lua")
    end
    return ret
end

vim.lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".git",
    },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = {
                    "lua/?.lua",
                    "lua/?/init.lua",
                },
            },
            workspace = {
                -- realizing vim runtime
                library = luals_libs(),
                checkThirdParty = false,
            },
            diagnostics = {
                -- doesn't shout about vim as undefined
                globals = { "vim" },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
