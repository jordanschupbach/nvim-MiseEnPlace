
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(
  function()
    add({
      source = "github/copilot.vim",
    })
  end
)

-- require('pckr').add{
--     { "github/copilot.vim"};
-- }
