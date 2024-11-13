-- Everything is in place....

require("lazybootstrap-pre")
require("opts")
require("lazybootstrap-post")
require("mappings")
require("commands")
require("autocommands")


-- require("mep").

-- vim.cmd('DarkMode')

vim.api.nvim_win_set_option(0, 'winhighlight', 'Normal:NormalNC,WinSeparator:GraySeparator')
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'orange', bold = false })
