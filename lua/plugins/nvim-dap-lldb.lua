-- https://github.com/julianolf/nvim-dap-lldb


local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'julianolf/nvim-dap-lldb',
  })
  require('dap-lldb').setup({
    codelldb_path = '/home/jordan/.local/share/nvim-misenplace/mason/bin/codelldb',
  })
end)

-- require('pckr').add{
--    "julianolf/nvim-dap-lldb",
--    requires = { "mfussenegger/nvim-dap" },
--    opts = { 
--      codelldb_path = "/home/jordan/.local/share/nvim-misenplace/mason/bin/codelldb" 
--    },
-- }
