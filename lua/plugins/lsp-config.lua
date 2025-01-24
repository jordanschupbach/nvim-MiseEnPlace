
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later


now(
  function()
    add({
      source = 'j-hui/fidget.nvim',
    })
  end
)

now(
  function()
    add({
      source = 'folke/neodev.nvim',
    })
  end
)


now(
  function()
    add({
      source = 'neovim/nvim-lspconfig',
      dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'j-hui/fidget.nvim',
        'folke/neodev.nvim',
      },
      opts = { lsp = { auto_attach = true } },
    })
  end
)


-- require('pckr').add{
--   'neovim/nvim-lspconfig',
--   requires = {
--     'williamboman/mason.nvim',
--     'williamboman/mason-lspconfig.nvim',
--     'j-hui/fidget.nvim',
--     'folke/neodev.nvim',
--     requires = {
--       'MunifTanjim/nui.nvim',
--     },
--     opts = { lsp = { auto_attach = true } },
--   },
-- }
