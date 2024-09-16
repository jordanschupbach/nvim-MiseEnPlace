-- Some user-defined lua functions
-- Maybe I'll separate this out when it gets large enough

local mep = {}

-- {{{ Mapping utils
mep.mymap = function(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end
-- }}} Mapping utils

-- {{{ Window utils

--- Window below the current one predicate
mep.win_below_p = function()
  if vim.fn.winnr('j') ~= -1 then
	  return false
  else
	  return true
  end
end

--- Window above the current one predicate
mep.win_above_p = function()
  if vim.fn.winnr('k') ~= -1 then
	  return false
  else
	  return true
  end
end

--- Window to the left of the current one predicate
mep.win_left_p = function()
  if vim.fn.winnr('h') ~= -1 then
	  return false
  else
	  return true
  end
end

--- Window to the right of the current one predicate
mep.win_right_p = function()
  if vim.fn.winnr('h') ~= -1 then
	  return false
  else
	  return true
  end
end

-- }}} Window mep

-- {{{ Project mep

--- Find the project directory
-- Searches recursively upward for .git/ folder
mep.find_project_dir = function()
    local path = vim.fn.expand("%:p:h")
    while path ~= "/" do
        local gitdir = path .. "/.git/"
        if vim.fn.isdirectory(gitdir) == 1 then
            return path
        end
        path = vim.fn.fnamemodify(path, ":h")
    end
    return vim.fn.expand("%:p:h")
end

-- }}} Project mep

-- {{{ Command mep

--- Opens init.lua for nvim config
-- TODO: dev full open config function
mep.open_init_file = function()
    vim.cmd('e ~/.config/nvim-misenplace/lua/playground.lua')
    local project_dir = require'mep'.find_project_dir()
    vim.cmd('cd ' .. project_dir)
end
-- }}} Command mep

-- {{{ repl mep

--- Open neorepl
-- opens the neorepl in a new split
mep.open_neorepl = function()
  vim.cmd 'split'
  local buf = vim.api.nvim_get_current_buf()
  require('neorepl').new { lang = 'lua', buffer = buf }
  vim.cmd 'resize 10 | setl winfixheight'
  buf = vim.api.nvim_get_current_buf()
  SendTo_Bufnr = buf
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>k', true, false, true), 'm', true)
end

--- Registers the sendto buffer
--(defaults to current buffer)
mep.register_sendto_buffer = function()
  local current_bufnr = vim.fn.bufnr '%'
  current_bufnr = vim.fn.input('SendTo bufnr: ', current_bufnr)
  SendTo_Bufnr = current_bufnr
end

--- Sends current line to SendTo buffer
-- @see register_sendto_buffer, send_lines_to_buffer
mep.send_line_to_buffer = function()
  local current_line = vim.api.nvim_get_current_line()
  local original_bufnr = vim.fn.bufnr '%'
  local target_bufnr = SendTo_Bufnr
  local win_id = vim.fn.bufwinid(target_bufnr)
  if win_id ~= -1 then
    vim.api.nvim_set_current_win(win_id)
  else -- todo handle case not on screen
    return
  end
  vim.api.nvim_feedkeys('G', 'm', true)
  vim.api.nvim_feedkeys('i', 'm', true)
  vim.api.nvim_feedkeys(current_line, 'm', true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 'm', true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'm', true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>k', true, false, true), 'm', true)
end

--- Gets the text in the visual selection
-- @return a text string of the current visual selection
mep.get_visual_selection = function()
  local s_start = vim.fn.getpos "'<"
  local s_end = vim.fn.getpos "'>"
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

--- Gets the text in the visual selection
-- @return a table of lines of current visual selection
mep.get_visual_selection_lines = function()
  local s_start = vim.fn.getpos "'<"
  local s_end = vim.fn.getpos "'>"
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  -- return table.concat(lines, '\n')
  return lines
end

--- Sends visual selection to SendTo buffer
-- @see register_sendto_buffer, send_line_to_buffer
mep.send_lines_to_buffer = function()
  local current_lines = require('mep').get_visual_selection_lines()
  local original_bufnr = vim.fn.bufnr '%'
  local target_bufnr = SendTo_Bufnr
  local win_id = vim.fn.bufwinid(target_bufnr)
  if win_id ~= -1 then
    vim.api.nvim_set_current_win(win_id)
  else -- todo handle case not on screen
    return
  end
  vim.api.nvim_feedkeys('G', 'm', true)
  vim.api.nvim_feedkeys('i', 'm', true)
  for _, line in ipairs(current_lines) do
    vim.api.nvim_feedkeys(line, 'm', true)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 'm', true)
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'm', true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>k', true, false, true), 'm', true)
end

-- }}} repl mep

return mep
