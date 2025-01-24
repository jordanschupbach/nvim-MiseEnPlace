-- https://github.com/lewis6991/gitsigns.nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function() add({ source = "lewis6991/gitsigns.nvim", })
  require('gitsigns').setup {
    sign_priority = 1,
    signs = {
      add = { text = '▍' },
      change = { text = '▍' },
      delete = { text = '▍' },
      topdelete = { text = '▍' },
      changedelete = { text = '▍' },
    },
  }
end)
