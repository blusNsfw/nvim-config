require("blu.mappings")
require("blu.options")

require("lazy").setup({
	spec = {
		import = "blu.plugins"
	},
	install = {},
	checker = { enabled = true },
})

require("blu.lsp")
