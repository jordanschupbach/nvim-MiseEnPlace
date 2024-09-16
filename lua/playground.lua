-- Just a throwaway lua playground

print 'hello world'

Mep = require 'mep'

--- Just a simple hello world function
-- prints hello world
Mep.print_hello = function()
  print("Hello, world!")
end

Mep.print_hello()

vim.cmd('Neotree toggle')
vim.cmd('split')
vim.cmd('terminal')
vim.cmd('vsplit')
vim.cmd('wincmd l')

