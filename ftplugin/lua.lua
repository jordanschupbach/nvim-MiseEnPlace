
local mymap = require'mep'.mymap

mymap('n', 'g:', ':lua require"mep".open_neorepl()<CR>')
mymap('n', '<A-return>', ':lua require"mep".send_line_to_buffer()<CR>')
mymap('v', '<A-return>', ':lua require"mep".send_lines_to_buffer()<CR>')
