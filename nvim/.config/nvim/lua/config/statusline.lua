-- simple as that
local status_line = function()
    local ret = ""
    -- left
    ret = ret .. '%<[' .. [[%{mode()}]] .. ']'
    ret = ret .. ' %f %m%r%h'
    -- middle-left
    ret = ret .. '%='
    -- middle-right
    ret = ret .. '%='
    ret = ret .. '%(%l %c%)%<'
    -- right
    ret = ret .. '%='
    return ret
end

vim.opt.statusline = status_line()
