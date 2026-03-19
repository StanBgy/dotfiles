--"grammars" lsp are managed here 
--so that what you press "aa" you can open a tab and modifiy/ignore an error/do you biddings

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "DISABLED" }, -- I stopped using harper
  callback = function()
    vim.lsp.start({
      name = "harper-ls",
      cmd = { "harper-ls"},
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


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "plaintex", "bib" },
  callback = function()
    vim.lsp.start({
      name = "ltex",
      cmd = { "ltex-ls-plus" },
      root_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h"),
      settings = {
        ltex = {
          enabled = {'tex', 'markdown'},
          language = "en-US",
          additionalRules = {
            enablePickyRules = true, -- The "Grammarly Premium" mode
            motherTongue = "en-US",
          },
          checkTarget = "latex", -- Crucial for .tex files
          -- Academic dictionary: add your common terms here
          dictionary = {
            ["en-US"] = { "IEEE", "backpropagation", "hyperparameter" },
          },
          -- Ignore math and common commands
          latex = {
            commands = {
              ["\\cite{}"] = "ignore",
              ["\\ref{}"] = "ignore",
            },
          },
        },
      },
    })

    -- Your custom "Mauve" undercurl for grammar hints
--    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
  --    undercurl = true,
  --    sp = "#f38ba8", 
  --  })

    -- Clean UI: No signs or virtual text, just the undercurl
    vim.diagnostic.config({
      signs = false,
      virtual_text = false,
      underline = { 
        severity = { min = vim.diagnostic.severity.HINT } 
      },
    })
  end,
  desc = "Start LTeX+ grammar checker for academic papers",
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
