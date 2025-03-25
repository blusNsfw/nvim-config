return {
	"nvim-treesitter/nvim-treesitter",
	build=":TSUpdate",
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"rust",
			"zig",
		}
	},
}
