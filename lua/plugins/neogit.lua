-- https://github.com/NeogitOrg/neogit

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
now(function()
  add({
    source = "NeogitOrg/neogit",
    dependencies = 'nvim-lua/plenary.nvim',
  })
  require('neogit').setup {}
end)


-- require('pckr').add{
--   'NeogitOrg/neogit',
--   requires = 'nvim-lua/plenary.nvim',
--   config = function()
--     require('neogit').setup {}
--   end,
-- }
