local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- {{{ Plenary
now(function()
  add({
      source = 'nvim-lua/plenary.nvim',
  })
end)
-- }}} Plenary
