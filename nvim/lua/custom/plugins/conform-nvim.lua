return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'
    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        python = { 'isort', 'black' },
        go = { 'goimports-reviser', 'gofumpt', 'golines' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end, { desc = 'Format file for range (in visual mode)' })
  end,
}
