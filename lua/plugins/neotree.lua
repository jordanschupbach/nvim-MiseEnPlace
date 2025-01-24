-- https://github.com/nvim-neo-tree/neo-tree.nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later


now(
  function()
    add({
      source =  "MunifTanjim/nui.nvim",
    })
  end
)


now(
  function()
    add({
      source =  'nvim-neo-tree/neo-tree.nvim',
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      }
    })
    require('neo-tree').setup{}
  end
)

-- return {
--     "nvim-neo-tree/neo-tree.nvim",
--     branch = "v3.x",
--     dependencies = {
--       "nvim-lua/plenary.nvim",
--       "nvim-tree/nvim-web-devicons",
--       "MunifTanjim/nui.nvim",
--     }
-- }


