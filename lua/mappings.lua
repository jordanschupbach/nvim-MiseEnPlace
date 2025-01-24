-- This file is to set custom mappings

local function mymap(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end


vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require('menu.utils').delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})


mymap('n', '<Space>hh', '<CMD>Telescope help_tags<CR>')
mymap('n', '<Space>ht', '<CMD>Tutor<CR>')



-- {{{ Flash mappings

mymap('n', 's', '<CMD>lua require("flash").jump()<CR>')
mymap('n', 'S', '<CMD>lua require("flash").treesitter()<CR>')
-- mymap('n', 'r', '<CMD>lua require("flash").treesitter()<CR>')

  -- taken from:
  -- keys = {
  --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  -- },

  -- }}} Flash Mappings

-- {{{ To File


mymap('n', '<Space>lR', '<CMD>LspRestart<CR>')





-- }}} To File

-- {{{  Standard (main) mappings

mymap('n', '<Space>zz', '<CMD>ZenMode<CR>')
mymap('n', '<A-Tab>', '<CMD>bn<CR>')
mymap('n', '<A-S-Tab>', '<CMD>bp<CR>')
mymap('n', '<A-x>', '<CMD>Telescope commands<CR>')
mymap('n', '<Space>oc', '<CMD>OpenConfig<CR>')
mymap('n', '<Space><Space>', '<CMD>Telescope make<CR>')
mymap('n', '<Space>ll', '<CMD>AerialToggle<CR>')
mymap('n', '<Space>pp', '<CMD> lua require"telescope".extensions.projects.projects{} <CR>')
mymap('n', '<Space>po', '<CMD> lua require"telescope".extensions.projects.projects{} <CR>')
mymap('n', '<Space>gg', '<CMD>Neogit kind=floating<CR>')
mymap('n', '<Space>ee', '<CMD>Trouble diagnostics toggle focus=false filter.buf=0<CR>')
mymap('n', '<Space>en', '<CMD>Lspsaga diagnostic_jump_next<CR>')
mymap('n', '<Space>ep', '<CMD>Lspsaga diagnostic_jump_prev<CR>')
mymap('n', ']e', '<CMD>Lspsaga diagnostic_jump_next<CR>')
mymap('n', '[e', '<CMD>Lspsaga diagnostic_jump_prev<CR>')
mymap('n', '<Space>ca', '<CMD>Lspsaga code_action<CR>')
mymap('n', '<Space>ts', '<CMD>Telescope symbols<CR>')

-- }}}  Standard mappings

-- {{{ Text case bindings


mymap('n', 'gau', "<CMD>lua require('textcase').current_word('to_upper_case')<CR>")
mymap('n', 'gal', "<CMD>lua require('textcase').current_word('to_lower_case')<CR>")
mymap('n', 'gas', "<CMD>lua require('textcase').current_word('to_snake_case')<CR>")
mymap('n', 'gad', "<CMD>lua require('textcase').current_word('to_dash_case')<CR>")
mymap('n', 'gan', "<CMD>lua require('textcase').current_word('to_constant_case')<CR>")
mymap('n', 'gan', "<CMD>lua require('textcase').current_word('to_constant_case')<CR>")
mymap('n', 'gat', "<CMD>lua require('textcase').current_word('to_title_case')<CR>")
mymap('n', 'gaf', "<CMD>lua require('textcase').current_word('to_path_case')<CR>")
mymap('n', 'gac', "<CMD>lua require('textcase').current_word('to_camel_case')<CR>")
mymap('n', 'ga,', "<CMD>lua require('textcase').current_word('to_comma_case')<CR>")
mymap('n', 'gap', "<CMD>lua require('textcase').current_word('to_pascal_case')<CR>")

-- nnoremap gad :lua require('textcase').current_word('to_dot_case')<CR>
-- nnoremap ga, :lua require('textcase').current_word('to_comma_case')<CR>
-- nnoremap gaa :lua require('textcase').current_word('to_phrase_case')<CR>
-- nnoremap gac :lua require('textcase').current_word('to_camel_case')<CR>
-- nnoremap gap :lua require('textcase').current_word('to_pascal_case')<CR>
-- nnoremap gat :lua require('textcase').current_word('to_title_case')<CR>
-- nnoremap gaf :lua require('textcase').current_word('to_path_case')<CR>

-- nnoremap gaU :lua require('textcase').lsp_rename('to_upper_case')<CR>
-- nnoremap gaL :lua require('textcase').lsp_rename('to_lower_case')<CR>
-- nnoremap gaS :lua require('textcase').lsp_rename('to_snake_case')<CR>
-- nnremap gaD :lua require('textcase').lsp_rename('to_dash_case')<CR>
-- nnoremap gaN :lua require('textcase').lsp_rename('to_constant_case')<CR>
-- nnoremap gaD :lua require('textcase').lsp_rename('to_dot_case')<CR>
-- nnoremap ga, :lua require('textcase').lsp_rename('to_comma_case')<CR>
-- nnoremap gaA :lua require('textcase').lsp_rename('to_phrase_case')<CR>
-- nnoremap gaC :lua require('textcase').lsp_rename('to_camel_case')<CR>
-- nnoremap gaP :lua require('textcase').lsp_rename('to_pascal_case')<CR>
-- nnoremap gaT :lua require('textcase').lsp_rename('to_title_case')<CR>
-- nnoremap gaF :lua require('textcase').lsp_rename('to_path_case')<CR>

-- nnoremap geu :lua require('textcase').operator('to_upper_case')<CR>
-- nnoremap gel :lua require('textcase').operator('to_lower_case')<CR>
-- nnoremap ges :lua require('textcase').operator('to_snake_case')<CR>
-- nnoremap ged :lua require('textcase').operator('to_dash_case')<CR>
-- nnoremap gen :lua require('textcase').operator('to_constant_case')<CR>
-- nnoremap ged :lua require('textcase').operator('to_dot_case')<CR>
-- nnoremap ge, :lua require('textcase').operator('to_comma_case')<CR>
-- nnoremap gea :lua require('textcase').operator('to_phrase_case')<CR>
-- nnoremap gec :lua require('textcase').operator('to_camel_case')<CR>
-- nnoremap gep :lua require('textcase').operator('to_pascal_case')<CR>
-- nnoremap get :lua require('textcase').operator('to_title_case')<CR>
-- nnoremap gef :lua require('textcase').operator('to_path_case')<CR>


-- }}} Text case bindings

-- {{{ Buffer bindings

mymap('n', '<Space>bb', '<CMD>Telescope buffers<CR>')
mymap('n', '<Space>bd', '<CMD>DeleteBuffer<CR>')
mymap('n', '<Space>bn', '<CMD>bn<CR>')
mymap('n', '<Space>bp', '<CMD>bp<CR>')
mymap('n', '/',  ':Telescope current_buffer_fuzzy_find theme=ivy<CR>')

mymap('n', '<Space>bi', '<CMD>lua require"mep".print_buffer_info()<CR>')

-- }}} Buffer bindings

-- {{{ File bindings

mymap('n', '<Space>ff', '<CMD>Neotree toggle<CR>')

-- }}} File bindings

-- {{{ Lsp bindings

mymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
mymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
mymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>')
mymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
mymap('n', 'I', '<CMD>Lspsaga show_line_diagnostics<CR>')
mymap('n', 'gk', '<CMD>Lspsaga hover_doc<CR>')
mymap('n', '<Space>lc', '<CMD>Lspsaga code_action<CR>')

-- }}} Lsp bindings

-- {{{ Dap bindings

mymap('n', '<Space>dd', '<CMD>DapContinue<CR>')
mymap('n', '<Space>du', '<CMD>lua require("dapui").toggle() <CR>')
mymap('n', '<Space>db', '<CMD>DapToggleBreakpoint<CR>')
mymap('n', '<Space>dc', '<CMD>DapContinue<CR>')
mymap('n', '<Space>dn', '<CMD>DapStepOver<CR>')
mymap('n', '<Space>di', '<CMD>DapStepInto<CR>')
mymap('n', '<Space>do', '<CMD>DapStepOut<CR>')
mymap('n', '<Space>de', '<CMD>lua require("dapui").eval()<CR>')

-- }}} Dap bindings

-- {{{ Project bindings


mymap('n', '<Space>pf', '<CMD>Telescope find_files<CR>')
mymap('n', '<Space>pr', '<CMD>Telescope live_grep<CR>')
mymap('n', '<Space>pd', '<CMD>NeovimProjectDiscover<CR>')

-- }}}

-- {{{ Window bindings

-- Window right
mymap('n', '<A-l>', '<CMD>wincmd l<CR>')
mymap('t', '<A-l>', '<CMD>wincmd l<CR>')
mymap('n', '<Space>wl', '<CMD>wincmd l<CR>')
mymap('t', '<Space>wl', '<CMD>wincmd l<CR>')
mymap('n', '<A-S-l>', "<CMD>lua require('smart-splits').resize_right()<CR>")
mymap('t', '<A-S-l>', "<CMD>lua require('smart-splits').resize_right()<CR>")

-- Window left
mymap('n', '<A-h>', '<CMD>wincmd h<CR>')
mymap('t', '<A-h>', '<CMD>wincmd h<CR>')
mymap('n', '<Space>wh', '<CMD>wincmd h<CR>')
mymap('t', '<Space>wh', '<CMD>wincmd h<CR>')
mymap('n', '<A-S-h>', "<CMD>lua require('smart-splits').resize_left()<CR>")
mymap('t', '<A-S-h>', "<CMD>lua require('smart-splits').resize_left()<CR>")

-- Window down
mymap('n', '<A-j>', '<CMD>wincmd j<CR>')
mymap('t', '<A-j>', '<CMD>wincmd j<CR>')
mymap('n', '<Space>wj', '<CMD>wincmd j<CR>')
mymap('t', '<Space>wj', '<CMD>wincmd j<CR>')
mymap('n', '<A-S-j>', "<CMD>lua require('smart-splits').resize_down()<CR>")
mymap('t', '<A-S-j>', "<CMD>lua require('smart-splits').resize_down()<CR>")

-- Window up
mymap('n', '<A-k>', '<CMD>wincmd k<CR>')
mymap('t', '<A-k>', '<CMD>wincmd k<CR>')
mymap('n', '<Space>wk', '<CMD>wincmd k<CR>')
mymap('t', '<Space>wk', '<CMD>wincmd k<CR>')

mymap('n', '<A-S-k>', "<CMD>lua require('smart-splits').resize_up()<CR>")
mymap('t', '<A-S-k>', "<CMD>lua require('smart-splits').resize_up()<CR>")


-- Split pane horizontal
mymap('n', '<A-s>', '<CMD>split<CR>')
mymap('t', '<A-s>', '<CMD>split<CR>')

-- Split pane vertical
mymap('n', '<A-v>', '<CMD>vsplit<CR>')
mymap('t', '<A-v>', '<CMD>vsplit<CR>')


-- Delete pane
mymap('n', '<A-d>', '<CMD>close<CR>')
mymap('t', '<A-d>', '<CMD>close<CR>')

-- Project Shell
mymap('n', '<Space>ps', '<CMD>sp<CR> <CMD>wincmd j<CR> <CMD>terminal<CR> a')
mymap('t', '<Space>ps', '<CMD>sp<CR> <CMD>wincmd j<CR> <CMD>terminal<CR> a')

-- }}} Window bindings

-- {{{ Snippets bindings

mymap('n', '<Space>yy', '<CMD>Telescope ultisnips<CR>')

-- }}} Snippets bindings

-- {{{ Tab bindings

mymap('n', '<C-t>', '<CMD>tabnew<CR>')
-- NOTE: these dont work?
-- mymap('n', '<C-Tab>', '<CMD>tabnext<CR>')
-- mymap('n', '<C-S-Tab>', '<CMD>tabprevious<CR>')
mymap('n', '<A-1>', ':tabn1<CR>')
mymap('n', '<A-2>', ':tabn2<CR>')
mymap('n', '<A-3>', ':tabn3<CR>')
mymap('n', '<A-4>', ':tabn4<CR>')
mymap('n', '<A-5>', ':tabn5<CR>')
mymap('n', '<A-6>', ':tabn6<CR>')
mymap('n', '<A-7>', ':tabn7<CR>')
mymap('n', '<A-8>', ':tabn8<CR>')
mymap('n', '<A-9>', ':tabn9<CR>')

-- }}} Tab bindings

-- {{{ NVIM bindings


vim.api.nvim_create_user_command('ReloadFTPlugins', 'execute "source" glob($MYVIMRC .. "ftplugin/*.vim")', {})

mymap('n', '<Space>qq', '<CMD>wa<CR><CMD>qa!<CR>')
-- vim.api.nvim_create_user_command('ReloadConfig', 'luafile $MYVIMRC', {})
mymap('n', '<Space>rr', '<CMD>luafile $MYVIMRC<CR><CMD>ReloadFTPlugins<CR><CMD>echo "Reloaded config"<CR>')

-- }}} NVIM bindings

-- {{{ Telescope

mymap('n', '<Space>ts', '<CMD>Telescope symbols<CR>')
mymap('n', '<Space>tgc', '<CMD>Telescope git_commits<CR>')
mymap('n', '<Space>tu', '<CMD>Telescope ultisnips<CR>')

-- }}} Telescope
