-- {{{ Editor basics

-- 1) First, open neoshell with 'g:'

-- 2) Place cursor on line below, press '<Alt-return>'
print("Hello world")

-- 3) Visual highlight paragraph below and press '<A-return>' (i.e. vip <Alt-return>)

--- Simple hello world function 
my_global_function = function()
  print("Hello world")
end

-- 4) Now test the function out (w/ Alt-return again)
-- Want to know what it does, 'K' will show lsp popup
-- of the  documentation. Or goto definition with 'gd'
my_global_function()


-- }}} Editor basics

-- {{{ Library Dev

-- 5) Let's try a little oop:

class = require 'middleclass'
mep = require 'mep'

pm = require 'playmodule'

require 'playmodule'.set_wd_here()

mymodule = require("playmodule")

mymodule.set_wd_here()

mep.get_dynamic()

--- Message class
Message = class('Message')

vim.fn.getcwd()

Message.static.is_dynamic = 42

--- set working directory to here
set_wd_here = function()
  vim.api.nvim_command('cd ' .. vim.fn.expand('%:p:h'))
end

function Message:say_hello()
  print("Hello Worldzzzz")
end

--- Getter for internal
function Message:get_dynamic()
  return self.is_dynamic
end

msg = Message:new()

msg:say_hello()

msg:get_dynamic()

val = Message.is_dynamic
val = 21
val = Message.is_dynamic

Message

Fruit = class('Fruit')

function Fruit:initialize(sweetness)
  self.sweetness = sweetness
end

mep.print_hello()

Fruit.static.sweetness_threshold = 5



-- }}} Library Dev


