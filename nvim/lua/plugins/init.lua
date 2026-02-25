return {
  -- the colorscheme should be available when starting Neovim
--  {
--    "folke/tokyonight.nvim",
--    lazy = false, -- make sure we load this during startup if it is your main colorscheme
--    priority = 1000, -- make sure to load this before all the other start plugins
--    config = function()
      -- load the colorscheme here
--      vim.cmd([[colorscheme tokyonight]])
--    end,
 -- },
 { "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
    end,
},

  -- cmp
   {import = "plugins.nvim-cmp"    -- load cmp on InsertEnter
  },

  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ~/.config/nvim/lua/plugins/treesitter.lua
   {import = "plugins.treesitter" },
-- autobrackets
 {"cohama/lexima.vim"
 },
-- fancy line. ~/.config/nvim/lua/plugins/lualine.lua
 {
    import = "plugins.lualine"
},
 -- needed for telescope
 {"nvim-lua/plenary.nvim"},
-- that fella 
 { import = "plugins.telescope" },

 -- nvim tree for sidebar access, remappeed to ctrl n
 { import = "plugins.nvim-tree" },

 -- latex stuff
 { import = "plugins.vimtex" }
   }



