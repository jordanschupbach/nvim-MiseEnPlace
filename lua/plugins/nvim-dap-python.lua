-- https://github.com/mfussenegger/nvim-dap-python.git

-- Prototype
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
now(function()
  add({
    source = 'mfussenegger/nvim-dap-python',
  })
  require("dap-python").setup("python3")
  require('dap-python').test_runner = 'pytest'
end)

-- require('pckr').add{
--   'mfussenegger/nvim-dap-python',
--   requires = 'mfussenegger/nvim-dap',
--   config = function()
--     require("dap-python").setup("python3")
--     require('dap-python').test_runner = 'pytest'
--   end,
-- }
