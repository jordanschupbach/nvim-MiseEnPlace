

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(
  function()
    add({
      source = "nvim-zh/colorful-winsep.nvim",
    })
  end
)

--
-- require('pckr').add{
--     { "nvim-zh/colorful-winsep.nvim"};
--     config = function ()
--         require('colorful-winsep').setup()
--     end
-- }
