-- simple as that
local status_line = function()
    local ret = ""
    -- left
    ret = ret .. '%<[' .. [[%{mode()}]] .. ']'
    ret = ret .. ' %f %m%r%h'
    -- right
    ret = ret .. '%='
    ret = ret .. '%<%-20.(%l %c %p%%%)'
    return ret
end

vim.opt.statusline = status_line()
