--"grammars" lsp are managed here 
--so that what you press "aa" you can open a tab and modifiy/ignore an error/do you biddings

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"tex", "plaintex", "markdown", "bib"}, -- I stopped using harper
  callback = function()
    vim.lsp.start({
      name = "harper-ls",
      cmd = { "harper-ls", "--stdio"},
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

local ltex_extra = require("ltex_extra")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "DISABLED" },
  callback = function()
    vim.lsp.start({
      name = "ltex",
      cmd = { "ltex-ls-plus" },
      root_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h"),
      on_attach = function(client, bufnr)
        ltex_extra.setup({
          load_langs = { "en-US" },
          init_check = true,       
          path = vim.fn.expand("~/.config/nvim/ltex_metadata"),  -- global dict    
          log_level = "info",
        })
      end,
      settings = {
        ltex = {
          enabled = {'tex', 'markdown'},
          language = "en-US",
          additionalRules = {
            enablePickyRules = true,
            motherTongue = "en-US",
            languageModel = vim.fn.expand("~/.config/ngrams")
          },
          checkTarget = "latex", 
          dictionary = {
            ["en-US"] = {},
          },
          latex = {
            commands = {
              ["\\cite{}"] = "ignore",
              ["\\ref{}"] = "ignore",
            },
          },
        },
      },
    })
    

--    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
  --    undercurl = true,
  --    sp = "#f38ba8", 
  --  })

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
