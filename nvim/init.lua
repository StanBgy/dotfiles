vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
require("options")
require('keymaps')
require('lualine').setup()


-- lsps 

vim.lsp.config('pyright', {
	on_attach = on_attach,
	capabilities = capabilities
})

vim.lsp.enable('pyright')
vim.lsp.enable('lua_ls')
