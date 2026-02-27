return {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "onsails/lspkind.nvim",
      "quangnguyen30192/cmp-nvim-ultisnips", 
      "micangl/cmp-vimtex",
    },
    config = function()
	    local cmp = require("cmp")
	    local lspkind = require("lspkind")
        local cmp_ultisnips = require("cmp_nvim_ultisnips")
	cmp.setup({
	  mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
	    ['<Esc>'] = cmp.mapping.close(),
	    ['<CR>'] = cmp.mapping.confirm({ select = true }),
	    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	    ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  },
	  sources = {
	    { name = 'nvim_lsp' }, -- For nvim-lsp
        { name = 'vimtex' }, -- Latex completion
	    { name = 'ultisnips' }, -- For ultisnips user.
	    { name = 'nvim_lua' }, -- for nvim lua function
	    { name = 'path' }, -- for path completion
	    { name = 'buffer', keyword_length = 4 }, -- for buffer word completion
	    { name = 'emoji', insert = true, } -- emoji completion
	  },
	  completion = {
	    keyword_length = 1,
	    completeopt = "menu, menuone,noselect, noinsert"
	  },
	  view = {
	    entries = 'custom',
	  },
	  snippet = { expand = function(args) 
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
	  formatting = {
	    format = lspkind.cmp_format({
	      mode = "symbol_text",
	      menu = {
		nvim_lsp = "[LSP]",
		ultisnips = "[US]",
		nvim_lua = "[Lua]",
		path = "[Path]",
		buffer = "[Buffer]",
		emoji = "[Emoji]",
	      },
	    }),
	  },
	})
    end,
  }

