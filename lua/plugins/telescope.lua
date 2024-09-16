-- https://github.com/nvim-telescope/telescope.nvim

return {
  'nvim-telescope/telescope.nvim',

  -- {{{ dependencies
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'fhill2/telescope-ultisnips.nvim',
  },
  -- }}} dependencies

  -- {{{ config

  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = { ['<C-d>'] = require('telescope.actions').delete_buffer },
          n = { ['<C-d>'] = require('telescope.actions').delete_buffer },
        },
      },
      prompt_prefix = ' ',
      selection_caret = '* ',
      path_display = { 'smart' },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--no-ignore',
        '--hidden',
      },

      extensions = {

        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, 
          override_file_sorter = true,
          case_mode = 'smart_case',
        },

      },
    }
    --  require('telescope').setup {}
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ultisnips')
    -- pcall(require('telescope').load_extension, 'symbols')
  end,

  -- }}} config

}
