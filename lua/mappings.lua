-- This file is to set custom mappings

local function mymap(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end

-- {{{ Buffer bindings

mymap('n', '<Space>bb', '<CMD>Telescope buffers<CR>')
mymap('n', '/',  ':Telescope current_buffer_fuzzy_find theme=ivy<CR>')

-- }}} Buffer bindings

-- {{{ File bindings

mymap('n', '<Space>ff', '<CMD>Neotree toggle<CR>')

-- }}} File bindings

-- {{{ Lsp bindings

mymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
mymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
mymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>')
mymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')

-- }}} Lsp bindings

-- {{{ Project bindings

mymap('n', '<Space>pf', '<CMD>Telescope find_files<CR>')
mymap('n', '<Space>pr', '<CMD>Telescope live_grep<CR>')

-- }}}

-- {{{ Window bindings

-- Window right
mymap('n', '<A-l>', '<CMD>wincmd l<CR>')
mymap('t', '<A-l>', '<CMD>wincmd l<CR>')
mymap('n', '<A-S-l>', "<CMD>lua require('smart-splits').resize_right()<CR>")
mymap('t', '<A-S-l>', "<CMD>lua require('smart-splits').resize_right()<CR>")

-- Window left
mymap('n', '<A-h>', '<CMD>wincmd h<CR>')
mymap('t', '<A-h>', '<CMD>wincmd h<CR>')
mymap('n', '<A-S-h>', "<CMD>lua require('smart-splits').resize_left()<CR>")
mymap('t', '<A-S-h>', "<CMD>lua require('smart-splits').resize_left()<CR>")

-- Window down
mymap('n', '<A-j>', '<CMD>wincmd j<CR>')
mymap('t', '<A-j>', '<CMD>wincmd j<CR>')
mymap('n', '<A-S-j>', "<CMD>lua require('smart-splits').resize_down()<CR>")
mymap('t', '<A-S-j>', "<CMD>lua require('smart-splits').resize_down()<CR>")

-- Window up
mymap('n', '<A-k>', '<CMD>wincmd k<CR>')
mymap('t', '<A-k>', '<CMD>wincmd k<CR>')
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

