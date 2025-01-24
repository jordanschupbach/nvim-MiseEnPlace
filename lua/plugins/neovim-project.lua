local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(
  function()
    add({
      source = "Shatur/neovim-session-manager",
    })
    require('session_manager').setup{}
  end
)

now(function()
  add({
    source = "coffebar/neovim-project",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      -- optional picker
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      -- optional picker
      { "ibhagwan/fzf-lua" },
      { "Shatur/neovim-session-manager" },
    },
  })
  -- enable saving the state of plugins in the session
  -- save global variables that start with an uppercase letter and contain
  -- at least one lowercase letter.
  -- vim.opt.sessionoptions:append("globals")
  -- setup neovim-project plugin
  require("neovim-project").setup {
    dashboard_mode = true,
    last_session_on_startup = false,
    -- define project roots
    projects = {
      "~/projects/*",
      "~/presentations/*",
      "~/.config/*",
    },
    picker = {
      type = "telescope", -- or "fzf-lua"
    }
  }
end
)
