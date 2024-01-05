return {
  'mfussenegger/nvim-lint',
  event = 'VeryLazy',
  linters_by_ft = {
    javascript = { 'eslint_d' },
    typescript = { 'eslint_d' },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
}
