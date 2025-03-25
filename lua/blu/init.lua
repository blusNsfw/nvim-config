require("blu.mappings")
require("blu.options")

require("lazy").setup({
	spec = {
		import = "blu.plugins"
	},
	install = {},
	checker = { enabled = true, notify = false },
})

require("blu.lsp")
require("blu.cmp_setup")
