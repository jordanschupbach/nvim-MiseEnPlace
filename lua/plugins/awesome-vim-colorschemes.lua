-- https://github.com/rafi/awesome-vim-colorschemes

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(
  function()
    add({
      source = 'rafi/awesome-vim-colorschemes',
    })
  end
)

-- require('pckr').add{
--     {  'rafi/awesome-vim-colorschemes'};
-- }
