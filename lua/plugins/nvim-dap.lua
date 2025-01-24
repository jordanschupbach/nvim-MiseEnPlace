-- https://github.com/mfussenegger/nvim-dap

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
now(function()
  add({
    source = 'mfussenegger/nvim-dap',
  })
end)

-- require('pckr').add{
--   'mfussenegger/nvim-dap',
--   requires = 'mfussenegger/nvim-jdtls',
-- }
