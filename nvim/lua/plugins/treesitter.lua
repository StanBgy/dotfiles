return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = { "lua", "python", "tex" },
            auto_install = true,
        })
	vim.api.nvim_create_autocmd("FileType", {
        callback = function()
            pcall(vim.treesitter.start)
        end,
    })
    end,
}
-- F THIS 
