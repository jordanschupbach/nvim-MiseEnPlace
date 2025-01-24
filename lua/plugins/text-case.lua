-- https://github.com/johmsalas/text-case.nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'johmsalas/text-case.nvim',
  })
end)

-- require('pckr').add{ 'johmsalas/text-case.nvim'}
