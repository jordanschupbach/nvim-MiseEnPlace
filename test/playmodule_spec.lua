
require 'busted.runner'()

describe("playmodule", function()
  it("must print out 'This is a tests'", function()
    local pm = require('lua.playmodule')
    assert(pm.test_function() == "This is a tests", "Message must be 'This is a tests'!")
  end)
end)
