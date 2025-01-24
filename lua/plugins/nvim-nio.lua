
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
now(function()
  add({
    source = 'nvim-neotest/nvim-nio',
  })
end)
