MASON_INSTALLS = {
    -- DAP
    "netcoredbg",
    "codelldb",
    -- Linter
    "vale",
    "codespell",
    "markdownlint",
    "cmakelint",
    -- clang-tidy isn't here, but we can use it if we downloaded the Clang toolchain
    -- Formatter
    "stylua",
    "shfmt",
}

require("mason").setup()
