-- {{{ Mappings

local mymap = require'mep'.mymap
mymap('n', 'g:', '<CMD>term<CR>')
mymap('n', '<A-return>', '<CMD>SlimeSendCurrentLine<CR>')
mymap('v', '<A-return>', ':SlimeSend<CR>')
mymap('n', '<C-A-return>', '<CMD>echo "TODO"<CR>')

-- }}} Mappings
