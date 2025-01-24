-- https://github.com/nvim-orgmode/orgmode

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
now(function()
  add({
    source = 'nvim-orgmode/orgmode',
  })
  require('orgmode').setup({
    org_agenda_files = '~/orgfiles/**/*',
    org_default_notes_file = '~/orgfiles/refile.org',
  })
end)

-- require('pckr').add{
--   'nvim-orgmode/orgmode',
--   event = 'VeryLazy',
--   ft = { 'org' },
--   config = function()
--     -- Setup orgmode
--     require('orgmode').setup({
--       org_agenda_files = '~/orgfiles/**/*',
--       org_default_notes_file = '~/orgfiles/refile.org',
--     })
--
--     -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
--     -- add ~org~ to ignore_install
--     -- require('nvim-treesitter.configs').setup({
--     --   ensure_installed = 'all',
--     --   ignore_install = { 'org' },
--     -- })
--   end,
-- }
