-- https://github.com/williamboman/mason.nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(
  function()
    add({
      source = 'williamboman/mason.nvim',
    })
    require('mason').setup()
  end
)


