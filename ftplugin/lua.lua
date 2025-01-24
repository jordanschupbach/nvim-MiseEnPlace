
-- {{{ Mappings

-- mep = require('mep')


mymap = function(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end
-- mymap('n', 'g:', ':lua require"mep".open_neorepl()<CR>')
mymap('n', '<A-return>', ':lua require"mep".send_line_to_buffer()<CR>')
mymap('v', '<A-return>', ':lua require"mep".send_lines_to_buffer()<CR>')
-- mymap('n', '<C-A-return>', '<CMD>source %<CR>')
-- mymap('n', '<C-return>', '<CMD>SlimeSendCurrentLine<CR>')
-- mymap('v', '<C-return>', '<CMD>SlimeSend0<CR>')

-- }}} Mappings


-- Setup the lsp?



-- vim: set foldmethod=marker
