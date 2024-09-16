return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'j-hui/fidget.nvim',
    'folke/neodev.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    opts = { lsp = { auto_attach = true } },
  },
}
