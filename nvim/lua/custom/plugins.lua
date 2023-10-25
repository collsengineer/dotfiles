local plugins = {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- Go
                "gopls",
                "golines",
                "goimports-reviser",
                "gofumpt",
                -- Python
                "pyright",
                "mypy",
                "ruff",
                "black",
                "debugpy",
                -- Rust
                "rust-analyzer",
                -- C/C++
                "clangd",
                "clang-format",
                -- HTML-CSS
                "emmet-ls",
                -- SQL
                "sqlls",
            },
        },
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "mfussenegger/nvim-dap",
        init = function()
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "dreamsofcode-io/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            config = function(_, opts)
                local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
                require("dap-python").setup(path)
            end,
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "html",
                "htmldjango",
                "css",
                "bash",
                "python",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "vim",
                "vimdoc",
                "lua",
                "json",
                "javascript",
                "typescript",
                "rust",
                "c",
                "cpp",
                "sql",
                "toml",
                "markdown",
                "latex",
                "dockerfile",
                "comment",
                "csv",
                "fish",
                "requirements",
                "yaml",
                "ocaml",
                "commonlisp",
                "org",
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
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            --require("core.utils").load_mappings("gopher")
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
            return require "custom.configs.rust-tools"
        end,
        config = function(_, opts)
            require('rust-tools').setup(opts)
        end
    },
    {
        "saecki/crates.nvim",
        ft = {"rust", "toml"},
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            local M  = require "plugins.configs.cmp"
            table.insert(M.sources, {name = "crates"})
            return M
        end,
    },
    {
        "nvim-orgmode/orgmode",
        dependencies = {
            {"nvim-treesitter/nvim-treesitter", lazy = true},
        },
        event = "VeryLazy",
        config = function()
            -- Load treesitter grammar for org
            require("orgmode").setup_ts_grammar()
            -- Setup treesitter
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "org" },
                },
                ensure_installed = { "org" },
            })
            -- Setup orgmode
            require("orgmode").setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_files = '~/orgfiles/refile.org',
            })
        end,
    },
}
return plugins
