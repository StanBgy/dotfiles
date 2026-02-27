vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
require("options")
require('keymaps')
require('autocmds')
require('lualine').setup()



-- lsps 


vim.lsp.enable('pyright')
vim.lsp.enable('lua_ls')
vim.lsp.enable('harper-ls')
