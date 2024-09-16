-- Just a throwaway lua playground

print 'hello world'

mep = require 'mep'

--- Just a simple hello world function
-- prints hello world
mep.print_hello = function()
  print("Hello, world!")
end

mep.print_hello()

vim.cmd('Neotree toggle')
vim.cmd('split')
vim.cmd('terminal')
vim.cmd('vsplit')
vim.cmd('wincmd l')

