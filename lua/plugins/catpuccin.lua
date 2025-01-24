-- https://github.com/catppuccin/nvim.git

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(
  function()
    add({
      source = 'catppuccin/nvim',
    })
  end
)

-- require('pckr').add{
--     {  'catppuccin/nvim'};
-- }
