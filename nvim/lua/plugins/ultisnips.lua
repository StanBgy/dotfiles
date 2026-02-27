return {
    "sirver/ultisnips",
    config = function()
        -- Key mappings for UltiSnips
        vim.g.UltiSnipsExpandTrigger = "<tab>"        -- Use tab to expand snippets
        vim.g.UltiSnipsJumpForwardTrigger = "<tab>"   -- Tab to jump to next placeholder
        vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>" -- Shift+Tab to jump back
        vim.g.UltiSnipsEditSplit = "vertical"         -- Edit snippets in vertical split
        
        -- Set the directory where custom snippets live
        vim.g.UltiSnipsSnippetDirectories = { "UltiSnips"}
    end,
}
