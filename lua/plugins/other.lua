
-- https://github.com/rgroli/other.nvim


local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({
    source = 'rgroli/other.nvim',
    dependencies = 'echasnovski/mini.icons',
  })
  require("other-nvim").setup({

      mappings = {
        {
          pattern = '/source/main/(.*)/(.*).java',
          target = '/source/test/%1/%2Test.java',
          -- transformer = 'lowercase',
          context = 'test',
        },
        {
          pattern = '/source/main/(.*)/(.*).java',
          target = '/../examples/source/main/java/edu/msu/sapphire/examples/%2Ex.java',
          -- transformer = 'lowercase',
          context = 'test',
        },


        {
          pattern = '/include/(.*)/(.*).hpp',
          target = '/tests/%2_tests.cpp',
          -- transformer = 'lowercase',
          context = 'test',
        },

        {
          pattern = '/include/(.*)/(.*).hpp',
          target = '/examples/%2_example.cpp',
          -- transformer = 'lowercase',
          context = 'example',
        },

        {
          pattern = '/include/(.*)/(.*).hpp',
          target = '/source/%2.cpp',
          -- transformer = 'lowercase',
          context = 'example',
        },


        {
          pattern = '/include/(.*)/(.*).hpp',
          target = '/source/%2.cpp',
          -- transformer = 'lowercase',
          context = 'example',
        },

        {
          pattern = '/source/(.*).cpp',
          target = '/tests/%1_tests.cpp',
          context = 'tests',
        },

        {
          pattern = '/include/(.*).hpp',
          target = {
            {
              target = '/source/%1.cpp', -- Include
              context = 'source',
            },
            {
              target = '/tests/%1_tests.cpp', -- Test
              context = 'tests',
            },
            {
              target = '/examples/%1_example.cpp', -- Example
              context = 'example',
            },
          },
        },

        {
          pattern = '/source/(.*).cpp',
          target = {
            {
              target = '/include/%1.hpp', -- Include
              context = 'include',
            },
            {
              target = '/tests/%1_tests.cpp', -- Test
              context = 'tests',
            },
            {
              target = '/examples/%1_example.cpp', -- Example
              context = 'example',
            },
          },
        },

        {
          pattern = '/examples/(.*).cpp',
          target = {

            {
              target = '/source/%1.cpp',
              context = 'source',
              transformer = 'remove_example',
            },

            {
              target = '/tests/%1_tests.cpp',
              context = 'tests',
              transformer = 'remove_example',
            },

            {
              target = '/include/%1.hpp',
              context = 'include',
              transformer = 'remove_example',
            },
          },
          transformers = 'remove_example',
        },

      },
      transformers = {
        -- defining a custom transformer
        lowercase = function(inputString)
          return inputString:lower()
        end,

        remove_example = function(inputString)
          return inputString:gsub('_example', '')
        end,
      },

      style = {
        -- How the plugin paints its window borders
        -- Allowed values are none, single, double, rounded, solid and shadow
        border = 'solid',

        -- Column seperator for the window
        seperator = '|',

        -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
        width = 0.7,

        -- min height in rows.
        -- when more columns are needed this value is extended automatically
        minHeight = 5,
      },
    })
  end
)



-- require('pckr').add{
--   'rgroli/other.nvim',
--   config = function()
--     require('other-nvim').setup {
--       mappings = {
--         -- {{{ java
--         {
--           pattern = '/source/main/(.*)/(.*).java',
--           target = '/source/test/%1/%2Test.java',
--           -- transformer = 'lowercase',
--           context = 'test',
--         },
--         {
--           pattern = '/source/main/(.*)/(.*).java',
--           target = '/../examples/source/main/java/edu/msu/sapphire/examples/%2Ex.java',
--           -- transformer = 'lowercase',
--           context = 'test',
--         },
--
--         -- }}} java
--
--         -- {{{ hpp
--         {
--           pattern = '/include/(.*)/(.*).hpp',
--           target = '/tests/%2_tests.cpp',
--           -- transformer = 'lowercase',
--           context = 'test',
--         },
--
--         {
--           pattern = '/include/(.*)/(.*).hpp',
--           target = '/examples/%2_example.cpp',
--           -- transformer = 'lowercase',
--           context = 'example',
--         },
--
--         {
--           pattern = '/include/(.*)/(.*).hpp',
--           target = '/source/%2.cpp',
--           -- transformer = 'lowercase',
--           context = 'example',
--         },
--
--
--         {
--           pattern = '/include/(.*)/(.*).hpp',
--           target = '/source/%2.cpp',
--           -- transformer = 'lowercase',
--           context = 'example',
--         },
--
--
--         -- }}} hpp
--
--         -- {{{ cpp
--
--         -- {
--         --   pattern = '/source/(.*)/(.*).cpp',
--         --   target = '/test/%2_tests.cpp',
--         --   -- transformer = 'lowercase',
--         --   context = 'test',
--         -- },
--
--         {
--           pattern = '/source/(.*).cpp',
--           target = '/tests/%1_tests.cpp',
--           -- transformer = 'lowercase',
--           context = 'tests',
--         },
--
--         {
--           pattern = '/include/(.*).hpp',
--           target = {
--             {
--               target = '/source/%1.cpp', -- Include
--               context = 'source',
--             },
--             {
--               target = '/tests/%1_tests.cpp', -- Test
--               context = 'tests',
--             },
--             {
--               target = '/examples/%1_example.cpp', -- Example
--               context = 'example',
--             },
--           },
--         },
--
--         {
--           pattern = '/source/(.*).cpp',
--           target = {
--             {
--               target = '/include/%1.hpp', -- Include
--               context = 'include',
--             },
--             {
--               target = '/tests/%1_tests.cpp', -- Test
--               context = 'tests',
--             },
--             {
--               target = '/examples/%1_example.cpp', -- Example
--               context = 'example',
--             },
--           },
--         },
--
--         {
--           pattern = '/examples/(.*).cpp',
--           target = {
--
--             {
--               target = '/source/%1.cpp',
--               context = 'source',
--               transformer = 'remove_example',
--             },
--
--             {
--               target = '/tests/%1_tests.cpp',
--               context = 'tests',
--               transformer = 'remove_example',
--             },
--
--             {
--               target = '/include/%1.hpp',
--               context = 'include',
--               transformer = 'remove_example',
--             },
--           },
--           transformers = 'remove_example',
--         },
--
--         -- {{{ old
--         -- { --
--         --   pattern = '/tests/(.*).cpp',
--         --   target = {
--         --     {
--         --       target = '/source/%1.cpp',
--         --       context = 'source',
--         --       transformer = 'remove_example',
--         --     },
--
--         --     {
--         --       target = '/include/%1_tests.cpp',
--         --       context = 'tests',
--         --       transformer = 'remove_example',
--         --     },
--
--         --     {
--         --       target = '/include/%1.hpp',
--         --       context = 'include',
--         --       transformer = 'remove_example',
--         --     },
--         --   },
--         --   transformers = 'remove_example',
--         -- },
--
--         -- {
--         --   pattern = '/source/(.*)/(.*).cpp',
--         --   target = '/source/%2.cpp',
--         --   -- transformer = 'lowercase',
--         --   context = 'example',
--         -- },
--
--         -- { -- NOTE: this doesn't seem needed
--         --   pattern = '/source/(.*).cpp',
--         --   target = '/source/%1.cpp',
--         --   -- transformer = 'lowercase',
--         --   context = 'test',
--         -- },
--         --
--         -- }}} old
--       },
--       transformers = {
--         -- defining a custom transformer
--         lowercase = function(inputString)
--           return inputString:lower()
--         end,
--
--         remove_example = function(inputString)
--           return inputString:gsub('_example', '')
--         end,
--       },
--
--       style = {
--         -- How the plugin paints its window borders
--         -- Allowed values are none, single, double, rounded, solid and shadow
--         border = 'solid',
--
--         -- Column seperator for the window
--         seperator = '|',
--
--         -- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
--         width = 0.7,
--
--         -- min height in rows.
--         -- when more columns are needed this value is extended automatically
--         minHeight = 5,
--       },
--     }
--   end,
-- }
