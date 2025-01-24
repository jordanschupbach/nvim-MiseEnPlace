-- https://github.com/akinsho/toggleterm.nvim


-- Prototype
--
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'akinsho/toggleterm.nvim',
  })
end)



-- require('pckr').add{ 
--   {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
-- }
