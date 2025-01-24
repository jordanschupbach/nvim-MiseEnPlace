
local u = require 'utilities'

local dmodestring = u.lines_from('/home/jordan/.scripts/.mode')[1]

local darkmode = false
if dmodestring == 'dark' then
  darkmode = true
else
  darkmode = false
end

return {
  darkmode = darkmode,
}
