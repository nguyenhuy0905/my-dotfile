MASON_INSTALLS = {
    -- DAP
    "netcoredbg",
    "codelldb",
    -- Linter
    "vale",
    "codespell",
    "markdownlint",
    "cmakelang",
    "shellcheck",
    "hlint",
    "chktex",
    -- clang-tidy isn't here, but we can use it if we downloaded the Clang toolchain
    -- Formatter
    "stylua",
    "shfmt",
    "fourmolu",
    "yapf",
    "latexindent",
    -- ricing
    "hyprls",
}

require("mason").setup()
