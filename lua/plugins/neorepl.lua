-- https://github.com/ii14/neorepl.nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
now(function()
  add({
    source = 'ii14/neorepl.nvim',
  })
end)

-- require('pckr').add{
--   'ii14/neorepl.nvim'
-- }
