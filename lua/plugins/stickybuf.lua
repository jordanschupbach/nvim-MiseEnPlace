

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'stevearc/stickybuf.nvim',
  })
end)


-- require('pckr').add{
--   'stevearc/stickybuf.nvim',
--   opts = {},
-- }
