local actions = require("telescope.actions")
local telescopeConfig = require("telescope.config")

-- copied from Telescope docs
-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

require("telescope").setup({
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
    file_ignore_patterns = {
      "node_modules",
      ".git"
    },
    winblend = 10,
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
  },
  pickers = {
    find_files = {
      find_command = { "fd",
        "--hidden",
        "--type", "f",
        "--strip-cwd-prefix",
      }
    },
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
    find_command = { "rg",
      "--trim",
      "--hidden",
      "--files",
      "--glob",
      "!**/.git/*",
    },
  },
})
