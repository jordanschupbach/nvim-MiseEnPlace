require 'busted.runner'()

describe("a test", function()
  it("tests insulate block does not update environment", function()
    local pm = require('playmodule')
    assert(pm.test_function() == "This is a tests", "Message must be 'This is a tests'!")
  end)
end)
