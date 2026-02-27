vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "plaintex" },
  callback = function()
    vim.lsp.start({
      name = "harper-ls",
      cmd = { "harper-ls", "--stdio" },
      root_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h"),
    })

    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
    undercurl = true,
    sp = "#f38ba8", --mauve ish to fit better
   })

    vim.diagnostic.config({
      signs = false,
      virtual_text = false,
      underline = { severity = { min = vim.diagnostic.severity.HINT },
      },
    })
  end,
  desc = "Start Harper grammar checker for markdown and tex files",
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
    })
  end,
  desc = "Show diagnostic popup on cursor hold",
})
