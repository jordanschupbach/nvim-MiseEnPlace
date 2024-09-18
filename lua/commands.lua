-- Various useful commands

vim.cmd([[command! OpenConfig lua require'mep'.open_init_file()]])
vim.cmd([[command! DarkMode lua require'mep'.dark_mode()]])
vim.cmd([[command! LightMode lua require'mep'.light_mode()]])
