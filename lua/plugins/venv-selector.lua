-- https://github.com/linux-cultist/venv-selector.nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap-python'},
  })
  require('venv-selector').setup {
    anaconda_base_path = "/home/jordan/anaconda3/",
    anaconda_envs_path = "/home/jordan/anaconda3/envs/",
    stay_on_this_version = true,
  }
end)


-- require('pckr').add{ 
--   'linux-cultist/venv-selector.nvim',
--   requires = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
--   config = function()
--     require('venv-selector').setup {
--
--       anaconda_base_path = "/home/jordan/anaconda3/",
--       anaconda_envs_path = "/home/jordan/anaconda3/envs/",
--
--       stay_on_this_version = true,
--       -- Your options go here
--       -- name = "venv",
--       -- auto_refresh = false
--     }
--   end,
--   event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
--   keys = {
--     -- Keymap to open VenvSelector to pick a venv.
--     { '<leader>vs', '<cmd>VenvSelect<cr>' },
--     -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
--     { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
--   },
-- }
