-- https://github.com/SirVer/ultisnips

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function() add({ source = "SirVer/ultisnips", })
  -- require('ultisnips').setup {}
end)

-- require('pckr').add{ 
--     'SirVer/ultisnips',
-- }
