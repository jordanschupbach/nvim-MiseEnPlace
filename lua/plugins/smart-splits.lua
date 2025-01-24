-- https://github.com/mrjones2014/smart-splits.nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(
  function()
    add({
      source = 'mrjones2014/smart-splits.nvim',
    })
  end
)


-- -- lazy conf
-- return {'mrjones2014/smart-splits.nvim'}

-- -- pckr conf
-- require('pckr').add{
-- 	{ 'mrjones2014/smart-splits.nvim' }; 
-- }
