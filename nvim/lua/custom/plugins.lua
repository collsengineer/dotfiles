local plugins = {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "gopls",
                "golines",
                "goimports-reviser",
                "gofumpt",
                "pyright",
                "mypy",
                "ruff",
                "black",
                "clangd",
                "emmet-ls",
                "sqlls",
            },
        },
    },
    --{
    --    "mhartington/formatter.nvim",
    --    event = "VeryLazy",
    --    opts = function()
    --        return require "custom.configs.formatter"
    --    end
    --},
    {
        "mfussenegger/nvim-dap",
    },
    --{
    --    "mfussenegger/nvim-lint",
    --    event = "VeryLazy",
    --    config = function()
    --        require "custom.configs.lint"
    --    end
    --},
    {
        "dreamsofcode-io/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {
                "html",
                "css",
                "bash",
                "python",
                "go",
                "vim",
                "lua",
                "json",
                "javascript",
                "typescript",
                "rust",
                "c",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        ft = {
            "go",
            "python",
        },
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "dreamsofcode-io/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
}

return plugins
