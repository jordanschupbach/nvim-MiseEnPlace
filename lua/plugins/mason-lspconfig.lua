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
      -- typescript_language_server = {}, -- TODO: find out actual name...
      jdtls = {
        filetyptes = { 'java' },
      },
      pyright = {},
      rust_analyzer = {},
      r_language_server = {
        cmd = { 'R', '--slave', '-e', "'languageserver::run()'" },
        filetypes = { 'R', 'r', 'rmd', 'Rmd' },
      },
      clangd = {},
      ts_ls = {},
      lua_ls = { settings = { Lua = {
        workspace = {
          checkThirdParty = false,
          library = vim.tbl_deep_extend('force', vim.api.nvim_get_runtime_file("", true), {
            "${3rd}/luv/library",
            "${3rd}/busted/library",
            -- vim.env.VIMRUNTIME
            "/usr/share/nvim/runtime",
            "/usr/share/awesome/lib",
            "/usr/share/lua",
          }),
        },
        diagnostics = {
          globals = {
            "awesome",
            "awful",
            "client",
            "screen",
            "tag",
            "root",
          },
        },
        runtime = { version = 'LuaJIT' },
        completion = { callSnippet = "Replace", },
        telemetry = { enable = false, },
      }}}

    }
    local servers = {
      clangd = {
        cmd = 'clangd -std=c++20 -stdlib=libstdc++ -I/usr/include/gismo/',
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
        single_file_support = true,
      },
      ts_ls = {},
      jdtls = {},
      tsserver = {},
      phpactor = {},
      typescript_language_server = {},
      -- pyright = {},
      r_language_server = {
        cmd = { 'R', '--slave', '-e', "'languageserver::run()'" },
        filetypes = { 'R', 'r', 'rmd', 'Rmd' },
      },

      lua_ls = { settings = { Lua = {
        workspace = {
          checkThirdParty = false,
          library = vim.tbl_deep_extend('force', vim.api.nvim_get_runtime_file("", true), {
            "${3rd}/luv/library",
            "${3rd}/busted/library",
            -- vim.env.VIMRUNTIME
            "/usr/share/nvim/runtime",
            "/usr/share/awesome/lib",
            "/usr/share/lua",
          }),
        },
        diagnostics = {
          globals = {
            "awesome",
            "awful",
            "client",
            "screen",
            "tag",
            "root",
          },
        },
        runtime = { version = 'LuaJIT' },
        completion = { callSnippet = "Replace", },
        telemetry = { enable = false, },
      },
      neocmake = {
cmd = { "neocmakelsp", "--stdio" },
            filetypes = { "cmake" },
            root_dir = function(fname)
                return nvim_lsp.util.find_git_ancestor(fname)
            end,
            single_file_support = true,-- suggested
            on_attach = on_attach, -- on_attach is the on_attach function you defined
            init_options = {
                format = {
                    enable = true
                },
                lint = {
                    enable = true
                },
                scan_cmake_in_package = true -- default is true
            }

      },


    }}}
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




  -- From looking at LspInfo:
  -- require'lspconfig'.lua_ls.setup {
  --   on_init = function(client)
  --     if client.workspace_folders then
  --       local path = client.workspace_folders[1].name
  --       if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
  --         return
  --       end
  --     end
  --     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
  --       runtime = {
  --         -- Tell the language server which version of Lua you're using
  --         -- (most likely LuaJIT in the case of Neovim)
  --         version = 'LuaJIT'
  --       },
  --       -- Make the server aware of Neovim runtime files
  --       workspace = {
  --         checkThirdParty = false,
  --         library = {
  --           vim.env.VIMRUNTIME
  --           -- Depending on the usage, you might want to add additional paths here.
  --           -- "${3rd}/luv/library"
  --           -- "${3rd}/busted/library",
  --         }
  --         -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
  --         -- library = vim.api.nvim_get_runtime_file("", true)
  --       }
  --     })
  --   end,
  --   settings = {
  --     Lua = {}
  --   }
  -- }

