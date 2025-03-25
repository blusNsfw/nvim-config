require("cmp").setup({
  sources = require("cmp").config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = "buffer" },
  })
})

require("cmp").setup.cmdline(':', {
  mapping = require("cmp").mapping.preset.cmdline(),
  sources = require("cmp").config.sources({
    { name = "path" }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_no_prefix_matching = false }
})

require("cmp").setup.cmdline('/', {
  mapping = require("cmp").mapping.preset.cmdline(),
  sources = {
    {name = 'buffer'}
  }
})
