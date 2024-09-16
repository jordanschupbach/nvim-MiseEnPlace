-- https://github.com/williamboman/mason-lspconfig.nvim

return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'MunifTanjim/nui.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local ensured_servers = {
      -- bashls = {},
      -- cmake = {},
      jdtls = {
        filetyptes = { 'java' },
      },
      pyright = {},
      -- rust_analyzer = {},
      r_language_server = {
        cmd = { 'R', '--slave', '-e', "'languageserver::run()'" },
        filetypes = { 'R', 'r', 'rmd', 'Rmd' },
      },
      -- lua_ls = require 'lsp.lua-ls',
      -- clangd = require 'lsp.clangd',
    }
    local servers = {
      -- bashls = {},
      -- cmake = {},
      clangd = {
        cmd = 'clangd -std=c++20 -stdlib=libstdc++ -I/usr/include/gismo/',
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' }, --  'proto'
        single_file_support = true,
      },
      jdtls = {}, -- jdtls_config
      tsserver = {},
      phpactor = {},
      pyright = {},
      r_language_server = {
        cmd = { 'R', '--slave', '-e', "'languageserver::run()'" },
        filetypes = { 'R', 'r', 'rmd', 'Rmd' },
      },
      hls = {
        filetypes = { 'haskell', 'lhaskell', 'cabal', 'hs' },
        cmd = { '/home/jordan/.local/share/nvim/mason/bin/haskell-language-server-wrapper', '--lsp' },
        single_file_support = true,
        root_dir = '/home/jordan/scratchpads/haskell-scratchpad/',
        settings = {
          haskell = {
            cabalFormattingProvider = 'cabalfmt',
            formattingProvider = 'ormolu',
          },
        },
      },
      -- neocmakelsp = require 'lsp.neocmakelsp',
      -- lua_ls = require 'lsp.lua-ls',
    }
    -- require('neodev').setup()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities()
    local mason_lspconfig = require 'mason-lspconfig'
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(ensured_servers),
    }
    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          settings = servers[server_name],
        }
      end,
    }
  end,
}
