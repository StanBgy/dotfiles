-- bunch of settings

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

-- background color
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.cmdheight = 1 
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.cursorline = true

-- 
vim.opt.encoding ='utf-8'
vim.opt.fileencoding = 'utf-8'

vim.cmd.colorscheme "catppuccin"
vim.opt.numberwidth = 2

-- remove diagnostics
vim.diagnostic.config({
  signs = false,
  virtual_text = false,
  underline = false,
})
