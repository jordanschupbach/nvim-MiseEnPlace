-- https://github.com/folke/which-key.nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
 add({
   source = 'folke/which-key.nvim',
 })
 wk = require("which-key")
 wk.add({
   { "<Space>b", group = "Buffer" },
   { "<Space>c", group = "Code" },
   { "<Space>d", group = "Debug" },
   { "<Space>e", group = "Errors" },
   { "<leader>f", group = "File" },
   { "<Space>g", group = "Git" },
   { "<Space>l", group = "Lsp" },
   { "<Space>o", group = "Open" },
   { "<Space>p", group = "Project" },
   { "<Space>q", group = "Quit" },
   { "<Space>r", group = "Reload" },
   { "<Space>t", group = "Telescope" },
   { "<Space>w", group = "Window" },
   { "<Space>h", group = "Help" },
   { "<Space>y", group = "Snippets" },
   { "<Space>z", group = "Zen" },
 })
end)


-- require('pckr').add{
--     {   "folke/which-key.nvim" };
-- }

-- return {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
--   config = function()
--     wk = require("which-key")
--     wk.add({
--     { "<Space>b", group = "Buffer" },
--     { "<Space>w", group = "Window" },
--     { "<Space>y", group = "Snippets" },
--     { "<leader>f", group = "File" }, -- group
--   })
--   end
-- 
-- }
