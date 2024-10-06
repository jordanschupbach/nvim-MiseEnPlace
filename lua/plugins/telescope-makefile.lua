-- https://github.com/sopa0/telescope-makefile
return {
  'sopa0/telescope-makefile',
  config = function()
  require'telescope-makefile'.setup{
    -- The path where to search the makefile in the priority order
    makefile_priority = { '.', 'build/' },
    default_target = nil, -- nil or string : Name of the default target | nil will disable the default_target
    make_bin = "make", -- Custom makefile binary path, uses system make by def
  }
end
}
