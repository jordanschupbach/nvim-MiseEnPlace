-- Setup lazy.nvim
require("lazy").setup({
  spec = { { import = "plugins" }, },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
