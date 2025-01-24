-- https://github.com/nvimdev/dashboard-nvim

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

local bannerstring = {
  '          o           o      o                                                  ',
  '        o$"""$$ooo""""" " oo$$$$o                                               ',
  '       "$$$$$$$$$ o$"$""""$o$$$$$                                               ',
  '       "$$$oo   o$$        "$o                                                  ',
  '         ""$$oo              " o                                                ',
  '          o$"" $              o$$                                               ',
  '          $o$o$o"    $o  o$     $                                               ',
  '         o""""""     "  o $   o$$o                                              ',
  '       """          o"" " "$oo""$                                               ',
  '      "$"          o$ o$$$$o$$  ""oo                                            ',
  '       """          $$$$$$$$$"   "o                                             ',
  '       oo"           """$$$"     "o                                             ',
  '          "" o                $ o"                                              ',
  '            " "       " "   o$"                                                 ',
  '            o     ""oooooo                                                      ',
  '           $$oooo                                                               ',
  '          "$"""$o        o                                                      ',
  '          $oo$$$o       "                                                       ',
  '         o$$$""$         "o                                                     ',
  '         "$  oo$o         "                                                     ',
  '         $$$$$$$"        o$o                                                    ',
  '         $$    $o        o"$                                                    ',
  '         $oo$$""$"        $$"                                                   ',
  '        o$$     $         "$$                              oo                   ',
  '        o$$ooo$$$$       $o$$                           oo$$$$$                 ',
  '        "$$"""""$         oo$o                       o""$$""""$$o ooo$$$oo      ',
  '        "$oooooo$"        """$                      $$"""""$$o  $o""$$$$$$o     ',
  '        "$$""" "o$         $o$                    o"        "$o ""     o$$$     ',
  '        ""$oooo$$"        "" $                   $           ""  oo$o$$$$""     ',
  '        "oo$"   o"         $$$"                 o"             o$""" ""$        ',
  '       o$""$"$$"$"         $ $o                 oo $$  $o       o$$$$o$$$       ',
  '      $          $          $$o               "$o oo$o ""      """""  "$"       ',
  '      $$o        $          $ $               "$"""""$$o               " "o     ',
  '      o"""       $          $o"               $"$$$$$$$$                 "      ',
  '      $          $          $                  $$$$$$$"                oo$o     ',
  '      ""$$$     $$          $$                  "$$""oo               o o       ',
  '        $"$o  o$$"o         $o                      "      o      oo""o         ',
  'ooo     o$$$$$$oo$$         $$o                      """$""     "ooo            ',
  '$ "$     $  """"" $o       $o$o                        $$o     $"" $o           ',
  '   $     $oo ooo$$$""o    o$"$                         $$     "$$$$$$           ',
  'o$$"     o$oo o  o oo$" $"" o"                        $$$     "o$ oo$           ',
  '$" $     o$"""$$$$$$"  o oo$$$                        "$$      $$"oo$"oo        ',
  '$o$$     $$"$$ooooooo$$"""  o$ooooo                   $$        $""  o$         ',
  '$ o$    o"$oo$$ "" "oo$"o"$""      "o                 "$o       $   oo$         ',
  ' " $   o$ooo"" """""""$$o$oo      o $"                  $o    $$o$$$"o          ',
  '$$"o$o$$ o"                 "$    "o$               ooo"$$$$$$$$ooo$$"o         ',
  ' $o$o "$o$                 " $$ooo$$$$$"o $      oo$     o$""""$ooo$"$"$$$o"o   ',
  '$$$$$$$$$$$              o  $o"" "   "         """"$o$  "$o oo      o$$$$$oo $$o',
  '  " o      ""$ooooooooo"o"""                          """"""$$oooooo$$$$$$ $""  ',
}

local bannertext = {
  '',
  '',
  '',
  '              :Wu                             uueeeou        .uodWWb            ',
  '       uu.    \'$"N.   s.                   .o$$$$$$$$$u.uuuo@$$$**#"           ',
  '      4$F#Nu.  $ ^*u  \'$                  s$$$$$*$$N$$$$$*#""7$uuedN$!!        ',
  '       #$L `"*e$b  "N  #c                 ?$$$$E  "#BB$P` .o$$*#""""*Nbe        ',
  ' .uuuuu."$o    """   #c #c\'$               #$$$$$N   `"` d$$"          `N.     ',
  ' ```````"^""    .     "  %\'$ ..             "t$$$$ou... !**"            "$     ',
  '    ....   -m**+X?!+.      *$*".             3$P*""""**                  ?&     ',
  ':ed*$$"""        `          .e*#             9E...... `=.                <$k    ',
  '  ..$"        .um***o.       #*mx         \'"%$$$$$$$$$No"u      <$&  d$>  #E   ',
  ' """$     m*"""`     `   .   =mu.        -x..." " "<"<#R "`     4$F  $$"  .6    ',
  '    $                   -*P   u.`         uU$$          "       \'#\\uudNood$$* ',
  '    $       o   e           .$#"        **(                     .o$$$$$$$$$$Ru  ',
  '    $       $k  $k        .u$b.            "$R           X<.:   ?$$$$$$$R$$$$$  ',
  '    $>      @P* ""        ""`^#o          i).-          ""$$k    $$$$$$$$$$$$   ',
  "    @&      $                  $           .uudbr         '$$NL  '\"$B$$$$$R$F  ",
  '    *$:     "moe$         .  .$"           ` x"           \'$$$$$Nbu.`"?7D@#`   ',
  '     $!       ^"         u$****             \'*@#")..x      #$$B$F `` """`      ',
  '     $k          ...    @P"                     """"  xe    #B$F .              ',
  '      $o.    ""*$$$$  .$"                             \'#$u.    .d#             ',
  '       "$e..         .$`                                "*RNeed*"               ',
  'MiseEnPlace',
  '(Press <Space> to begin)',
  '',
  '',
  '',
  '',
}




now(
  function()
    add({
      source = "nvimdev/dashboard-nvim",
    })
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        header = bannertext, --your header
        shortcut = {
          -- action can be a function type
          -- { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
          { desc = 'Projects', group = '@variable', key = 'p', action = 'Telescope project' },
          { desc = 'Colorscheme', group = '@variable', key = 'c', action = 'Telescope colorscheme' },
        },
        packages = { enable = false }, -- show how many plugins neovim loaded
        -- limit how many projects list, action when you press key or enter it will run this action.
        -- action can be a functino type, e.g.
        -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
        project = { enable = false, limit = 3, icon = '', label = '', action = 'Telescope project' },
        mru = { enable = false, limit = 4, icon = ' MRU', label = '', cwd_only = false },
        footer = {}, -- footer
      }
    }
  end
)


-- require('pckr').add{
-- 	{'nvimdev/dashboard-nvim'}; 
--   config = function()
--     require('dashboard').setup {
--       theme = 'hyper',
--       config = {
--         header = bannertext, --your header
--         shortcut = {
--           -- action can be a function type
--           -- { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
--           { desc = 'Projects', group = '@variable', key = 'p', action = 'Telescope project' },
--           { desc = 'Colorscheme', group = '@variable', key = 'c', action = 'Telescope colorscheme' },
--         },
--         packages = { enable = false }, -- show how many plugins neovim loaded
--         -- limit how many projects list, action when you press key or enter it will run this action.
--         -- action can be a functino type, e.g.
--         -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
--         project = { enable = false, limit = 3, icon = '', label = '', action = 'Telescope project' },
--         mru = { enable = true, limit = 4, icon = ' MRU', label = '', cwd_only = false },
--         footer = {}, -- footer
--       }
--     }
--   end,
--   dependencies = { { 'nvim-tree/nvim-web-devicons' } },
-- }













-- require('pckr').add{
-- 	{'nvimdev/dashboard-nvim'}; 
--   config = function()
--     require('dashboard').setup {
--       theme = 'hyper',
--       config = {
--         header = bannertext, --your header
--         shortcut = {
--           -- action can be a function type
--           -- { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
--           { desc = 'Projects', group = '@variable', key = 'p', action = 'Telescope project' },
--           { desc = 'Colorscheme', group = '@variable', key = 'c', action = 'Telescope colorscheme' },
--         },
--         packages = { enable = false }, -- show how many plugins neovim loaded
--         -- limit how many projects list, action when you press key or enter it will run this action.
--         -- action can be a functino type, e.g.
--         -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
--         project = { enable = false, limit = 3, icon = '', label = '', action = 'Telescope project' },
--         mru = { enable = true, limit = 4, icon = ' MRU', label = '', cwd_only = false },
--         footer = {}, -- footer
--       }
--     }
--   end,
--   dependencies = { { 'nvim-tree/nvim-web-devicons' } },
-- }




-- return {
--   'nvimdev/dashboard-nvim',
--   event = 'VimEnter',
--   config = function()
--     require('dashboard').setup {
--       -- theme = 'doom',
--       -- config = {
--       --   header = bannertext, --your header
--       --   center = {
--       --     -- {
--       --     --   icon = ' ',
--       --     --   icon_hl = 'Title',
--       --     --   desc = 'Find File           ',
--       --     --   desc_hl = 'String',
--       --     --   key = 'b',
--       --     --   -- keymap = 'SPC f f',
--       --     --   key_hl = 'Number',
--       --     --   key_format = ' %s', -- remove default surrounding `[]`
--       --     --   action = 'lua print(2)',
--       --     -- },
--       --     {
--       --       icon = ' ',
--       --       desc = 'Projects',
--       --       key = 'p',
--       --       -- keymap = 'SPC f d',
--       --       key_format = ' %s', -- remove default surrounding `[]`
--       --       action = 'Telescope project',
--       --     },
--       --   },
--       --   footer = {}, --your footer
--       -- },
-- 
--       theme = 'hyper',
-- 
--       config = {
--         header = bannertext, --your header
--         shortcut = {
--           -- action can be a function type
--           -- { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
--           { desc = 'Projects', group = '@variable', key = 'p', action = 'Telescope project' },
--           { desc = 'Colorscheme', group = '@variable', key = 'c', action = 'Telescope colorscheme' },
--         },
--         packages = { enable = false }, -- show how many plugins neovim loaded
--         -- limit how many projects list, action when you press key or enter it will run this action.
--         -- action can be a functino type, e.g.
--         -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
--         project = { enable = false, limit = 3, icon = '', label = '', action = 'Telescope project' },
--         mru = { enable = true, limit = 4, icon = ' MRU', label = '', cwd_only = false },
--         footer = {}, -- footer
--       }
--     }
--   end,
--   requires = { { 'nvim-tree/nvim-web-devicons' } },
-- }
