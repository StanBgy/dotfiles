local map = vim.keymap.set
map("n", ";f", "<cmd>Telescope find_files<cr>", {silent = true})
map("n", ";r", "<cmd>Telescope live_grep<cr>", {silent = true})
map("n", "//", "<cmd>Telescope buffers<cr>", {silent = true})
map("n", ";;", "<cmd>Telescope help_tags<cr>", {silent = true})

map("n", "<C-n>", ":NvimTreeToggle<CR>")
