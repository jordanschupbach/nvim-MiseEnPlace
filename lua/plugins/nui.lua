
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'MunifTanjim/nui.nvim',
  })
end)

-- require('pckr').add{
--     { 'MunifTanjim/nui.nvim' };
-- }
