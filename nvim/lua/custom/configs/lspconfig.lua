local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
}

lspconfig.pyright.setup ({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
})

lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
    root_dir = util.root_pattern(
        ".clangd",
        ".clangd-tidy",
        ".clangd-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git"
    ),
    single_file_support = true,
}

lspconfig.emmet_ls.setup{
    -- on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"emmet-ls", "--stdio"},
    filetypes = {
        "astro",
        "css",
        "eruby",
        "html",
        "htmldjango",
        "javascriptreact",
        "less",
        "pug",
        "sass",
        "scss",
        "svelte",
        "typescriptreact",
        "vue",
    },
    init_options = {
        options = {
            ["bem.enabled"] = true,
        },
    },
}

lspconfig.sqlls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"sql-language-server", "up","--method", "stdio"},
    filetypes = {"sql", "mysql"},
}
