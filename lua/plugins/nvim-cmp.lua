return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter', -- Lazy load the plugin when entering insert mode
  dependencies = {
    'L3MON4D3/LuaSnip', -- Required snippet engine
    'saadparwaiz1/cmp_luasnip', -- LuaSnip completion source
    'hrsh7th/cmp-nvim-lsp', -- LSP completion source
    'hrsh7th/cmp-buffer', -- Buffer completion source
    'hrsh7th/cmp-path', -- Path completion source
    'hrsh7th/nvim-lspconfig', -- Required for LSP functionality
  },
  config = function()
    -- Configuration will go here
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
}
