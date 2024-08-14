local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-u",
        },
        preview = {
            mime_hook = function(filepath, bufnr, opts)
                local is_image = function(path)
                    local image_extensions = { "png", "jpg" } -- Supported image formats
                    local split_path = vim.split(path:lower(), '.', { plain = true })
                    local extension = split_path[#split_path]
                    return vim.tbl_contains(image_extensions, extension)
                end
                if is_image(filepath) then
                    local term = vim.api.nvim_open_term(bufnr, {})
                    local function send_output(_, data, _)
                        for _, d in ipairs(data) do
                            vim.api.nvim_chan_send(term, d .. '\r\n')
                        end
                    end
                    vim.fn.jobstart(
                        {
                            "imv", filepath -- Terminal image viewer command
                        },
                        { on_stdout = send_output, stdout_buffered = true, pty = true })
                else
                    require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid,
                        "Binary cannot be previewed")
                end
            end
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            hidden = true,
            mappings = {
            },
        }
    },
    pickers = {
        buffers = {
            mappings = {
                n = {
                    ["dd"] = actions.delete_buffer + actions.move_to_top,
                }
            },
        },
    },
    find_files = {
        hidden = true,
        no_ignore = true,
        cwd = vim.fn.expand("%:p:h"),
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--no-ignore-vcs", "--follow" },
    },
})

require("telescope").load_extension("file_browser")
