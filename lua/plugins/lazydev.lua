-- https://github.com/folke/lazydev.nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = "Bilal2453/luvit-meta",
  })
end)

now(function()
  add({
    source = "folke/lazydev.nvim",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  })
end)

-- return {
--   {
--     "folke/lazydev.nvim",
--     ft = "lua",
--     opts = {
--       library = {
--         { path = "luvit-meta/library", words = { "vim%.uv" } },
--       },
--     },
--   },
--   { "Bilal2453/luvit-meta", lazy = true },
--   { "hrsh7th/nvim-cmp",
--     opts = function(_, opts)
--       opts.sources = opts.sources or {}
--       table.insert(opts.sources, {
--         name = "lazydev",
--         group_index = 0,
--       })
--     end,
--   },
-- }

-- require('pckr').add{
--   "folke/lazydev.nvim",
--   ft = "lua", -- only load on lua files
--   opts = {
--     library = {
--       -- Library paths can be absolute
--       "~/.config/awesome",
--       "/usr/share/awesome/lib",
--       "~/projects/my-awesome-lib",
--       -- Or relative, which means they will be resolved from the plugin dir.
--       "lazy.nvim",
--       "luvit-meta/library",
--       -- It can also be a table with trigger words / mods
--       -- Only load luvit types when the `vim.uv` word is found
--       { path = "luvit-meta/library", words = { "vim%.uv" } },
--       -- always load the LazyVim library
--       "LazyVim",
--       -- Only load the lazyvim library when the `LazyVim` global is found
--       { path = "LazyVim", words = { "LazyVim" } },
--       -- Load the wezterm types when the `wezterm` module is required
--       -- Needs `justinsgithub/wezterm-types` to be installed
--       { path = "wezterm-types", mods = { "wezterm" } },
--       -- Load the xmake types when opening file named `xmake.lua`
--       -- Needs `LelouchHe/xmake-luals-addon` to be installed
--       { path = "xmake-luals-addon/library", files = { "xmake.lua" } },
--     },
--     -- always enable unless `vim.g.lazydev_enabled = false`
--     -- This is the default
--     enabled = function(root_dir)
--       return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
--     end,
--     -- disable when a .luarc.json file is found
--     enabled = function(root_dir)
--       return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
--     end,
--   },
-- }
