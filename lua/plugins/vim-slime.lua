-- https://github.com/jpalardy/vim-slime

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'jpalardy/vim-slime',
  })
end)


-- require('pckr').add{
--     { 'jpalardy/vim-slime'};
-- }
