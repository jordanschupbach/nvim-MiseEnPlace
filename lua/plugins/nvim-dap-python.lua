-- https://github.com/mfussenegger/nvim-dap-python.git

return {
  'mfussenegger/nvim-dap-python',
  dependencies = 'mfussenegger/nvim-dap',
  config = function()
    require("dap-python").setup("python3")
    require('dap-python').test_runner = 'pytest'
  end,
}
