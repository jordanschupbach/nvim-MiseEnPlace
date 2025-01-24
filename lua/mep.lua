-- Some user-defined lua functions
-- Maybe I'll separate this out when it gets large enough

local mep = {}

mep.bootstrap_mini = function()
  -- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
  local path_package = vim.fn.stdpath('data') .. '/site/'
  local mini_path = path_package .. 'pack/deps/start/mini.nvim'
  if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
  end
  require('mini.deps').setup({ path = { package = path_package } })
  local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
  now(function()
    vim.o.termguicolors = true
    -- vim.cmd('colorscheme randomhue')
  end)
end

mep.load_plugin = function(path)
  require(path)
end

mep.load_plugins = function()
	-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
	-- startup and are optional.
	local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
  now(function()
    require('mini.notify').setup()
    vim.notify = require('mini.notify').make_notify()
  end)
  now(function() require('mini.icons').setup() end)
  -- now(function() require('mini.tabline').setup() end)
  -- now(function() require('mini.statusline').setup() end)
  -- later(function() require('mini.ai').setup() end)
  later(function() require('mini.comment').setup() end)
  later(function() require('mini.pick').setup() end)
  later(function() require('mini.surround').setup() end)

  require("plugins")
end

mep.paq_unix_cmd = function()
  return 'git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim"'
end


mep.call_paq = function()
  -- local status = os.execute(mep.paq_unix_cmd())
  local paq = require('paq')
  -- local ok, paq = pcall(require, 'paq')
  -- if not ok then
  --   local status = os.execute(mep.paq_unix_cmd())
  --   if not status then
  --     -- handle failure here
  --   end
  -- end
  paq({
    'savq/paq-nvim',
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/aerial',
    'nvim-telescope/project',
    'nvim-telescope/project',
  })
end

-- {{{ Plugin utils

mep.safe_require = function(module)
  local ok, result = pcall(require, module)
  if not ok then
    print("Error loading module: " .. module)
    print(result)
  end
  return result
end


-- Function to bootstrap pckr
function mep.bootstrap_lazy()
  -- Bootstrap lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)
end



-- Function to bootstrap pckr
function mep.bootstrap_packer()
local result = os.execute(command)

end


-- Function to bootstrap pckr
function mep.bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"
  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end
  vim.opt.rtp:prepend(pckr_path)
end

-- }}} Plugin utils

-- {{{ Startup loaders

function mep.load_options()
  mep.safe_require("opts")
end

function mep.load_mappings()
  mep.safe_require("mappings")
end

function mep.load_commands()
  mep.safe_require("commands")
end

function mep.load_autocommands()
  mep.safe_require("autocommands")
end

-- function mep.load_plugins()
--   mep.safe_require("plugins")
-- end

function mep.lazy_pre()
  -- Bootstrap lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)
end


function mep.lazy()
  -- Setup lazy.nvim
  require("lazy").setup({
    spec = {
      { 'stevearc/aerial.nvim',
  config = function()
    -- Call the setup function to change the default behavior
    require('aerial').setup { }
  end,
},

      'nvim-telescope/telescope.nvim',
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
  })
end


-- Main (entrypoint) function to load config
function mep.load_config()
  mep.load_options()
  mep.load_mappings()
  mep.load_commands()
  mep.load_autocommands()
  mep.bootstrap_mini()
  mep.load_plugins()
  -- local MiniDeps = require("mini")
  -- local add = MiniDeps.add
  -- -- Add to current session (install if absent)
  -- add(return('plugins.aerial'))
end

function mep.print_buffer_info()
    local buf_info = {}
    local buf_number = vim.api.nvim_get_current_buf()
    local file_name = vim.fn.expand('%')
    local file_type = vim.bo.filetype
    local modified = vim.bo.modified
    local readonly = vim.bo.readonly
    local last_modified_time = vim.fn.getftime(file_name)
    local line_count = vim.api.nvim_buf_line_count(buf_number)
    local current_line_number = vim.fn.line('.')
    local total_buffers = #vim.api.nvim_list_bufs()

    -- Populate the buffer information table
    table.insert(buf_info, { "Buffer Number: " .. buf_number })
    table.insert(buf_info, { "File Name: " .. file_name })
    table.insert(buf_info, { "File Type: " .. file_type })
    table.insert(buf_info, { "Modified: " .. tostring(modified) })
    table.insert(buf_info, { "ReadOnly: " .. tostring(readonly) })
    table.insert(buf_info, { "Last Modified Time: " .. last_modified_time })
    table.insert(buf_info, { "Line Count: " .. line_count })
    table.insert(buf_info, { "Current Line Number: " .. current_line_number })
    table.insert(buf_info, { "Total Buffers: " .. total_buffers })

    -- Check if the buffer is a terminal type
    if vim.bo.buftype == 'terminal' then
        local job_id = vim.fn.jobid(buf_number)  -- Get job ID for terminal buffer
        table.insert(buf_info, { "Job ID: " .. (job_id ~= -1 and job_id or "None") })
    end

    -- Print the buffered info to message buffer
    for _, info in ipairs(buf_info) do
        print(info[1])
    end
end

-- }}} Startup loaders


--- Dumps a table to a string
--- @param o table to dump
--- @return string representation of the table
---
--- Example:
---
--- mep.dump({"Hello", "World"})
---
function mep.dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. mep.dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end


-- {{{ UI utils

-- mep.dark_mode = function()
--   vim.cmd("colorscheme habamax")
-- end
-- 
-- mep.light_mode = function()
--   vim.cmd("colorscheme zellner")
-- end


mep.light_mode = function()
  vim.cmd("colorscheme catppuccin-latte")
  -- local highlights = require 'themes.light'
  -- for hl, spec in pairs(highlights) do
  --   vim.api.nvim_set_hl(0, hl, spec)
  -- end

end

mep.dark_mode = function ()
  vim.cmd("colorscheme catppuccin")
  -- local highlights = require 'themes.dark'
  -- for hl, spec in pairs(highlights) do
  --   vim.api.nvim_set_hl(0, hl, spec)
  -- end
end


-- }}} UI utils

-- {{{ Mapping utils
mep.mymap = function(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true, remap = true })
end
-- }}} Mapping utils

-- {{{ Window utils

--- Delete the current buffer while preserving the window
function mep.delete_buffer_and_preserve_window()
    local current_buf = vim.api.nvim_get_current_buf()
    vim.cmd('bnext')
    vim.cmd('bdelete! ' .. current_buf)
end

--- Window below the current one predicate
mep.win_below_p = function()
  if vim.fn.winnr('j') ~= -1 then
	  return false
  else
	  return true
  end
end

--- Window above the current one predicate
mep.win_above_p = function()
  if vim.fn.winnr('k') ~= -1 then
	  return false
  else
	  return true
  end
end

--- Window to the left of the current one predicate
mep.win_left_p = function()
  if vim.fn.winnr('h') ~= -1 then
	  return false
  else
	  return true
  end
end

--- Window to the right of the current one predicate
mep.win_right_p = function()
  if vim.fn.winnr('h') ~= -1 then
	  return false
  else
	  return true
  end
end

-- }}} Window mep

-- {{{ Project mep

--- Find the project directory
-- Searches recursively upward for .git/ folder
mep.find_project_dir = function()
    local path = vim.fn.expand("%:p:h")
    while path ~= "/" do
        local gitdir = path .. "/.git/"
        if vim.fn.isdirectory(gitdir) == 1 then
            return path
        end
        path = vim.fn.fnamemodify(path, ":h")
    end
    return vim.fn.expand("%:p:h")
end

-- }}} Project mep

-- {{{ Command mep

--- Opens init.lua for nvim config
mep.open_init_file = function()
    vim.cmd('e ~/.config/nvim-MiseEnPlace/README.md')
    local project_dir = require'mep'.find_project_dir()
    vim.cmd('cd ' .. project_dir)
    vim.cmd('split')
    vim.cmd('terminal')
    vim.cmd('lua require("smart-splits").resize_down()')
    vim.cmd('lua require("smart-splits").resize_down()')
    vim.cmd('wincmd k')
    vim.cmd('Neotree toggle')
    vim.cmd('lua require("smart-splits").resize_left()')
    vim.cmd('lua require("smart-splits").resize_left()')
    vim.cmd('lua require("smart-splits").resize_left()')
    vim.cmd('lua require("smart-splits").resize_left()')
    vim.cmd('lua require("smart-splits").resize_left()')
    vim.cmd('lua require("smart-splits").resize_left()')
    vim.cmd('wincmd l')
end
-- }}} Command mep

-- {{{ repl mep

--- Open neorepl
-- opens the neorepl in a new split
mep.open_neorepl = function()
  vim.cmd 'split'
  local buf = vim.api.nvim_get_current_buf()
  require('neorepl').new { lang = 'lua', buffer = buf }
  vim.cmd 'resize 10 | setl winfixheight'
  buf = vim.api.nvim_get_current_buf()
  SendTo_Bufnr = buf
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>k', true, false, true), 'm', true)
end

--- Registers the sendto buffer
--(defaults to current buffer)
mep.register_sendto_buffer = function()
  local current_bufnr = vim.fn.bufnr '%'
  current_bufnr = vim.fn.input('SendTo bufnr: ', current_bufnr)
  SendTo_Bufnr = current_bufnr
end

--- Sends current line to SendTo buffer
-- @see register_sendto_buffer, send_lines_to_buffer
mep.send_line_to_buffer = function()
  local current_line = vim.api.nvim_get_current_line()
  -- local original_bufnr = vim.fn.bufnr '%'
  local target_bufnr = SendTo_Bufnr
  local win_id = vim.fn.bufwinid(target_bufnr)
  if win_id ~= -1 then
    vim.api.nvim_set_current_win(win_id)
  else -- todo handle case not on screen
    return
  end
  vim.api.nvim_feedkeys('G', 'm', true)
  vim.api.nvim_feedkeys('i', 'm', true)
  vim.api.nvim_feedkeys(current_line, 'm', true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 'm', true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'm', true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>k', true, false, true), 'm', true)
end

--- Gets the text in the visual selection
-- @return a text string of the current visual selection
mep.get_visual_selection = function()
  local s_start = vim.fn.getpos "'<"
  local s_end = vim.fn.getpos "'>"
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

--- Gets the text in the visual selection
-- @return a table of lines of current visual selection
mep.get_visual_selection_lines = function()
  local s_start = vim.fn.getpos "'<"
  local s_end = vim.fn.getpos "'>"
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  -- return table.concat(lines, '\n')
  return lines
end

--- Sends visual selection to SendTo buffer
-- @see register_sendto_buffer, send_line_to_buffer
mep.send_lines_to_buffer = function()
  local current_lines = require('mep').get_visual_selection_lines()
  -- local original_bufnr = vim.fn.bufnr '%'
  local target_bufnr = SendTo_Bufnr
  local win_id = vim.fn.bufwinid(target_bufnr)
  if win_id ~= -1 then
    vim.api.nvim_set_current_win(win_id)
  else -- todo handle case not on screen
    return
  end
  vim.api.nvim_feedkeys('G', 'm', true)
  vim.api.nvim_feedkeys('i', 'm', true)
  for _, line in ipairs(current_lines) do
    vim.api.nvim_feedkeys(line, 'm', true)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 'm', true)
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'm', true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>k', true, false, true), 'm', true)
end

-- }}} repl mep

-- {{{ Misc

mep.print_hello = function()
  print("hello world")
end

-- }}} Misc

return mep
