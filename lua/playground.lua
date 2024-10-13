mep = require'mep'
mep.dump({a = 1, b = 2, c = 3})

print("hello world")
pm = require('lua.playmodule')
mep.dump(pm)

assert(pm.test_function() == "This is a test")
pm.another_test_function()
pm.the_final_function()


