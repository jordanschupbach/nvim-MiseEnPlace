-- https://github.com/nvim-telescope/telescope.nvim

return {
  'nvim-telescope/telescope.nvim',

  -- {{{ dependencies
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'fhill2/telescope-ultisnips.nvim',
    'sopa0/telescope-makefile',
    'nvim-telescope/telescope-project.nvim',
  },
  -- }}} dependencies

  -- {{{ config

  config = function()


    -- local utilities = require 'utilities'
    local actions = require 'telescope.actions'
    -- local finders = require 'telescope.finders'
    -- local pickers = require 'telescope.pickers'
    local actions_state = require 'telescope.actions.state'

    function fileExists(filename)
      local file = io.open(filename, 'r')
      if file then
        io.close(file)
        return true
      else
        return false
      end
    end

    local function on_project_selected(prompt_bufnr)
      local entry = actions_state.get_selected_entry()
      -- vim.cmd("echo '" .. utilities.dump(entry) .. "'")
      -- vim.cmd("echo '" .. tostring(entry) .. "'")
      actions.close(prompt_bufnr)
      -- vim.cmd("echo '" .. entry['value'] .. " helloz worldz'")
      -- -- Open the readme.md file in the root directory

      if fileExists('' .. entry['value'] .. '/README.org') then
        vim.cmd('edit ' .. entry['value'] .. '/README.org')
      else
        -- TODO: expand to other cases
        vim.cmd('edit ' .. entry['value'] .. '/README.md')
      end

      -- vim.cmd('edit ' .. entry['value'] .. '/README.md')

      -- Toggle the NvimTree buffer
      vim.cmd 'split'
      vim.cmd 'terminal'
      vim.cmd 'Neotree toggle'
      -- vim.cmd 'SidebarNvimToggle'
      vim.cmd 'wincmd l'
    end






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
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },

        project = {
          -- base_dirs = {
          --   '~/dev/data_munge',
          -- },
          hidden_files = true, -- default: false
          theme = 'dropdown',
          order_by = 'asc',
          search_by = 'title',
          sync_with_nvim_tree = true, -- default false
          -- default for on_project_selected = find project files
          on_project_selected = function(prompt_bufnr)
            on_project_selected(prompt_bufnr)
          end,
          -- function(prompt_bufnr)
          --   local cmd = "echo 'hello world, my prompt_bufnr is " .. tostring(prompt_bufnr) .. "'"
          --   vim.api.nvim_command(cmd)
          --   -- actions.change_working_directory(prompt_bufnr, false)
          --   require('harpoon.ui').nav_file(1)
          -- end,
        },

      },
    }

    require'telescope'.load_extension('make')
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ultisnips')
  end,

  -- }}} config

}
