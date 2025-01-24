-- https://github.com/hrsh7th/nvim-cmp

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(
  function()
    add({ 
      source = 'hrsh7th/nvim-cmp', 
      depends = {
          'neovim/nvim-lspconfig',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'hrsh7th/nvim-cmp',
          'SirVer/ultisnips',
          'quangnguyen30192/cmp-nvim-ultisnips'
        },
    })

  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources(
      { { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
      }),
  })

  end
)



-- require('pckr').add{
--   'hrsh7th/nvim-cmp',
-- 
--   -- {{{ deps
-- requires = {
--     'neovim/nvim-lspconfig',
--     'hrsh7th/cmp-nvim-lsp',
--     'hrsh7th/cmp-buffer',
--     'hrsh7th/cmp-path',
--     'hrsh7th/cmp-cmdline',
--     'hrsh7th/nvim-cmp',
--     'SirVer/ultisnips',
--     'quangnguyen30192/cmp-nvim-ultisnips'
--   },
--   -- }}} deps
-- 
--   -- {{{ config
--   config = function()
--     local cmp = require'cmp'
--     cmp.setup({
--       snippet = {
--         expand = function(args)
--           vim.fn["UltiSnips#Anon"](args.body)
--         end,
--       },
--       window = {
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--       },
--       mapping = cmp.mapping.preset.insert({
--         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<C-e>'] = cmp.mapping.abort(),
--         ['<CR>'] = cmp.mapping.confirm({ select = true }),
--       }),
--       sources = cmp.config.sources(
--         { { name = 'nvim_lsp' },
--           { name = 'ultisnips' },
--           { name = 'buffer' },
--         }),
--   })
--   end
--   -- }}} config
-- 
-- }
