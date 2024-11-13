-- vim.api.nvim_command('autocmd BufRead,BufNewFile *.h set filetype=c')
-- vim.api.nvim_command('autocmd BufRead,BufNewFile *.c set filetype=c')

-- {{{ Mappings

  print('Loading cpp.lua')  -- DEBUG
local mymap = require'mep'.mymap
mymap('n', 'g:', '<CMD>term<CR>')
mymap('n', '<A-return>', '<CMD>SlimeSendCurrentLine<CR>')
mymap('v', '<A-return>', ':SlimeSend<CR>')
mymap('n', '<C-A-return>', '<CMD>echo "TODO"<CR>')

-- }}} Mappings
