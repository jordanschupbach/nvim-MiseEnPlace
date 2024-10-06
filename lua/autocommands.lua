
-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", "*.c", [[setfiletype c]])
-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", "*.h", [[setfiletype c]])


vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.c", "*.h"},
  callback = function(_)
    vim.cmd('setfiletype c')
  end
})


vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.cpp", "*.hpp", "*.hxx", "*.cxx"},
  callback = function(_)
    vim.cmd('setfiletype cpp')
  end
})



-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", "*.cpp", [[setfiletype cpp]])
-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", "*.hpp", [[setfiletype cpp]])

