print("hello world")

pm = require('lua.playmodule')
assert(pm.test_function() == "This is a test")
pm.another_test_function()
pm.the_final_function()


