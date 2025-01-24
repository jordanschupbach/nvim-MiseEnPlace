-- https://github.com/nvzone/volt

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = "nvzone/volt",
  })
  -- require("volt").setup{}
end)



-- require('pckr').add{ 
--   "nvzone/volt" ,
-- }
