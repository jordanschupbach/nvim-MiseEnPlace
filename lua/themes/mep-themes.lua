
local M = {}

-- M.config = {
--     colors = { theme = { default = {} }, palette = {} },
-- }

function M.setLightTheme()
  local highlights = require 'themes.light'
  for hl, spec in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, spec)
  end
end

function M.setDarkTheme()
  local highlights = require 'themes.dark'
  for hl, spec in pairs(highlights) do
    vim.api.nvim_set_hl(0, hl, spec)
  end
end

function M.load()
  if require('global-vars').is_darkmode() then
    M.setDarkTheme()
  else
    M.setLightTheme()
  end
end

return M
