vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

local MiniIcons = require("mini.icons")

--- @param path string Path to file/directory
--- @param is_dir boolean If the path is a directory
--- @return string icon The icon string
--- @return string hl The highlight group
--- @return boolean default Whether the icon is the default placeholder
local function get_icon_info(path, is_dir)
    if is_dir then
        return MiniIcons.get("directory", path)
    end
    return MiniIcons.get("file", path)
end

--- @param line string The line to parse
--- @return integer pos Original column position, 0-based
--- @return string fpath Parsed line
--- @return boolean is_dir If the line is a directory
local function get_file_name(line)
    assert(vim.b.netrw_liststyle ~= 2)
    if vim.b.netrw_liststyle == 0 then
        -- directory
        local _, _, dir = line:find("^(.+)/")
        if dir then
            return 0, dir, true
        end
        -- simp
        local _, _, sym = line:find("^.+@%s*%-*>%s*(.+)")
        if sym then
            return 0, sym, false
        end
        -- normal file
        return 0, line, false
    end
    if vim.b.netrw_liststyle == 1 then
        -- directory
        local _, _, dir = line:find("^(.+)/")
        if dir then
            return 0, dir, true
        end
        -- simp
        local _, _, sym = line:find("^(.+)@%s+")
        if sym then
            local dest = vim.uv.fs_readlink(sym)
            --- @diagnostic disable-next-line: param-type-mismatch
            local temp = vim.uv.fs_readlink(dest)
            while temp do
                dest = temp
                temp = vim.uv.fs_readlink(dest)
            end
            --- @diagnostic disable-next-line: return-type-mismatch
            return 0, dest, false
        end
        -- normal file
        local single_meta_field = "%s+%S+"
        local meta_match = ""
        for _ = 1, 8 do
            meta_match = meta_match .. single_meta_field
        end
        local _, _, meta = line:find("(" .. meta_match .. ")$")
        local _, _, file = line:find("^(.+)" .. meta)
        return 0, file, false
    end
    local _, col = line:find("^[|│%s]*")
    local nopipe = line:sub(col + 1, #line)
    if not col then
        col = 0
    end
    -- directory
    local _, _, dir = nopipe:find("^(.+)/")
    if dir then
        return col, dir, true
    end
    -- symlink
    local _, _, sym = nopipe:find("^.+@%s*%-*>%s*(.+)")
    if sym then
        return col, sym, false
    end
    -- file
    return col, nopipe, false
end

--- @param bufnr integer
local function render_netrw(bufnr)
    if vim.b.netrw_liststyle == 2 then
        return
    end
    local ns = vim.api.nvim_create_namespace("netrw")
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for i, line in ipairs(lines) do
        if line:match('^"') then
            goto continue
        end
        assert(line:len() > 0, "Line shouldn't be empty")
        local col, trimmed, is_dir = get_file_name(line)
        local icon, hl = get_icon_info(trimmed, is_dir)
        vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, col, {
            id = i,
            virt_text = { { icon .. " ", hl } },
            virt_text_pos = "inline",
        })
        ::continue::
    end
end

vim.api.nvim_create_autocmd({ "BufModifiedSet" }, {
    pattern = "*",
    callback = function()
        if not (vim.bo and vim.bo.filetype == "netrw") then
            return
        end
        local bufnr = vim.api.nvim_get_current_buf()
        render_netrw(bufnr)
    end,
})
