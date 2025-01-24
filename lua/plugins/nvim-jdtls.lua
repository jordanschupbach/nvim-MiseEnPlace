-- https://github.com/mfussenegger/nvim-jdtls

-- Prototype
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
now(function()
  add({
    source = 'mfussenegger/nvim-jdtls',
  })
end)
