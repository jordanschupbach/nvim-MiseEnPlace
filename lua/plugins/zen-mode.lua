
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'folke/zen-mode.nvim',
  })

end)


-- require('pckr').add{ 
--   "folke/zen-mode.nvim",
--   opts = {
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     -- refer to the configuration section below
--   }
-- }
