-- https://github.com/nvzone/menu.git

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = "nvzone/menu",
  })
  -- require("menu").setup{}
end)


-- require('pckr').add{
--   'nvzone/menu',
--   config = function()
--      -- Keyboard users
--     vim.keymap.set("n", "<C-t>", function()
--       require("menu").open("default")
--     end, {})
-- 
--     -- mouse users + nvimtree users!
--     vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
--       require('menu.utils').delete_old_menus()
-- 
--       vim.cmd.exec '"normal! \\<RightMouse>"'
-- 
--       -- clicked buf
--       local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
--       local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
-- 
--       require("menu").open(options, { mouse = true })
--     end, {})
-- 
--   end,
-- }


