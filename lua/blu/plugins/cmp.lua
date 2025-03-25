local M = {
	{"hrsh7th/cmp-nvim-lsp",
  dependencies = {
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"},
    {"hrsh7th/nvim-cmp"},
    {"L3MON4D3/LuaSnip"},
    {"saadparwaiz1/cmp_luasnip"},
  },
  opts = {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {},

    },
  }
}

return M
