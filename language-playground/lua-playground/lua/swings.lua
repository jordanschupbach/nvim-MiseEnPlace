


horizontal_split = function() 
vim.cmd('split')

local current_buffer = vim.api.nvim_get_current_buf()
local buffer_number = vim.api.nvim_buf_get_number(current_buffer)
end


new_terminal_below = function()
  horizontal_split()
end


new_terminal_below()




vim.api.nvim_set_current_win(1406)




