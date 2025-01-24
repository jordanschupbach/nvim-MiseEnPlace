-- plugins

-- -- Prototype
-- local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
-- now(function()
--   add({
--     source = 'mfussenegger/nvim-jdtls',
--   })
-- end)

-- {{{ Completion

require("plugins.plenary")
require("plugins.nvim-cmp")

-- }}} Completion

-- {{{ Lsp

require("plugins.mason")
require("plugins.lsp-config")
require("plugins.mason-lspconfig")

-- require("plugins.luvit-meta")
-- require("plugins.lazydev")

-- }}} Lsp

-- {{{ Debugging

require("plugins.nvim-jdtls")
require("plugins.nvim-dap")
require("plugins.nvim-nio")
require("plugins.nvim-dap-ui")
require("plugins.nvim-dap-lldb")
require("plugins.nvim-dap-python")

-- }}} Debugging

-- {{{ Menu and Related

require("plugins.volt")

require("plugins.menu")

-- }}} Menu and Related

-- {{{ Telescope and related

require("plugins.toggleterm")
require("plugins.telescope-makefile")
require("plugins.telescope")

-- }}} Telescope and related

-- {{{ Standard Others

require("plugins.aerial")
require("plugins.awesome-vim-colorschemes")
require("plugins.catpuccin")
require("plugins.colorful-winsep")
require("plugins.copilot-vim")
require("plugins.dashboard")
require("plugins.flash")
require("plugins.gitsigns")
require("plugins.lspsaga")
require("plugins.neogit")
require("plugins.neorepl")
require("plugins.neotree")
require("plugins.nui")
require("plugins.nvim-highlight-colors")
require("plugins.oil")
require("plugins.other")
require("plugins.project")
require("plugins.smart-splits")
require("plugins.stickybuf")
require("plugins.text-case")
require("plugins.treesitter")
require("plugins.trouble")
require("plugins.ultisnips")
require("plugins.venv-selector")
require("plugins.vim-slime")
require("plugins.which-key")
require("plugins.zen-mode")

-- }}} Standard Others

-- {{{ Unused plugins

-- require("plugins.orgmode")
-- require("plugins.neovim-project")
-- require("plugins.nebulous")
-- require("plugins.snacks")

-- }}} Unused plugins
