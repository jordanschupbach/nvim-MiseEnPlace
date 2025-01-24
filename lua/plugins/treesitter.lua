-- https://github.com/nvim-treesitter/nvim-treesitter.git


local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Use 'master' while monitoring updates in 'main'
    checkout = 'master',
    monitor = 'main',
    -- Perform action after every checkout
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  -- Possible to immediately execute code which depends on the added plugin
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "c",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc"
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
      enable = true,
      disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,
      additional_vim_regex_highlighting = false,
    },
  }
end)


-- require('pckr').add{ 
--   'nvim-treesitter/nvim-treesitter',
--   config = function()
--     require'nvim-treesitter.configs'.setup {
--       ensure_installed = {
--         "c",
--         "lua",
--         "markdown",
--         "markdown_inline",
--         "query",
--         "vim",
--         "vimdoc"
--       },
--       sync_install = false,
--       auto_install = true,
--       ignore_install = { "javascript" },
--       highlight = {
--         enable = true,
--         disable = function(lang, buf)
--             local max_filesize = 100 * 1024 -- 100 KB
--             local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--             if ok and stats and stats.size > max_filesize then
--                 return true
--             end
--         end,
--         additional_vim_regex_highlighting = false,
--       },
--     }
--   end
-- }
